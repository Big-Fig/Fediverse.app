import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/remote_status_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);

    return Scaffold(
      appBar: FediPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: const _StatusThreadAppBarStarterAccountWidget(),
      ),
      body: SafeArea(
        child: FediAsyncInitLoadingWidget(
          asyncInitLoadingBloc: statusThreadBloc,
          loadingFinishedBuilder: (context) => const StatusThreadWidget(),
        ),
      ),
    );
  }

  const StatusThreadPage();
}

class _StatusThreadAppBarStarterAccountWidget extends StatelessWidget {
  const _StatusThreadAppBarStarterAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: long-method
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);
    var isLocal = statusThreadBloc.instanceLocation == InstanceLocation.local;

    return StreamBuilder<IStatus?>(
      stream: statusThreadBloc.firstStatusInThreadStream,
      builder: (context, snapshot) {
        var status = snapshot.data;

        if (status != null) {
          var account = status.reblog?.account ?? status.account;

          return Provider<IStatus>.value(
            value: status,
            child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, value, previous) {
                if (isLocal) {
                  // todo: refactor
                  if (value.remoteId == previous?.remoteId) {
                    return previous!;
                  } else {
                    return LocalStatusBloc.createFromContext(
                      context,
                      status: status,
                      isNeedWatchLocalRepositoryForUpdates: false,
                    );
                  }
                } else {
                  return RemoteStatusBloc.createFromContext(
                    context,
                    status: status,
                  );
                }
              },
              child: DisposableProxyProvider<IStatusBloc, IStatusSensitiveBloc>(
                update: (context, statusBloc, _) =>
                    StatusSensitiveBloc.createFromContext(
                  context: context,
                  statusBloc: statusBloc,
                ),
                child: Provider<IAccount>.value(
                  value: account,
                  child: DisposableProxyProvider<IAccount, IAccountBloc>(
                    update: (context, value, previous) {
                      var isNeedWatchWebSocketsEvents = false;
                      var isNeedRefreshFromNetworkOnInit = false;
                      var isNeedWatchLocalRepositoryForUpdates = false;
                      var isNeedPreFetchRelationship = false;
                      if (isLocal) {
                        // todo: refactor
                        return LocalAccountBloc.createFromContext(
                          context,
                          account: account,
                          isNeedWatchWebSocketsEvents:
                              isNeedWatchWebSocketsEvents,
                          isNeedRefreshFromNetworkOnInit:
                              isNeedRefreshFromNetworkOnInit,
                          isNeedWatchLocalRepositoryForUpdates:
                              isNeedWatchLocalRepositoryForUpdates,
                          isNeedPreFetchRelationship:
                              isNeedPreFetchRelationship,
                        );
                      } else {
                        return RemoteAccountBloc.createFromContext(
                          context,
                          account: account,
                          isNeedRefreshFromNetworkOnInit:
                              isNeedRefreshFromNetworkOnInit,
                        );
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        // todo: refactor
                        if (isLocal) {
                          goToLocalAccountDetailsPage(
                            context,
                            account: account,
                          );
                        } else {
                          goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
                            context,
                            remoteInstanceAccount: account,
                          );
                        }
                      },
                      child: const _StatusThreadStarterAccountBodyWidget(),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Text(
            S.of(context).app_status_thread_start_loading,
            style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
          );
        }
      },
    );
  }
}

class _StatusThreadStarterAccountBodyWidget extends StatelessWidget {
  const _StatusThreadStarterAccountBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Row(
            children: [
              const AccountAvatarWidget(
                imageSize: FediSizes.appBarAvatarSize,
                progressSize: FediSizes.appBarAvatarSize * 0.8,
              ),
              const FediBigHorizontalSpacer(),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AccountDisplayNameWidget(),
                    const AccountAcctWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: FediPadding.horizontalBigPadding,
          child: StatusCreatedAtWidget(),
        ),
      ],
    );
  }
}

import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: const _StatusThreadStarterAccountWidget(),
      ),
      body: const SafeArea(
        child: StatusThreadWidget(),
      ),
    );
  }

  const StatusThreadPage();
}

class _StatusThreadStarterAccountWidget extends StatelessWidget {
  const _StatusThreadStarterAccountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);

    return StreamBuilder<IStatus>(
        stream: statusThreadBloc.firstStatusInThreadStream,
        builder: (context, snapshot) {
          var status = snapshot.data;
          var account = status?.account;

          if (status == null) {
            return Text(
              S.of(context).app_status_thread_start_loading,
              style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
            );
          }

          return Provider.value(
            value: status,
            child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, value, previous) =>
                  StatusBloc.createFromContext(context, status,
                      isNeedWatchLocalRepositoryForUpdates: false),
              child: DisposableProxyProvider<IStatusBloc, IStatusSensitiveBloc>(
                update: (context, statusBloc, _) =>
                    StatusSensitiveBloc.createFromContext(
                  context: context,
                  statusBloc: statusBloc,
                ),
                child: Provider.value(
                  value: account,
                  child: DisposableProxyProvider<IAccount, IAccountBloc>(
                    update: (context, value, previous) =>
                        AccountBloc.createFromContext(
                      context,
                      account: account,
                      isNeedWatchWebSocketsEvents: false,
                      isNeedRefreshFromNetworkOnInit: false,
                      isNeedWatchLocalRepositoryForUpdates: false,
                      isNeedPreFetchRelationship: false,
                    ),
                    child: InkWell(
                      onTap: () {
                        goToAccountDetailsPage(context, account);
                      },
                      child: const _StatusThreadStarterAccountBodyWidget(),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _StatusThreadStarterAccountBodyWidget extends StatelessWidget {
  const _StatusThreadStarterAccountBodyWidget({
    Key key,
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
        )
      ],
    );
  }
}

void goToStatusThreadPage(
  BuildContext context, {
  @required IStatus status,
  @required IMastodonMediaAttachment initialMediaAttachment,
}) {
  Navigator.push(
    context,
    createStatusThreadPageRoute(
      status: status,
      initialMediaAttachment: initialMediaAttachment,
    ),
  );
}

MaterialPageRoute createStatusThreadPageRoute({
  @required IStatus status,
  @required IMastodonMediaAttachment initialMediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IStatusThreadBloc>(
      create: (context) => StatusThreadBloc(
        statusRepository: IStatusRepository.of(context, listen: false),
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        initialStatusToFetchThread: status,
        initialMediaAttachment: initialMediaAttachment,
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
      ),
      child: ThreadPostStatusBloc.provideToContext(
        context,
        inReplyToStatus: status,
        child: const StatusThreadPage(),
      ),
    ),
  );
}

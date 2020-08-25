import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FediSubPageCustomAppBar(
          leading: FediBackIconButton(),
          child: buildStatusStarterAccountWidget(context),
        ),
        body: SafeArea(child: StatusThreadWidget()));
  }

  Widget buildStatusStarterAccountWidget(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    return StreamBuilder<IStatus>(
        stream: statusThreadBloc.firstStatusInThreadStream,
        initialData: statusThreadBloc.firstStatusInThread,
        builder: (context, snapshot) {
          var status = snapshot.data;
          var account = status?.account;

          if (status == null) {
            return Text(
              tr("app.status.thread.start.loading"),
              style: FediTextStyles.mediumShortDarkGrey,
            );
          }

          return Provider.value(
            value: status,
            child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, value, previous) =>
                  StatusBloc.createFromContext(context, status,
                      isNeedWatchLocalRepositoryForUpdates: false),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Row(
                            children: [
                              AccountAvatarWidget(
                                imageSize: FediSizes.appBarAvatarSize,
                                progressSize: FediSizes.appBarAvatarSize * 0.8,
                              ),
                              const FediBigHorizontalSpacer(),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AccountDisplayNameWidget(),
                                    AccountAcctWidget(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: FediPadding.horizontalBigPadding,
                          child: StatusCreatedAtWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

void goToStatusThreadPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    createStatusThreadPageRoute(status),
  );
}

MaterialPageRoute createStatusThreadPageRoute(IStatus status) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IStatusThreadBloc>(
      create: (context) => StatusThreadBloc(
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          initialStatusToFetchThread: status),
      child: ThreadPostStatusBloc.provideToContext(context,
          inReplyToStatus: status, child: StatusThreadPage()),
    ),
  );
}

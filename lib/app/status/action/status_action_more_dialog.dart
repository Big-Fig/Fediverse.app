import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/share/share_service.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/async/fedi_async_dialog.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void showStatusActionMoreDialog({
  @required BuildContext context,
  @required IStatusBloc statusBloc,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: StatusActionMoreDialogBody(
      statusBloc: statusBloc,
      cancelable: true,
    ),
  );
}

class StatusActionMoreDialogBody extends StatelessWidget {
  final IStatusBloc statusBloc;
  final bool cancelable;

  StatusActionMoreDialogBody({
    @required this.statusBloc,
    @required this.cancelable,
  });

  @override
  Widget build(BuildContext context) {
    IStatus status = statusBloc.status;
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(status);

    return ListView(
      shrinkWrap: true,
      children: [
        FediChooserDialogBody(
            title: tr("app.status.action.popup.title"),
            actions: [
              buildCopyAction(context, status),
              buildOpenInBrowserAction(context, status),
              buildShareAction(context, status),
            ],
            cancelable: false),
        if (!isStatusFromMe)
          DisposableProvider<IAccountBloc>(
            create: (context) => AccountBloc.createFromContext(
              context,
              account: statusBloc.account,
              isNeedWatchWebSocketsEvents: false,
              isNeedRefreshFromNetworkOnInit: false,
              isNeedWatchLocalRepositoryForUpdates: false,
              isNeedPreFetchRelationship: true,
            ),
            child: Builder(
              builder: (context) {
                var accountBloc = IAccountBloc.of(context, listen: false);
                return StreamBuilder<IPleromaAccountRelationship>(
                    initialData: accountBloc.accountRelationship,
                    stream: accountBloc.accountRelationshipStream,
                    builder: (context, snapshot) {
                      var accountRelationship = snapshot.data;

                      var title =
                          tr("app.status.action.popup.more_actions_for");
                      var content = "${status.account.acct}";
                      if (accountRelationship != null) {
                        return FediChooserDialogBody(
                            title: title,
                            content: content,
                            actions: [
                              buildAccountFollowAction(context, accountBloc),
                              buildAccountMessageAction(context, accountBloc),
                              buildAccountMuteAction(context, accountBloc),
                              buildAccountReportAction(context, accountBloc),
                              buildAccountBlockAction(context, accountBloc),
                            ],
                            cancelable: cancelable);
                      } else {
                        return FediChooserDialogBody(
                            title: title,
                            content: content,
                            actions: [],
                            loadingActions: true,
                            cancelable: cancelable);
                      }
                    });
              },
            ),
          ),
      ],
    );
  }

  DialogAction buildAccountReportAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          label: tr("app.account.action.report.label"),
          onAction: () async {
            var success = await doAsyncActionReport(context, accountBloc);

            if (success) {
              Navigator.of(context).pop();
            }
          });

  DialogAction buildAccountBlockAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          label: tr(accountBloc.accountRelationship?.blocking == true
              ? "app.account.action.unblock"
              : "app.account.action.block"),
          onAction: () async {
            await doAsyncOperationWithFediDialog(
                context: context,
                asyncCode: () async => accountBloc.toggleBlock());

            Navigator.of(context).pop();
          });

  DialogAction buildAccountMuteAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          label: tr(accountBloc.accountRelationship?.muting == true
              ? "app.account.action.unmute"
              : "app.account.action.mute"),
          onAction: () async {
            await doAsyncOperationWithFediDialog(
                context: context, asyncCode: () => accountBloc.toggleMute());

            Navigator.of(context).pop();
          });

  DialogAction buildAccountFollowAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          label: tr(accountBloc.accountRelationship?.following == true
              ? "app.account.action.unfollow"
              : "app.account.action.follow"),
          onAction: () async {
            await doAsyncOperationWithFediDialog(
                context: context, asyncCode: () => accountBloc.toggleFollow());

            Navigator.of(context).pop();
          });

  DialogAction buildAccountMessageAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          label: tr("app.account.action.message"),
          onAction: () {
            goToPostStatusStartConversationPage(context,
                conversationAccountsWithoutMe: <IAccount>[accountBloc.account]);
          });

  DialogAction buildOpenInBrowserAction(BuildContext context, IStatus status) =>
      DialogAction(
          label: tr("app.status.action.open_in_browser"),
          onAction: () async {
            var url = status.uri;
            await UrlHelper.handleUrlClick(context, url);
            Navigator.of(context).pop();
          });

  DialogAction buildCopyAction(BuildContext context, IStatus status) =>
      DialogAction(
          label: tr("app.status.action.copy_link"),
          onAction: () async {
            await Clipboard.setData(ClipboardData(text: status.uri));
            Navigator.of(context).pop();
            showInfoFediNotificationOverlay(
                contentText: tr("app.status.copy_link.toast"), titleText: null);
          });

  DialogAction buildShareAction(BuildContext context, IStatus status) =>
      DialogAction(
          label: tr("app.status.action.share"),
          onAction: () async {
            var popupTitle = tr("app.status.share.title");
            var progressMessage = tr("app.status.share.progress.content");

            await doAsyncOperationWithFediDialog(
                context: context,
                contentMessage: progressMessage,
                asyncCode: () async {
                  var shareService = IShareService.of(context, listen: false);

                  return shareService.shareStatus(
                      context: context, popupTitle: popupTitle, status: status);
                });
          });
}

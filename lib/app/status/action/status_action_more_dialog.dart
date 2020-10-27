import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_helper.dart';
import 'package:fedi/app/chat/share/chat_share_status_page.dart';
import 'package:fedi/app/conversation/share/conversation_share_status_page.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/share/external/external_share_status_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_action_more_dialog.dart");

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
            title: S.of(context).app_status_action_popup_title,
            actions: [
              if (isStatusFromMe) buildDeleteAction(context, status),
              if (isStatusFromMe) buildPinAction(context, status),
              if (isStatusFromMe) buildMuteConversationAction(context, status),
              buildBookmarkAction(context, status),
              buildCopyAction(context, status),
              buildOpenInBrowserAction(context, status),
              buildShareAction(context, status),
            ],
            cancelable: false),
        if (!isStatusFromMe) ...[
          FediUltraLightGreyDivider(
            height: 4,
          ),
          FediBigVerticalSpacer(),
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

                      _logger.finest(
                          () => "accountRelationship $accountRelationship");

                      var title =
                          S.of(context).app_status_action_popup_moreActionsFor;

                      var content = "${status.account.acct}";
                      // todo: remove hack
                      //  we should compare accountRelationship with null
                      if (accountRelationship?.following != null) {
                        return FediChooserDialogBody(
                            title: title,
                            content: content,
                            actions: [
                              buildAccountOpenInBrowserAction(
                                  context, accountBloc),
                              buildAccountFollowAction(context, accountBloc),
                              buildAccountMessageAction(context, accountBloc),
                              buildAccountMuteAction(context, accountBloc),
                              buildAccountReportAction(context, accountBloc),
                              buildAccountBlockAction(context, accountBloc),
                              if (accountBloc.isOnRemoteDomain)
                                buildAccountBlockDomainAction(
                                    context, accountBloc),
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
        ]
      ],
    );
  }

  DialogAction buildAccountReportAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          icon: FediIcons.report,
          label: S.of(context).app_account_action_report_label,
          onAction: (context) async {
            var success = await doAsyncActionReport(context, accountBloc);

            if (success) {
              Navigator.of(context).pop();
            }
          });

  DialogAction buildAccountBlockAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          icon: FediIcons.block,
          label: accountBloc.accountRelationship?.blocking == true
              ? S.of(context).app_account_action_unblock
              : S.of(context).app_account_action_block,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context,
                asyncCode: () async => accountBloc.toggleBlock());

            Navigator.of(context).pop();
          });

  DialogAction buildAccountBlockDomainAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
        icon: FediIcons.block,
        label: accountBloc.accountRelationship.domainBlocking == true
            ? S.of(context).app_account_action_unblockDomain(
                accountBloc.remoteDomainOrNull)
            : S
                .of(context)
                .app_account_action_blockDomain(accountBloc.remoteDomainOrNull),
        onAction: (context) async {
          await accountBloc.toggleBlockDomain();
          Navigator.of(context).pop();
        },
      );

  DialogAction buildAccountMuteAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
        icon: FediIcons.mute,
        label: accountBloc.accountRelationship?.muting == true
            ? S.of(context).app_account_action_unmute
            : S.of(context).app_account_action_mute,
        onAction: (context) async {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              context: context, asyncCode: () => accountBloc.toggleMute());

          Navigator.of(context).pop();
        },
      );

  DialogAction buildAccountFollowAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          icon: FediIcons.follow,
          label: accountBloc.accountRelationship?.following == true
              ? S.of(context).app_account_action_unfollow
              : S.of(context).app_account_action_follow,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context, asyncCode: () => accountBloc.toggleFollow());

            Navigator.of(context).pop();
          });

  DialogAction buildAccountMessageAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          icon: FediIcons.message,
          label: S.of(context).app_account_action_message,
          onAction: (context) async {
            var authInstanceBloc =
                ICurrentAuthInstanceBloc.of(context, listen: false);
            var account = accountBloc.account;

            if (authInstanceBloc.currentInstance.isSupportChats) {
              goToChatWithAccount(context: context, account: account);
            } else {
              goToPostStatusStartConversationPage(context,
                  conversationAccountsWithoutMe: <IAccount>[account]);
            }
          });

  DialogAction buildOpenInBrowserAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.browser,
          label: S.of(context).app_status_action_openInBrowser,
          onAction: (context) async {
            var url = status.url;
            await UrlHelper.handleUrlClick(context, url);
            Navigator.of(context).pop();
          });

  DialogAction buildAccountOpenInBrowserAction(
          BuildContext context, IAccountBloc accountBloc) =>
      DialogAction(
          icon: FediIcons.browser,
          label: S.of(context).app_account_action_openInBrowser,
          onAction: (context) async {
            var url = accountBloc.account.url;
            await UrlHelper.handleUrlClick(context, url);
            Navigator.of(context).pop();
          });

  DialogAction buildCopyAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.link,
          label: S.of(context).app_status_action_copyLink,
          onAction: (context) async {
            await Clipboard.setData(ClipboardData(text: status.uri));
            Navigator.of(context).pop();
            showInfoFediNotificationOverlay(
              context: context,
              contentText: S.of(context).app_status_copyLink_toast,
              titleText: null,
            );
          });

  DialogAction buildDeleteAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.remove,
          label: S.of(context).app_status_action_delete,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context, asyncCode: () => statusBloc.delete());

            Navigator.of(context).pop();
          });

  DialogAction buildPinAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.heart,
          label: status.pinned == true
              ? S.of(context).app_status_action_unpin
              : S.of(context).app_status_action_pin,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context, asyncCode: () => statusBloc.togglePin());

            Navigator.of(context).pop();
          });

  DialogAction buildMuteConversationAction(
          BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.mute,
          label: status.muted == true
              ? S.of(context).app_status_action_unmute
              : S.of(context).app_status_action_mute,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context, asyncCode: () => statusBloc.toggleMute());

            Navigator.of(context).pop();
          });

  DialogAction buildBookmarkAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.bookmark,
          label: status.bookmarked == true
              ? S.of(context).app_status_action_unbookmark
              : S.of(context).app_status_action_bookmark,
          onAction: (context) async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context, asyncCode: () => statusBloc.toggleBookmark());

            Navigator.of(context).pop();
          });

  DialogAction buildShareAction(BuildContext context, IStatus status) =>
      DialogAction(
          icon: FediIcons.share,
          label: S.of(context).app_share_action_share,
          onAction: (context) async {
            showShareChooserDialog(
              context,
              externalShareAction: () {
                Navigator.of(context).pop();
                goToExternalShareStatusPage(context: context, status: status);
              },
              conversationsShareAction: () {
                Navigator.of(context).pop();
                goToConversationShareStatusPage(
                    context: context, status: status);
              },
              chatsShareAction: () {
                Navigator.of(context).pop();
                goToChatShareStatusPage(context: context, status: status);
              },
            );
          });
}

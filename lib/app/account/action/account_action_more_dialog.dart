import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/mute/account_action_mute_dialog.dart';
import 'package:fedi/app/account/report/account_report_page.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_helper.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void showAccountActionMoreDialog({
  @required BuildContext context,
  @required IAccountBloc accountBloc,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: Provider<IAccountBloc>.value(
      value: accountBloc,
      child: Provider<IAccount>.value(
        value: accountBloc.account,
        child: const AccountActionMoreDialog(
          cancelable: true,
          showReportAction: false,
        ),
      ),
    ),
  );
}

class AccountActionMoreDialog extends StatelessWidget {
  final bool cancelable;
  final bool showReportAction;

  const AccountActionMoreDialog({
    @required this.cancelable,
    @required this.showReportAction,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    return StreamBuilder<IPleromaAccountRelationship>(
      stream: accountBloc.relationshipStream,
      builder: (context, snapshot) {
        var accountRelationship = snapshot.data;
        var loadingActions = accountRelationship == null;
        return FediChooserDialogBody(
          title: S.of(context).app_account_action_popup_title,
          content: "${accountBloc.acct}",
          actions: loadingActions
              ? []
              : [
                  AccountActionMoreDialog.buildAccountOpenInBrowserAction(
                      context),
                  AccountActionMoreDialog.buildAccountMuteAction(context),
                  AccountActionMoreDialog.buildAccountBlockAction(context),
                  if (accountBloc.isOnRemoteDomain)
                    AccountActionMoreDialog.buildAccountBlockDomainAction(
                        context),
                  if (showReportAction)
                    AccountActionMoreDialog.buildAccountReportAction(context),
                ],
          loadingActions: loadingActions,
          cancelable: cancelable,
        );
      },
    );
  }

  static DialogAction buildAccountReportAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    var statusBloc = IStatusBloc.of(context, listen: false);
    return DialogAction(
      icon: FediIcons.report,
      label: S.of(context).app_account_action_report_label,
      onAction: (context) async {
        goToAccountReportPage(
          context,
          account: accountBloc.account,
          statuses: [
            statusBloc.status,
          ],
        );
      },
    );
  }

  static DialogAction buildAccountBlockAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return DialogAction(
      icon: accountBloc.relationship?.blocking == true
          ? FediIcons.unblock
          : FediIcons.block,
      label: accountBloc.relationship?.blocking == true
          ? S.of(context).app_account_action_unblock
          : S.of(context).app_account_action_block,
      onAction: (context) async {
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
          context: context,
          asyncCode: () async => accountBloc.toggleBlock(),
        );

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildAccountBlockDomainAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return DialogAction(
      icon: accountBloc.relationship.domainBlocking == true
          ? FediIcons.domain_block
          : FediIcons.domain_unblock,
      label: accountBloc.relationship.domainBlocking == true
          ? S
              .of(context)
              .app_account_action_unblockDomain(accountBloc.remoteDomainOrNull)
          : S
              .of(context)
              .app_account_action_blockDomain(accountBloc.remoteDomainOrNull),
      onAction: (context) async {
        await accountBloc.toggleBlockDomain();
        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildAccountMuteAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    var muting = accountBloc.relationship?.muting == true;
    return DialogAction(
      icon: muting ? FediIcons.unmute : FediIcons.mute,
      label: muting
          ? S.of(context).app_account_action_unmute
          : S.of(context).app_account_action_mute,
      onAction: (context) async {
        if (muting) {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () => accountBloc.unMute(),
          );
          Navigator.of(context).pop();
        } else {
          showAccountActionMuteDialog(context, accountBloc);
        }
      },
    );
  }

  static DialogAction buildAccountFollowAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return DialogAction(
      icon: accountBloc.relationship?.following == true
          ? FediIcons.unfollow
          : FediIcons.follow,
      label: accountBloc.relationship?.following == true
          ? S.of(context).app_account_action_unfollow
          : S.of(context).app_account_action_follow,
      onAction: (context) async {
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context, asyncCode: () => accountBloc.toggleFollow());

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildAccountMessageAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return DialogAction(
      icon: FediIcons.message,
      label: S.of(context).app_account_action_message,
      onAction: (context) async {
        var authInstanceBloc =
            ICurrentAuthInstanceBloc.of(context, listen: false);
        var account = accountBloc.account;

        if (authInstanceBloc.currentInstance.isSupportChats) {
          goToPleromaChatWithAccount(
            context: context,
            account: account,
          );
        } else {
          goToPostStatusStartConversationPage(
            context,
            conversationAccountsWithoutMe: <IAccount>[
              account,
            ],
          );
        }
      },
    );
  }

  static DialogAction buildAccountOpenInBrowserAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return DialogAction(
      icon: FediIcons.browser,
      label: S.of(context).app_account_action_openInBrowser,
      onAction: (context) async {
        var url = accountBloc.account.url;
        await UrlHelper.handleUrlClick(context, url);
        Navigator.of(context).pop();
      },
    );
  }
}

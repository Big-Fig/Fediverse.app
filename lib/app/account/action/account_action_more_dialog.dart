import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';

void showAccountActionMoreDialog({
  @required BuildContext context,
  @required IAccountBloc accountBloc,
  @required IPleromaAccountRelationship relationship,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: AccountActionMoreDialogBody(
      accountBloc: accountBloc,
      relationship: relationship,
      cancelable: true,
    ),
  );
}

class AccountActionMoreDialogBody extends StatelessWidget {
  final IAccountBloc accountBloc;
  final IPleromaAccountRelationship relationship;
  final bool cancelable;

  AccountActionMoreDialogBody({
    @required this.accountBloc,
    @required this.relationship,
    @required this.cancelable,
  });

  @override
  Widget build(BuildContext context) => FediChooserDialogBody(
      title: S.of(context).app_account_action_popup_title,
      content: "${accountBloc.acct}",
      actions: [
        DialogAction(
            icon: FediIcons.browser,
            label: S.of(context).app_account_action_openInBrowser,
            onAction: (context) async {
              var url = accountBloc.account.url;
              await UrlHelper.handleUrlClick(context, url);
              Navigator.of(context).pop();
            }),
        DialogAction(
          icon: FediIcons.mute,
          label: relationship.muting
              ? S.of(context).app_account_action_unmute
              : S.of(context).app_account_action_mute,
          onAction: (context) async {
            await accountBloc.toggleMute();
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          icon: FediIcons.block,
          label: relationship.blocking
              ? S.of(context).app_account_action_unblock
              : S.of(context).app_account_action_block,
          onAction: (context) async {
            await accountBloc.toggleBlock();
            Navigator.of(context).pop();
          },
        ),
        if (accountBloc.isOnRemoteDomain)
          DialogAction(
            icon: FediIcons.block,
            label: relationship.domainBlocking
                ? S.of(context).app_account_action_unblockDomain(accountBloc
    .remoteDomainOrNull)
                : S.of(context).app_account_action_blockDomain(accountBloc
                .remoteDomainOrNull),
            onAction: (context) async {
              await accountBloc.toggleBlockDomain();
              Navigator.of(context).pop();
            },
          ),
        DialogAction(
            icon: FediIcons.report,
            label: S.of(context).app_account_action_report_label,
            onAction: (context) async {
              var success = await doAsyncActionReport(context, accountBloc);

              if (success) {
                Navigator.of(context).pop();
              }
            }),
      ],
      cancelable: cancelable);
}

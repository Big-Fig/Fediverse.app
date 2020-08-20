import 'package:easy_localization/easy_localization.dart';
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
      title: tr("app.account.action.popup.title"),
      content: "${accountBloc.acct}",
      actions: [
        DialogAction(
            icon: FediIcons.browser,
            label: tr("app.account.action.open_in_browser"),
            onAction: () async {
              var url = accountBloc.account.url;
              await UrlHelper.handleUrlClick(context, url);
              Navigator.of(context).pop();
            }),
        DialogAction(
          icon: FediIcons.mute,
          label: relationship.muting
              ? tr("app.account.action.unmute")
              : tr("app.account.action.mute"),
          onAction: () async {
            await accountBloc.toggleMute();
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          icon: FediIcons.block,
          label: relationship.blocking
              ? tr("app.account.action.unblock")
              : tr("app.account.action.block"),
          onAction: () async {
            await accountBloc.toggleBlock();
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
            icon: FediIcons.report,
            label: tr("app.account.action.report.label"),
            onAction: () async {
              var success = await doAsyncActionReport(context, accountBloc);

              if (success) {
                Navigator.of(context).pop();
              }
            }),
      ],
      cancelable: cancelable);
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
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
            label: relationship.muting
                ? tr("app.account.action.unmute")
                : tr("app.account.action.mute"),
            onAction: accountBloc.toggleMute),
        DialogAction(
            label: relationship.blocking
                ? tr("app.account.action.unblock")
                : tr("app.account.action.block"),
            onAction: accountBloc.toggleBlock),
        DialogAction(
            label: tr("app.account.action.report.label"),
            onAction: () async {
              var success = await doAsyncActionReport(
                  context, IAccountBloc.of(context, listen: false));

              if (success) {
                Navigator.of(context).pop();
              }
            }),
      ],
      cancelable: cancelable);
}

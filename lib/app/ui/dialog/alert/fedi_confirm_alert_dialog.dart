import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

class FediConfirmAlertDialog extends FediBaseAlertDialog {
  FediConfirmAlertDialog(
      {@required BuildContext context,
      @required DialogActionCallback onAction,
      String title,
      String contentText,
      String okActionLabel})
      : super(
            title: title,
      contentText: contentText,
            actions: [
              DialogAction(
                  label: okActionLabel ??
                      S.of(context).dialog_action_ok,
                  onAction: onAction)
            ],
            cancelable: true);
}

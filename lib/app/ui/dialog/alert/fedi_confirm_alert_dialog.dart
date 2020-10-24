import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

class FediConfirmAlertDialog extends FediBaseAlertDialog {
  FediConfirmAlertDialog(
      {@required BuildContext context,
      @required DialogActionCallback onAction,
      String title,
      String content,
      String okActionLabel})
      : super(
            title: title,
            content: content,
            actions: [
              DialogAction(
                  label: okActionLabel ??
                      tr("dialog.action.ok"),
                  onAction: onAction)
            ],
            cancelable: true);
}

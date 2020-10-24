import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

class FediYesNoAlertDialog extends FediBaseAlertDialog {
  FediYesNoAlertDialog({
    @required BuildContext context,
    @required DialogActionCallback yesAction,
    @required DialogActionCallback noAction,
    String title,
    String content,
    String yesActionLabel,
    String noActionLabel,
  }) : super(
            title: title,
            content: content,
            actions: [
              DialogAction(
                label: yesActionLabel ?? tr("dialog.action.yes"),
                onAction: yesAction,
              ),
              DialogAction(
                label: yesActionLabel ?? tr("dialog.action.no"),
                onAction: noAction,
              ),
            ],
            cancelable: false);
}

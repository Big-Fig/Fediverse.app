import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

class FediYesNoAlertDialog extends FediBaseAlertDialog {
  FediYesNoAlertDialog({
    @required BuildContext context,
    @required DialogActionCallback yesAction,
    @required DialogActionCallback noAction,
    String title,
    String contentText,
    String yesActionLabel,
    String noActionLabel,
  }) : super(
            title: title,
            contentText: contentText,
            actions: [
              DialogAction(
                label: yesActionLabel ?? S.of(context)
                    .dialog_action_yes,
                onAction: yesAction,
              ),
              DialogAction(
                label: yesActionLabel ?? S.of(context)
                    .dialog_action_no,
                onAction: noAction,
              ),
            ],
            cancelable: false);
}

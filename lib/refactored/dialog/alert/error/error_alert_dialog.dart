import 'package:easy_localization/easy_localization.dart';

import 'package:fedi/refactored/dialog/alert/base_alert_dialog.dart';
import 'package:fedi/refactored/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

class ErrorAlertDialog extends BaseAlertDialog {
  ErrorAlertDialog(
      {@required BuildContext context,
      @required VoidCallback onAction,
      String title,
      String content})
      : super(
            title: title,
            content: content,
            actions: [
              DialogAction(
                  label: AppLocalizations.of(context).tr("dialog.action"
                      ".ok"),
                  onAction: () {
                    Navigator.of(context).pop();
                  })
            ],
            cancelable: false);
}

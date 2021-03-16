import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_yes_no_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

FediBaseAlertDialog createAskFcmPushPermissionDialog({
  required BuildContext context,
  required DialogActionCallback yesAction,
  required DialogActionCallback noAction,
}) {
  return FediYesNoAlertDialog(
    title: S.of(context).app_push_permission_ask_dialog_title,
    contentText: S.of(context).app_push_permission_ask_dialog_content,
    context: context,
    yesAction: yesAction,
    noAction: noAction,
  );
}

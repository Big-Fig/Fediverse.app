import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_yes_no_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

FediBaseAlertDialog createAskFcmPushPermissionDialog({
  @required BuildContext context,
  @required DialogActionCallback yesAction,
  @required DialogActionCallback noAction,
}) {
  return FediYesNoAlertDialog(
    title: "app.notification.push.permission.ask.dialog.title".tr(),
    contentText: "app.notification.push.permission.ask.dialog.content".tr(),
    context: context,
    yesAction: yesAction,
    noAction: noAction,
  );
}

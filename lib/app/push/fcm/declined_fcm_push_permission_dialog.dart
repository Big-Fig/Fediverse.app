import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

FediBaseAlertDialog createDeclinedFcmPushPermissionDialog({
  @required BuildContext context,
  DialogActionCallback action,
}) =>
    FediSimpleAlertDialog(
      title: "app.notification.push.permission.declined.dialog.title".tr(),
      content: "app.notification.push.permission.declined.dialog.content".tr(),
      context: context,
      action: action,
    );

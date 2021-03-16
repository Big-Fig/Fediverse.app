import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

FediBaseAlertDialog createDeclinedFcmPushPermissionDialog({
  required BuildContext context,
  DialogActionCallback? action,
}) =>
    FediSimpleAlertDialog(
      title: S.of(context).app_push_permission_declined_dialog_title,
      contentText: S.of(context).app_push_permission_declined_dialog_content,
      context: context,
      action: action,
    );

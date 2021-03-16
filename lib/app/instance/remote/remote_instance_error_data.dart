import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

ErrorData? remoteInstanceLoadDataErrorAlertDialogBuilder(
  BuildContext? context,
  dynamic error,
  StackTrace stackTrace,
) {
  if (error != null) {
    return ErrorData(
      error: error,
      stackTrace: stackTrace,
      titleCreator: (context) =>
          S.of(context).app_instance_remote_error_failed_dialog_title,
      contentCreator: (context) =>
          S.of(context).app_instance_remote_error_failed_dialog_content,
    );
  } else {
    return null;
  }
}

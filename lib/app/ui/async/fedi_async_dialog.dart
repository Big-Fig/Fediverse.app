import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:flutter/widgets.dart';

Future<AsyncDialogResult<T>> doAsyncOperationWithFediDialog<T>({
  @required BuildContext context,
  @required Future<T> asyncCode(),
  String contentMessage,
  List<ErrorDataBuilder> errorDataBuilders = const [],
  bool showDefaultErrorAlertDialogOnUnhandledError = true,
  bool showProgressDialog = true,
  bool cancelable = false,
}) =>
    doAsyncOperationWithDialog(
      context: context,
      asyncCode: asyncCode,
      errorCallback: (errorData) => showErrorFediNotificationOverlay(
        titleText: errorData.titleText,
        contentText: errorData.contentText,
      ),
      contentMessage: contentMessage,
      errorDataBuilders: errorDataBuilders,
      showDefaultErrorAlertDialogOnUnhandledError:
          showDefaultErrorAlertDialogOnUnhandledError,
      showProgressDialog: showProgressDialog,
      cancelable: cancelable,
    );

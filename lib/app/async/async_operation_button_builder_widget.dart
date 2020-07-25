import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

typedef Future AsyncButtonAction();
typedef Widget ButtonBuilder(BuildContext context, VoidCallback onPressed);

var _logger = Logger("async_button_widget.dart");

class AsyncOperationButtonBuilderWidget extends StatefulWidget {
  final AsyncButtonAction asyncButtonAction;
  final ButtonBuilder builder;
  final bool showProgressDialog;
  final String progressContentMessage;
  final String successToastMessage;
  final ErrorCallback errorCallback;

  final List<ErrorDataBuilder> errorDataBuilders;

  AsyncOperationButtonBuilderWidget({
    @required this.builder,
    @required this.asyncButtonAction,
    this.showProgressDialog = true,
    this.progressContentMessage,
    this.successToastMessage,
    this.errorCallback,
    this.errorDataBuilders = const [],
  });

  @override
  _AsyncOperationButtonBuilderWidgetState createState() =>
      _AsyncOperationButtonBuilderWidgetState();

  Future<AsyncDialogResult<T>> performAsyncOperation<T>(
      {BuildContext context}) {
    return AsyncOperationHelper.performAsyncOperation(
        context: context,
        errorCallback: errorCallback,
        contentMessage: progressContentMessage,
        errorDataBuilders: errorDataBuilders,
        showProgressDialog: showProgressDialog,
        asyncCode: asyncButtonAction);
  }
}

class _AsyncOperationButtonBuilderWidgetState
    extends State<AsyncOperationButtonBuilderWidget> {
  bool asyncOperationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context,
        asyncOperationInProgress
            ? null
            : () {
                setState(() {
                  asyncOperationInProgress = true;
                });
                widget.performAsyncOperation(context: context).then((_) async {
                  setState(() {
                    asyncOperationInProgress = false;
                  });
                  var successToastMessage = widget.successToastMessage;
                  if (successToastMessage != null) {
                    showInfoFediNotificationOverlay(
                        contentText: successToastMessage, titleText: null);
                  }
                }).catchError((error, stacktrace) {
                  _logger.severe(() => "Fail to execute async operation", error,
                      stacktrace);
                  setState(() {
                    asyncOperationInProgress = false;
                  });
                });
              });
  }
}

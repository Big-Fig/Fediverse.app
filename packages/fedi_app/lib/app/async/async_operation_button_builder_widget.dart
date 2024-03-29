import 'package:fedi_app/app/async/async_operation_helper.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/dialog/async/async_dialog.dart';
import 'package:fedi_app/dialog/async/async_dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

typedef AsyncButtonAction<T> = Future<T> Function();
typedef ButtonBuilder = Widget Function(
  BuildContext context,
  VoidCallback? onPressed,
);

var _logger = Logger('async_button_widget.dart');

class AsyncOperationButtonBuilderWidget<T> extends StatefulWidget {
  final AsyncButtonAction<T> asyncButtonAction;
  final ButtonBuilder builder;
  final bool showProgressDialog;
  final String? progressContentMessage;
  final String? successToastMessage;
  final ErrorCallback? errorCallback;

  final List<ErrorDataBuilder> errorDataBuilders;

  const AsyncOperationButtonBuilderWidget({
    Key? key,
    required this.builder,
    required this.asyncButtonAction,
    this.showProgressDialog = true,
    this.progressContentMessage,
    this.successToastMessage,
    this.errorCallback,
    this.errorDataBuilders = const [],
  }) : super(key: key);

  @override
  AsyncOperationButtonBuilderWidgetState createState() =>
      AsyncOperationButtonBuilderWidgetState();

  Future<AsyncDialogResult<T?>> performAsyncOperation({
    required BuildContext context,
  }) =>
      AsyncOperationHelper.performAsyncOperation(
        context: context,
        errorCallback: errorCallback,
        contentMessage: progressContentMessage,
        errorDataBuilders: errorDataBuilders,
        showProgressDialog: showProgressDialog,
        asyncCode: asyncButtonAction,
      );
}

class AsyncOperationButtonBuilderWidgetState
    extends State<AsyncOperationButtonBuilderWidget> {
  bool asyncOperationInProgress = false;

  bool disposed = false;

  @override
  void dispose() {
    super.dispose();

    disposed = true;
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        asyncOperationInProgress
            ? null
            : () {
                setState(() {
                  asyncOperationInProgress = true;
                });
                widget.performAsyncOperation(context: context).then((_) async {
                  if (!disposed) {
                    setState(() {
                      asyncOperationInProgress = false;
                    });
                  }
                  var successToastMessage = widget.successToastMessage;
                  if (successToastMessage != null) {
                    IToastService.of(context, listen: false).showInfoToast(
                      context: context,
                      content: null,
                      title: successToastMessage,
                    );
                  }
                }).catchError(
                  (dynamic error, StackTrace? stacktrace) {
                    _logger.severe(
                      () => 'Fail to execute async operation',
                      error,
                      stacktrace,
                    );
                    if (!disposed) {
                      setState(
                        () {
                          asyncOperationInProgress = false;
                        },
                      );
                    }
                  },
                );
              },
      );
}

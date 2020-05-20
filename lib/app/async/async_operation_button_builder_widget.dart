import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

typedef Future AsyncButtonAction();
typedef Widget ButtonBuilder(BuildContext context, VoidCallback onPressed);

var _logger = Logger("async_button_widget.dart");

class AsyncOperationButtonBuilderWidget extends StatefulWidget {
  final AsyncButtonAction asyncButtonAction;
  final ButtonBuilder builder;
  final bool showProgressDialog;
  final String progressContentMessage;
  final List<ErrorAlertDialogBuilder> errorAlertDialogBuilders;

  AsyncOperationButtonBuilderWidget({
    @required this.builder,
    @required this.asyncButtonAction,
    this.showProgressDialog = true,
    this.progressContentMessage,
    this.errorAlertDialogBuilders = const [],
  });

  @override
  _AsyncOperationButtonBuilderWidgetState createState() =>
      _AsyncOperationButtonBuilderWidgetState();
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
                doAsyncOperationWithDialog(
                        context: context,
                        contentMessage: widget.progressContentMessage,
                        errorAlertDialogBuilders:
                            widget.errorAlertDialogBuilders,
                        showProgressDialog: widget.showProgressDialog,
                        asyncCode: widget.asyncButtonAction)
                    .then((_) {
                  setState(() {
                    asyncOperationInProgress = false;
                  });
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

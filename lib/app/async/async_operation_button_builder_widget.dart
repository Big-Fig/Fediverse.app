import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final List<ErrorAlertDialogBuilder> errorAlertDialogBuilders;

  AsyncOperationButtonBuilderWidget({
    @required this.builder,
    @required this.asyncButtonAction,
    this.showProgressDialog = true,
    this.progressContentMessage,
    this.successToastMessage,
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
                    .then((_) async {
                  setState(() {
                    asyncOperationInProgress = false;
                  });
                  var successToastMessage = widget.successToastMessage;
                  if (successToastMessage != null) {
                    await Fluttertoast.showToast(
                        msg: successToastMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
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

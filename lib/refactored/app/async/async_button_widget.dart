import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

typedef Future AsyncButtonAction();
typedef Widget ButtonBuilder(BuildContext context, VoidCallback onPressed);

var _logger = Logger("async_button_widget.dart");

class AsyncButtonWidget extends StatefulWidget {
  final AsyncButtonAction asyncButtonAction;
  final ButtonBuilder builder;

  AsyncButtonWidget({@required this.builder, @required this.asyncButtonAction});

  @override
  _AsyncButtonWidgetState createState() => _AsyncButtonWidgetState();
}

class _AsyncButtonWidgetState extends State<AsyncButtonWidget> {
  bool asyncOperationInProgress = false;

  @override
  Widget build(BuildContext context) {
    // todo: alert on fail
    return widget.builder(
        context,
        asyncOperationInProgress
            ? null
            : () {
                setState(() {
                  asyncOperationInProgress = true;
                });
                widget.asyncButtonAction().then((_) {
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

import 'package:flutter/widgets.dart';

typedef ErrorDataTitleCreator = String Function(BuildContext context);
typedef ErrorDataContentCreator = String Function(BuildContext context);

class ErrorData {
  final dynamic error;
  final StackTrace stackTrace;
  final ErrorDataTitleCreator titleCreator;
  final ErrorDataContentCreator contentCreator;

  ErrorData({
    @required this.error,
    @required this.stackTrace,
    @required this.titleCreator,
    @required this.contentCreator,
  });
}

import 'package:flutter/widgets.dart';

class ErrorData {
  final dynamic error;
  final StackTrace stackTrace;
  final String titleText;
  final String contentText;
  ErrorData({
    @required this.error,
    @required this.stackTrace,
    @required this.titleText,
    @required this.contentText,
  });
}

import 'package:flutter/widgets.dart';

class PleromaRestException implements Exception {
  final int statusCode;
  final String body;
  PleromaRestException({@required this.statusCode, @required this.body});
}

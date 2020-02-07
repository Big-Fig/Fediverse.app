import 'package:flutter/widgets.dart';

class PleromaRestError implements Exception {
  final int statusCode;
  final String body;
  PleromaRestError({@required this.statusCode, @required this.body});
}

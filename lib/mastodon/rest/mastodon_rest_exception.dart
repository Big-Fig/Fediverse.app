import 'package:flutter/widgets.dart';

class MastodonRestException implements Exception {
  final int statusCode;
  final String body;
  MastodonRestException({@required this.statusCode, @required this.body});
}

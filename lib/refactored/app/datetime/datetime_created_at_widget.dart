import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeCreatedAtWidget extends StatelessWidget {
  final DateTime createdAt;

  DateTimeCreatedAtWidget({@required this.createdAt});

  @override
  Widget build(BuildContext context) => Text(timeago.format(createdAt, locale: 'en_short'));
}

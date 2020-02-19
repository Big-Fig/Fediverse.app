import 'package:flutter/widgets.dart';

class PaginationPage<T> {
  final int requestedLimitPerPage;
  final int pageIndex;
  final int valuesCountOffsetFromStart;
  final List<T> values;

  PaginationPage(
      {@required this.requestedLimitPerPage,
      @required this.pageIndex,
      @required this.valuesCountOffsetFromStart,
      @required this.values});
}

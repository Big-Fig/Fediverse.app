import 'package:flutter/widgets.dart';

class PaginationPage<T> {
  final int requestedLimitPerPage;
  final int pageIndex;
  final List<T> items;

  PaginationPage(
      {@required this.requestedLimitPerPage,
      @required this.pageIndex,
      @required this.items});
}

enum PaginationRefreshState { notRefreshed, refreshing, refreshed }

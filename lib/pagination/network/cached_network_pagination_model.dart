import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class CachedNetworkPaginationPage<T> extends PaginationPage<T> {
  CachedNetworkPaginationPage(
      {@required int requestedLimitPerPage,
      @required int pageIndex,
      @required valuesCountOffsetFromStart,
      @required List<T> values})
      : super(
            requestedLimitPerPage: requestedLimitPerPage,
            pageIndex: pageIndex,
            valuesCountOffsetFromStart: valuesCountOffsetFromStart,
            values: values);
}

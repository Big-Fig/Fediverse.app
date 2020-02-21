import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class CachedNetworkPaginationPage<T> extends PaginationPage<T> {

  final bool isActuallyRefreshedFromRemote;

  CachedNetworkPaginationPage(
      {@required int requestedLimitPerPage,
      @required int pageIndex,
      @required List<T> values,
      @required this.isActuallyRefreshedFromRemote,
      })
      : super(
            requestedLimitPerPage: requestedLimitPerPage,
            pageIndex: pageIndex,
            items: values);
}

import 'package:fedi/pagination/pagination_model.dart';

class CachedPaginationPage<T> extends PaginationPage<T> {
  final bool isActuallyRefreshedFromRemote;

  CachedPaginationPage({
    required int? requestedLimitPerPage,
    required int pageIndex,
    required List<T> values,
    required this.isActuallyRefreshedFromRemote,
  }) : super(
          requestedLimitPerPage: requestedLimitPerPage,
          pageIndex: pageIndex,
          items: values,
        );
}

import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc_impl.dart';

import 'memory_cached_pagination_bloc_impl.dart';
import 'pagination_model_helper.dart';

class MemoryPaginationBloc<TItem>
    extends PaginationBloc<CachedPaginationPage<TItem>, TItem> {
  final List<TItem> items;

  MemoryPaginationBloc({
    required this.items,
    required int maximumCachedPagesCount,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static MemoryPaginationBloc<TestPaginationItem> createTestWithSize(
      {required int size,
      required int maximumCachedPagesCount,
      required PaginationPageSize paginationPageSize}) {
    return MemoryPaginationBloc(
      maximumCachedPagesCount: maximumCachedPagesCount,
      paginationSettingsBloc: MemoryPaginationSettingsBloc(
        paginationPageSize: paginationPageSize,
      ),
      items: List.generate(
        size,
        (index) => TestPaginationItem(
          index,
        ),
      ),
    );
  }

  @override
  Future<CachedPaginationPage<TItem>> loadPage({
    required bool forceToSkipCache,
    required int pageIndex,
    CachedPaginationPage<TItem>? previousPage,
    CachedPaginationPage<TItem>? nextPage,
  }) async {
    var requiredStartItemIndex = pageIndex * itemsCountPerPage!;
    var requiredEndItemIndex = (pageIndex + 1) * itemsCountPerPage!;
    List<TItem> values;

    if (requiredStartItemIndex >= items.length) {
      values = [];
    } else {
      if (requiredEndItemIndex > items.length) {
        requiredEndItemIndex = items.length;
      }
      values =
          items.sublist(requiredStartItemIndex, requiredEndItemIndex).toList();
    }

    return CachedPaginationPage<TItem>(
        isActuallyRefreshedFromRemote: forceToSkipCache,
        requestedLimitPerPage: itemsCountPerPage,
        values: values,
        pageIndex: pageIndex);
  }
}

import 'package:fedi_app/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc_impl.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';

import '../pagination_model_test_impl.dart';

class MemoryPaginationSettingsBloc implements IPaginationSettingsBloc {
  final PaginationPageSize paginationPageSize;

  MemoryPaginationSettingsBloc({
    required this.paginationPageSize,
  });

  @override
  Future changePageSize(PaginationPageSize value) {
    // TODO: implement changePageSize
    throw UnimplementedError();
  }

  @override
  Future clearInstanceSettings() {
    // TODO: implement clearInstanceSettings
    throw UnimplementedError();
  }

  @override
  Future cloneGlobalToInstanceSettings() {
    // TODO: implement cloneGlobalToInstanceSettings
    throw UnimplementedError();
  }

  @override
  Future dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  // TODO: implement globalOrInstanceSettings
  GlobalOrInstanceSettings<PaginationSettings> get globalOrInstanceSettings =>
      throw UnimplementedError();

  @override
  // TODO: implement globalOrInstanceSettingsStream
  Stream<GlobalOrInstanceSettings<PaginationSettings>>
      get globalOrInstanceSettingsStream => throw UnimplementedError();

  @override
  // TODO: implement globalSettingsData
  PaginationSettings get globalSettingsData => throw UnimplementedError();

  @override
  // TODO: implement globalSettingsDataStream
  Stream<PaginationSettings> get globalSettingsDataStream =>
      throw UnimplementedError();

  @override
  // TODO: implement instanceSettingsData
  PaginationSettings get instanceSettingsData => throw UnimplementedError();

  @override
  // TODO: implement instanceSettingsDataStream
  Stream<PaginationSettings> get instanceSettingsDataStream =>
      throw UnimplementedError();

  @override
  // TODO: implement isDisposed
  bool get isDisposed => throw UnimplementedError();

  @override
  // TODO: implement isGlobal
  bool get isGlobal => throw UnimplementedError();

  @override
  // TODO: implement isGlobalStream
  Stream<bool> get isGlobalStream => throw UnimplementedError();

  @override
  // TODO: implement isInstance
  bool get isInstance => throw UnimplementedError();

  @override
  // TODO: implement isInstanceStream
  Stream<bool> get isInstanceStream => throw UnimplementedError();

  @override
  PaginationPageSize get pageSize => paginationPageSize;

  @override
  Stream<PaginationPageSize> get pageSizeStream => Stream.value(pageSize);

  @override
  // TODO: implement settingsData
  PaginationSettings get settingsData => throw UnimplementedError();

  @override
  // TODO: implement settingsDataStream
  Stream<PaginationSettings> get settingsDataStream =>
      throw UnimplementedError();

  @override
  Future updateGlobalSettings(PaginationSettings? newSettings) {
    // TODO: implement updateGlobalSettings
    throw UnimplementedError();
  }

  @override
  Future updateInstanceSettings(PaginationSettings? newSettings) {
    // TODO: implement updateInstanceSettings
    throw UnimplementedError();
  }

  @override
  Future updateSettings(PaginationSettings? newSettings) {
    // TODO: implement updateSettings
    throw UnimplementedError();
  }
}

class MemoryCachedPaginationBloc<TItem>
    extends CachedPaginationBloc<CachedPaginationPage<TItem>, TItem> {
  final List<TItem> items;

  MemoryCachedPaginationBloc({
    required this.items,
    required int? maximumCachedPagesCount,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static MemoryCachedPaginationBloc<PaginationItemTest> createTestWithSize({
    required int size,
    required PaginationPageSize paginationPageSize,
    required int? maximumCachedPagesCount,
  }) =>
      MemoryCachedPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: MemoryPaginationSettingsBloc(
          paginationPageSize: paginationPageSize,
        ),
        items: List.generate(
          size,
          (index) => PaginationItemTest(
            index,
          ),
        ),
      );

  @override
  CachedPaginationPage<TItem> createPage({
    required int pageIndex,
    required List<TItem> loadedItems,
    required bool isActuallyRefreshed,
  }) =>
      CachedPaginationPage<TItem>(
        isActuallyRefreshedFromRemote: isActuallyRefreshed,
        requestedLimitPerPage: itemsCountPerPage,
        values: loadedItems,
        pageIndex: pageIndex,
      );

  @override
  bool get isPossibleToLoadFromNetwork => true;

  @override
  Future<List<TItem>> loadLocalItems({
    required int pageIndex,
    int? itemsCountPerPage,
    CachedPaginationPage<TItem>? olderPage,
    CachedPaginationPage<TItem>? newerPage,
  }) async {
    var requiredStartItemIndex = pageIndex * itemsCountPerPage!;
    var requiredEndItemIndex = (pageIndex + 1) * itemsCountPerPage;
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

    return values;
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    CachedPaginationPage<TItem>? olderPage,
    CachedPaginationPage<TItem>? newerPage,
  }) async =>
      true;
}

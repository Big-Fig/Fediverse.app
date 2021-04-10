import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/database/dao/repository/database_dao_repository.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends DatabaseDaoRepository<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm>
    implements
        IAppReadWriteRepository<DbItem, AppItem, DbId, Filters, OrderingTerm> {
  @override
  AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> get dao;

  DbItem mapAppItemToDbItem(AppItem appItem);

  List<DbItem> mapAppItemListToDbItemList(List<AppItem> appItems) =>
      appItems.map(mapAppItemToDbItem).toList();

  DbItem? mapAppItemToDbItemNullable(AppItem? appItem) {
    if (appItem != null) {
      return mapAppItemToDbItem(appItem);
    } else {
      return null;
    }
  }

  @override
  Future<List<AppItem>> findAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).get();

  @override
  Future<AppItem?> findInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).getSingleOrNull();

  @override
  Stream<List<AppItem>> watchFindAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watch();

  @override
  Stream<AppItem?> watchInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watchSingleOrNull();

  void addAppItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<AppItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      addDbItemPagination(
        query: query,
        pagination: pagination != null
            ? RepositoryPagination<DbItem>(
                newerThanItem: mapAppItemToDbItemNullable(
                  pagination.newerThanItem,
                ),
                olderThanItem: mapAppItemToDbItemNullable(
                  pagination.olderThanItem,
                ),
                limit: pagination.limit,
                offset: pagination.offset,
              )
            : null,
        orderingTerms: orderingTerms,
      );

  Selectable<AppItem> createFindInAppTypeQuerySelectable({
    RepositoryPagination<AppItem>? pagination,
    Filters? filters,
    List<OrderingTerm>? orderingTerms,
  });
}

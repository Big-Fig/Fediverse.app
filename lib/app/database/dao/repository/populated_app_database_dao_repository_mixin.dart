import 'package:fedi/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

mixin PopulatedDatabaseDaoRepositoryMixin<
        DbItem extends DataClass,
        DbPopulatedItem,
        AppItem,
        DbID,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    on AppDatabaseDaoRepository<DbItem, AppItem, DbID, TableDsl, TableInfoDsl,
        Filters, OrderingTerm> {
  DbPopulatedItem mapTypedResultToDbPopulatedItem(TypedResult typedResult);

  List<DbPopulatedItem> mapTypedResultListToDbPopulatedItemList(
          List<TypedResult> typedResults) =>
      typedResults.map(mapTypedResultToDbPopulatedItem).toList();

  DbPopulatedItem mapAppItemToDbPopulatedItem(AppItem appItem);

  List<DbPopulatedItem> mapAppItemListToDbPopulatedItemList(
          List<AppItem> appItems) =>
      appItems.map(mapAppItemToDbPopulatedItem).toList();

  DbPopulatedItem? mapAppItemToDbPopulatedItemNullable(AppItem? appItem) {
    if (appItem != null) {
      return mapAppItemToDbPopulatedItem(appItem);
    } else {
      return null;
    }
  }

  AppItem mapDbPopulatedItemToAppItem(DbPopulatedItem dbPopulatedItem);

  List<AppItem> mapDbPopulatedItemListToAppItemList(
          List<DbPopulatedItem> dbPopulatedItems) =>
      dbPopulatedItems.map(mapDbPopulatedItemToAppItem).toList();

  AppItem? mapDbPopulatedItemToAppItemNullable(
      DbPopulatedItem? dbPopulatedItem) {
    if (dbPopulatedItem != null) {
      return mapDbPopulatedItemToAppItem(dbPopulatedItem);
    } else {
      return null;
    }
  }

  @override
  Selectable<AppItem> createFindInAppTypeQuerySelectable({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) {}

  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required Filters? filters,
  });



}

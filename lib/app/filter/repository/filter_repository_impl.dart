import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/filter/database/filter_database_dao.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:moor/moor.dart';

class FilterRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbFilter,
    DbFilterPopulated,
    IFilter,
    IPleromaApiFilter,
    int,
    String,
    $DbFiltersTable,
    $DbFiltersTable,
    FilterRepositoryFilters,
    FilterOrderingTermData> implements IFilterRepository {
  @override
  final FilterDao dao;

  @override
  PopulatedDatabaseDaoMixin<
      DbFilter,
      DbFilterPopulated,
      int,
      $DbFiltersTable,
      $DbFiltersTable,
      FilterRepositoryFilters,
      FilterOrderingTermData> get populatedDao => dao;

  FilterRepository({
    required AppDatabase appDatabase,
  }) : dao = appDatabase.filterDao;

  @override
  DbFilter mapAppItemToDbItem(IFilter appItem) => appItem.toDbFilter();

  @override
  IPleromaApiFilter mapAppItemToRemoteItem(IFilter appItem) =>
      appItem.toPleromaFilter();

  @override
  DbFilterPopulated mapAppItemToDbPopulatedItem(IFilter appItem) =>
      appItem.toDbFilterPopulated();

  @override
  IFilter mapDbPopulatedItemToAppItem(DbFilterPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbFilterPopulatedWrapper();

  @override
  IPleromaApiFilter mapDbPopulatedItemToRemoteItem(
          DbFilterPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbFilterPopulatedWrapper().toPleromaFilter();

  @override
  IFilter mapRemoteItemToAppItem(IPleromaApiFilter appItem) =>
      appItem.toDbFilterPopulatedWrapper();

  @override
  FilterRepositoryFilters get emptyFilters => FilterRepositoryFilters.empty;

  @override
  List<FilterOrderingTermData> get defaultOrderingTerms =>
      FilterOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbFilter> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertBatch(
        entity: dbItem,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> insertInRemoteType(
    IPleromaApiFilter remoteItem, {
    required InsertMode? mode,
  }) =>
      insertInDbType(
        mapRemoteItemToDbItem(
          remoteItem,
        ),
        mode: mode,
      );

  @override
  Future<void> insertInRemoteTypeBatch(
    IPleromaApiFilter remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) {
    return upsertInDbTypeBatch(
      mapRemoteItemToDbItem(
        remoteItem,
      ),
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IFilter appItem,
    required IPleromaApiFilter remoteItem,
    required Batch? batchTransaction,
  }) =>
      updateByDbIdInDbType(
        dbId: appItem.localId!,
        dbItem: remoteItem.toDbFilter(),
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbFilter dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}

extension DbFilterPopulatedListExtension on List<DbFilterPopulated> {
  List<DbFilterPopulatedWrapper> toDbFilterPopulatedWrapperList() => map(
        (value) => value.toDbFilterPopulatedWrapper(),
      ).toList();
}

extension DbFilterPopulatedExtension on DbFilterPopulated {
  DbFilterPopulatedWrapper toDbFilterPopulatedWrapper() =>
      DbFilterPopulatedWrapper(
        dbFilterPopulated: this,
      );
}

extension DbFilterPopulatedWrapperExtension on DbFilterPopulatedWrapper {
  DbFilter toDbFilter() => dbFilterPopulated.dbFilter;
}

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/local/populated_app_local_database_dao_repository.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_dao.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:moor/moor.dart';
import 'package:moor/src/runtime/api/runtime_api.dart';
import 'package:moor/src/runtime/data_class.dart';
import 'package:moor/src/runtime/query_builder/query_builder.dart';

class DraftStatusRepository extends PopulatedAppLocalDatabaseDaoRepository<
    DbDraftStatus,
    DbDraftStatusPopulated,
    IDraftStatus,
    int,
    $DbDraftStatusesTable,
    $DbDraftStatusesTable,
    DraftStatusRepositoryFilters,
    DraftStatusRepositoryOrderingTermData> implements IDraftStatusRepository {
  @override
  late DraftStatusDao dao;

  DraftStatusRepository({required AppDatabase appDatabase}) {
    dao = appDatabase.draftStatusDao;
  }

  @override
  PopulatedDatabaseDaoMixin<
      DbDraftStatus,
      DbDraftStatusPopulated,
      int,
      $DbDraftStatusesTable,
      $DbDraftStatusesTable,
      DraftStatusRepositoryFilters,
      DraftStatusRepositoryOrderingTermData> get populatedDao => dao;

  @override
  Future addDraftStatus({
    required IDraftStatus draftStatus,
  }) {
    // todo: implement insertInAppType
    return insertInDbType(
      draftStatus.toDbDraftStatus(),
      mode: null,
    );
  }

  @override
  DbDraftStatus mapAppItemToDbItem(IDraftStatus appItem) =>
      appItem.toDbDraftStatus();

  @override
  DbDraftStatusPopulated mapAppItemToDbPopulatedItem(IDraftStatus appItem) =>
      appItem.toDbDraftStatusPopulated();

  @override
  IDraftStatus mapDbPopulatedItemToAppItem(
    DbDraftStatusPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbDraftStatusPopulatedWrapper();

  @override
  DraftStatusRepositoryFilters get emptyFilters =>
      DraftStatusRepositoryFilters.empty;

  @override
  List<DraftStatusRepositoryOrderingTermData> get defaultOrderingTerms =>
      DraftStatusRepositoryOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbDraftStatus> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertBatch(
        entity: dbItem,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbDraftStatus dbItem,
    required Batch? batchTransaction,
  }) =>
      insertInDbTypeBatch(
        dbItem.copyWith(
          id: dbId,
        ),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
}

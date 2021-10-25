import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi_app/app/database/dao/repository/local/populated_app_local_database_dao_repository.dart';
import 'package:fedi_app/app/status/draft/database/draft_status_database_dao.dart';
import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:fedi_app/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi_app/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:moor/moor.dart';

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
  final DraftStatusDao dao;

  DraftStatusRepository({required AppDatabase appDatabase})
      : dao = appDatabase.draftStatusDao;

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
  Future<void> addDraftStatus({
    required IDraftStatus draftStatus,
  }) =>
      insertInDbType(
        draftStatus.toDbDraftStatus(),
        mode: null,
      );

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

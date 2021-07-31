import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model_adapter.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:moor/moor.dart';

class ScheduledStatusRepository extends PopulatedAppRemoteDatabaseDaoRepository<
        DbScheduledStatus,
        DbScheduledStatusPopulated,
        IScheduledStatus,
        IPleromaApiScheduledStatus,
        int,
        String,
        $DbScheduledStatusesTable,
        $DbScheduledStatusesTable,
        ScheduledStatusRepositoryFilters,
        ScheduledStatusRepositoryOrderingTermData>
    implements IScheduledStatusRepository {
  @override
  final ScheduledStatusDao dao;

  @override
  PopulatedDatabaseDaoMixin<
      DbScheduledStatus,
      DbScheduledStatusPopulated,
      int,
      $DbScheduledStatusesTable,
      $DbScheduledStatusesTable,
      ScheduledStatusRepositoryFilters,
      ScheduledStatusRepositoryOrderingTermData> get populatedDao => dao;

  ScheduledStatusRepository({required AppDatabase appDatabase})
      : dao = appDatabase.scheduledStatusDao;

  @override
  Future markAsCanceled({
    required IScheduledStatus scheduledStatus,
    required Batch? batchTransaction,
  }) async {
    await updateByDbIdInDbType(
      dbId: scheduledStatus.localId!,
      dbItem: DbScheduledStatus(
        canceled: true,
        params: scheduledStatus.params.toPleromaScheduledStatusParams(),
        mediaAttachments: scheduledStatus.mediaAttachments,
        id: scheduledStatus.localId,
        remoteId: scheduledStatus.remoteId!,
        scheduledAt: scheduledStatus.scheduledAt,
      ),
      batchTransaction: batchTransaction,
    );
  }

  @override
  DbScheduledStatus mapAppItemToDbItem(IScheduledStatus appItem) =>
      appItem.toDbScheduledStatus();

  @override
  IPleromaApiScheduledStatus mapAppItemToRemoteItem(IScheduledStatus appItem) =>
      appItem.toPleromaScheduledStatus();

  @override
  DbScheduledStatusPopulated mapAppItemToDbPopulatedItem(
    IScheduledStatus appItem,
  ) =>
      appItem.toDbScheduledStatusPopulated();

  @override
  IScheduledStatus mapDbPopulatedItemToAppItem(
    DbScheduledStatusPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbScheduledStatusPopulatedWrapper();

  @override
  IPleromaApiScheduledStatus mapDbPopulatedItemToRemoteItem(
    DbScheduledStatusPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem
          .toDbScheduledStatusPopulatedWrapper()
          .toPleromaScheduledStatus();

  @override
  ScheduledStatusRepositoryFilters get emptyFilters =>
      ScheduledStatusRepositoryFilters.empty;

  @override
  List<ScheduledStatusRepositoryOrderingTermData> get defaultOrderingTerms =>
      ScheduledStatusRepositoryOrderingTermData.defaultTerms;

  @override
  IScheduledStatus mapRemoteItemToAppItem(
    IPleromaApiScheduledStatus remoteItem,
  ) =>
      DbScheduledStatusPopulated(
        dbScheduledStatus: remoteItem.toDbScheduledStatus(
          canceled: false,
        ),
      ).toDbScheduledStatusPopulatedWrapper();

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbScheduledStatus> dbItem, {
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
    IPleromaApiScheduledStatus remoteItem, {
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
    IPleromaApiScheduledStatus remoteItem, {
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
    required IScheduledStatus appItem,
    required IPleromaApiScheduledStatus remoteItem,
    required Batch? batchTransaction,
  }) =>
      updateByDbIdInDbType(
        dbId: appItem.localId!,
        dbItem: remoteItem.toDbScheduledStatus(canceled: false),
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbScheduledStatus dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/instance/announcement/database/instance_announcement_database_dao.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model_adapter.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:moor/moor.dart';

class InstanceAnnouncementRepository
    extends PopulatedAppRemoteDatabaseDaoRepository<
        DbInstanceAnnouncement,
        DbInstanceAnnouncementPopulated,
        IInstanceAnnouncement,
        IPleromaApiAnnouncement,
        int,
        String,
        $DbInstanceAnnouncementsTable,
        $DbInstanceAnnouncementsTable,
        InstanceAnnouncementRepositoryFilters,
        InstanceAnnouncementOrderingTermData>
    implements IInstanceAnnouncementRepository {
  @override
  final InstanceAnnouncementDao dao;

  @override
  PopulatedDatabaseDaoMixin<
      DbInstanceAnnouncement,
      DbInstanceAnnouncementPopulated,
      int,
      $DbInstanceAnnouncementsTable,
      $DbInstanceAnnouncementsTable,
      InstanceAnnouncementRepositoryFilters,
      InstanceAnnouncementOrderingTermData> get populatedDao => dao;

  InstanceAnnouncementRepository({
    required AppDatabase appDatabase,
  }) : dao = appDatabase.instanceAnnouncementDao;

  @override
  DbInstanceAnnouncement mapAppItemToDbItem(IInstanceAnnouncement appItem) =>
      appItem.toDbInstanceAnnouncement();

  @override
  IPleromaApiAnnouncement mapAppItemToRemoteItem(
    IInstanceAnnouncement appItem,
  ) =>
      appItem.toPleromaInstanceAnnouncement();

  @override
  DbInstanceAnnouncementPopulated mapAppItemToDbPopulatedItem(
    IInstanceAnnouncement appItem,
  ) =>
      appItem.toDbInstanceAnnouncementPopulated();

  @override
  IInstanceAnnouncement mapDbPopulatedItemToAppItem(
    DbInstanceAnnouncementPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbInstanceAnnouncementPopulatedWrapper();

  @override
  IPleromaApiAnnouncement mapDbPopulatedItemToRemoteItem(
    DbInstanceAnnouncementPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem
          .toDbInstanceAnnouncementPopulatedWrapper()
          .toPleromaInstanceAnnouncement();

  @override
  IInstanceAnnouncement mapRemoteItemToAppItem(
    IPleromaApiAnnouncement appItem,
  ) =>
      appItem.toDbInstanceAnnouncementPopulatedWrapper();

  @override
  InstanceAnnouncementRepositoryFilters get emptyFilters =>
      InstanceAnnouncementRepositoryFilters.empty;

  @override
  List<InstanceAnnouncementOrderingTermData> get defaultOrderingTerms =>
      InstanceAnnouncementOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbInstanceAnnouncement> dbItem, {
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
    IPleromaApiAnnouncement remoteItem, {
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
    IPleromaApiAnnouncement remoteItem, {
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
    required IInstanceAnnouncement appItem,
    required IPleromaApiAnnouncement remoteItem,
    required Batch? batchTransaction,
  }) =>
      updateByDbIdInDbType(
        dbId: appItem.localId!,
        dbItem: remoteItem.toDbInstanceAnnouncement(),
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbInstanceAnnouncement dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}

extension DbInstanceAnnouncementPopulatedListExtension
    on List<DbInstanceAnnouncementPopulated> {
  List<DbInstanceAnnouncementPopulatedWrapper>
      toDbInstanceAnnouncementPopulatedWrapperList() => map(
            (value) => value.toDbInstanceAnnouncementPopulatedWrapper(),
          ).toList();
}

extension DbInstanceAnnouncementPopulatedExtension
    on DbInstanceAnnouncementPopulated {
  DbInstanceAnnouncementPopulatedWrapper
      toDbInstanceAnnouncementPopulatedWrapper() =>
          DbInstanceAnnouncementPopulatedWrapper(
            dbInstanceAnnouncementPopulated: this,
          );
}

extension DbInstanceAnnouncementPopulatedWrapperExtension
    on DbInstanceAnnouncementPopulatedWrapper {
  DbInstanceAnnouncement toDbInstanceAnnouncement() =>
      dbInstanceAnnouncementPopulated.dbInstanceAnnouncement;
}

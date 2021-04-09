import 'package:collection/collection.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model_adapter.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("scheduledStatus_repository_impl.dart");

var _singleScheduledStatusRepositoryPagination =
    RepositoryPagination<IScheduledStatus>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class ScheduledStatusRepository extends PopulatedAppRemoteDatabaseDaoRepository<
        DbScheduledStatus,
        DbScheduledStatusPopulated,
        IScheduledStatus,
        IPleromaScheduledStatus,
        int,
        String,
        $DbScheduledStatusesTable,
        $DbScheduledStatusesTable,
        ScheduledStatusRepositoryFilters,
        ScheduledStatusRepositoryOrderingTermData>
    implements IScheduledStatusRepository {
  @override
  late ScheduledStatusDao dao;

  ScheduledStatusRepository({required AppDatabase appDatabase}) {
    dao = appDatabase.scheduledStatusDao;
  }

  @override
  Future upsertRemoteScheduledStatus(
    IPleromaScheduledStatus remoteScheduledStatus,
  ) async {
    await upsertInDbType(
      remoteScheduledStatus.toDbScheduledStatus(canceled: false),
    );
  }

  @override
  Future upsertRemoteScheduledStatuses(
    List<IPleromaScheduledStatus> remoteScheduledStatuses,
  ) async {
    if (remoteScheduledStatuses.isNotEmpty == true) {
      await upsertAllInDbType(
        remoteScheduledStatuses
            .map(
              (remoteScheduledStatus) =>
                  remoteScheduledStatus.toDbScheduledStatus(
                canceled: false,
              ),
            )
            .toList(),
      );
    }
  }

  @override
  Future updateLocalScheduledStatusByRemoteScheduledStatus({
    required IScheduledStatus oldLocalScheduledStatus,
    required IPleromaScheduledStatus newRemoteScheduledStatus,
  }) async {
    _logger.finer(() => "updateLocalScheduledStatusByRemoteScheduledStatus \n"
        "\t old: $oldLocalScheduledStatus \n"
        "\t newRemoteScheduledStatus: $newRemoteScheduledStatus");

    var newLocalScheduledStatus = newRemoteScheduledStatus.toDbScheduledStatus(
      canceled: oldLocalScheduledStatus.canceled,
    );
    await updateByDbIdInDbType(
      dbId: oldLocalScheduledStatus.localId!,
      dbItem: newLocalScheduledStatus,
    );
  }

  @override
  Future<List<DbScheduledStatusPopulatedWrapper>> getScheduledStatuses({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    ScheduledStatusRepositoryOrderingTermData? orderingTermData =
        ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedScheduledStatusesList = await query.get();

    return typedScheduledStatusesList
        .toDbScheduledStatusPopulatedList(dao: dao)
        .toDbScheduledStatusPopulatedWrappers();
  }

  @override
  Stream<List<DbScheduledStatusPopulatedWrapper>> watchScheduledStatuses({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    ScheduledStatusRepositoryOrderingTermData? orderingTermData =
        ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map(
      (typedList) => typedList
          .toDbScheduledStatusPopulatedList(dao: dao)
          .toDbScheduledStatusPopulatedWrappers(),
    );
  }

  JoinedSelectStatement createQuery({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    required ScheduledStatusRepositoryOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData!.orderType ==
          ScheduledStatusRepositoryOrderType.remoteId);
      query = dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }

    if (filters?.excludeCanceled == true) {
      query = dao.addExcludeCanceledWhere(query);
    }

    if (filters?.excludeScheduleAtExpired == true) {
      query = dao.addExcludeScheduleAtExpiredWhere(query);
    }

    if (orderingTermData != null) {
      query = dao.orderBy(
        query,
        [
          orderingTermData,
        ],
      );
    }

    // nothing to join by now, just to avoid unnecessary code wrappers overhead
    var joinQuery = query.join([]);

    var limit = pagination?.limit;
    if (limit != null) {
      joinQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return joinQuery;
  }

  @override
  Future<DbScheduledStatusPopulatedWrapper?> getScheduledStatus({
    required ScheduledStatusRepositoryFilters? filters,
    ScheduledStatusRepositoryOrderingTermData? orderingTermData =
        ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
  }) async {
    var scheduledStatuses = await getScheduledStatuses(
      filters: filters,
      pagination: _singleScheduledStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return scheduledStatuses.first;
  }

  @override
  Stream<DbScheduledStatusPopulatedWrapper?> watchScheduledStatus({
    required ScheduledStatusRepositoryFilters? filters,
    ScheduledStatusRepositoryOrderingTermData? orderingTermData =
        ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var scheduledStatusesStream = watchScheduledStatuses(
      filters: filters,
      pagination: _singleScheduledStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return scheduledStatusesStream.map(
      (scheduledStatuses) => scheduledStatuses.firstOrNull,
    );
  }

  @override
  Future markAsCanceled({
    required IScheduledStatus scheduledStatus,
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
    );
  }

  @override
  DbScheduledStatus mapAppItemToDbItem(IScheduledStatus appItem) =>
      appItem.toDbScheduledStatus();

  @override
  IPleromaScheduledStatus mapAppItemToRemoteItem(IScheduledStatus appItem) =>
      appItem.toPleromaScheduledStatus();

  @override
  DbScheduledStatusPopulated mapAppItemToDbPopulatedItem(
          IScheduledStatus appItem) =>
      appItem.toDbScheduledStatusPopulated();

  @override
  IScheduledStatus mapDbPopulatedItemToAppItem(
          DbScheduledStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbScheduledStatusPopulatedWrapper();

  @override
  IPleromaScheduledStatus mapDbPopulatedItemToRemoteItem(
          DbScheduledStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem
          .toDbScheduledStatusPopulatedWrapper()
          .toPleromaScheduledStatus();

  @override
  ScheduledStatusRepositoryFilters get emptyFilters =>
      ScheduledStatusRepositoryFilters.empty;

  @override
  List<ScheduledStatusRepositoryOrderingTermData> get defaultOrderingTerms =>
      ScheduledStatusRepositoryOrderingTermData.defaultTerms;
}

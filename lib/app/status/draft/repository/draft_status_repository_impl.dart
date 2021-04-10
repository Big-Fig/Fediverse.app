import 'package:collection/collection.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/local/populated_app_local_database_dao_repository.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_dao.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("draftStatus_repository_impl.dart");

var _singleDraftStatusRepositoryPagination = RepositoryPagination<IDraftStatus>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class DraftStatusRepository extends PopulatedAppLocalDatabaseDaoRepository<
    DbDraftStatus,
    DbDraftStatusPopulated,
    IDraftStatus,
    int,
    $DbDraftStatusesTable,
    $DbDraftStatusesTable,
    DraftStatusRepositoryFilters,
    DraftStatusOrderingTermData> implements IDraftStatusRepository {
  @override
  late DraftStatusDao dao;

  DraftStatusRepository({required AppDatabase appDatabase}) {
    dao = appDatabase.draftStatusDao;
  }

  @override
  Future<List<DbDraftStatusPopulatedWrapper>> getDraftStatuses({
    required DraftStatusRepositoryFilters? filters,
    required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedResultList = await query.get();

    return typedResultList
        .toDbDraftStatusPopulatedList(dao: dao)
        .toDbDraftStatusPopulatedWrapperList();
  }

  @override
  Stream<List<DbDraftStatusPopulatedWrapper>> watchDraftStatuses({
    required DraftStatusRepositoryFilters filters,
    required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map((typedResultList) {
      return typedResultList
          .toDbDraftStatusPopulatedList(dao: dao)
          .toDbDraftStatusPopulatedWrapperList();
    });
  }

  JoinedSelectStatement createQuery({
    required DraftStatusRepositoryFilters? filters,
    required RepositoryPagination<IDraftStatus>? pagination,
    required DraftStatusOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData?.orderType ==
          DraftStatusRepositoryOrderType.updatedAt);
      query = dao.addUpdatedAtBoundsWhere(
        query,
        maximumUpdatedAtExcluding: pagination?.olderThanItem?.updatedAt,
        minimumUpdatedAtExcluding: pagination?.newerThanItem?.updatedAt,
      );
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
  Future<DbDraftStatusPopulatedWrapper?> getDraftStatus({
    required DraftStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) async {
    var draftStatuses = await getDraftStatuses(
      filters: filters,
      pagination: _singleDraftStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return draftStatuses.isNotEmpty ? draftStatuses.first : null;
  }

  @override
  Stream<DbDraftStatusPopulatedWrapper?> watchDraftStatus({
    required DraftStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) {
    var draftStatusesStream = watchDraftStatuses(
      filters: filters,
      pagination: _singleDraftStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return draftStatusesStream.map(
      (draftStatuses) => draftStatuses.firstOrNull,
    );
  }

  @override
  Future addDraftStatus({
    required IDraftStatus draftStatus,
  }) =>
      insertInAppType(
        draftStatus,
        insertMode: null,
      );

  @override
  DbDraftStatus mapAppItemToDbItem(IDraftStatus appItem) =>
      appItem.toDbDraftStatus();

  @override
  DbDraftStatusPopulated mapAppItemToDbPopulatedItem(IDraftStatus appItem) =>
      appItem.toDbDraftStatusPopulated();

  @override
  IDraftStatus mapDbPopulatedItemToAppItem(
          DbDraftStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbDraftStatusPopulatedWrapper();

  @override
  DraftStatusRepositoryFilters get emptyFilters =>
      DraftStatusRepositoryFilters.empty;

  @override
  List<DraftStatusOrderingTermData> get defaultOrderingTerms =>
      DraftStatusOrderingTermData.defaultTerms;
}

extension DbDraftStatusTypedResultExtension on TypedResult {
  DbDraftStatus toDbDraftStatus({
    required DraftStatusDao dao,
  }) =>
      readTable(dao.db.dbDraftStatuses);

  DbDraftStatusPopulated toDbDraftStatusPopulated({
    required DraftStatusDao dao,
  }) =>
      DbDraftStatusPopulated(
        dbDraftStatus: toDbDraftStatus(
          dao: dao,
        ),
      );
}

extension DbDraftStatusTypedResultListExtension on List<TypedResult> {
  List<DbDraftStatus> toDbDraftStatusList({
    required DraftStatusDao dao,
  }) =>
      map(
        (item) => item.toDbDraftStatus(dao: dao),
      ).toList();

  List<DbDraftStatusPopulated> toDbDraftStatusPopulatedList({
    required DraftStatusDao dao,
  }) =>
      map(
        (item) => item.toDbDraftStatusPopulated(dao: dao),
      ).toList();
}

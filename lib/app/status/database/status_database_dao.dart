import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_database_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:moor/moor.dart';

part 'status_database_dao.g.dart';

@UseDao(tables: [
  DbStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_statuses;",
  "countById": "SELECT COUNT(*) FROM db_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_statuses WHERE id = :id;",
  "clear": "DELETE FROM db_statuses",
  "getAll": "SELECT * FROM db_statuses",
  "findLocalIdByRemoteId": "SELECT id FROM db_statuses WHERE remote_id = "
      ":remoteId;",
})
class StatusDao extends DatabaseAccessor<AppDatabase> with _$StatusDaoMixin {
  final AppDatabase db;
  $DbAccountsTable accountAlias;

  // Called by the AppDatabase class
  StatusDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, 'account');
  }

  JoinedSelectStatement createQuery(
      {@required String containsBaseUrlOrIsPleromaLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String notNewerThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData}) {
    var query = selectQuery();
    if (containsBaseUrlOrIsPleromaLocal != null) {
      addLocalOnlyWhere(query, containsBaseUrlOrIsPleromaLocal);
    }

    if (onlyMedia == true) {
      addMediaOnlyWhere(query);
    }

    if (notMuted == true) {
      addNotMutedWhere(query);
    }
    if (excludeVisibilities?.isNotEmpty == true) {
      addExcludeVisibilitiesWhere(query, excludeVisibilities);
    }

    if (notNewerThanStatusRemoteId != null || newerThanStatusRemoteId != null) {
      addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: notNewerThanStatusRemoteId,
          minimumRemoteIdExcluding: newerThanStatusRemoteId);
    }


    if (orderingTermData != null) {
      orderBy(query, [orderingTermData]);
    }
    var joinQuery = query.join(
      populateStatusJoin(),
    );
    assert(!(limit == null && offset != null));
    if (limit != null) {
      joinQuery.limit(limit, offset: offset);
    }
    return joinQuery;
  }

  Future<List<DbStatusPopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> statusQuery = _findAll();

    return typedResultListToPopulated(await statusQuery.get());
  }

  Stream<List<DbStatusPopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> statusQuery = _findAll();

    return statusQuery.watch().map(typedResultListToPopulated);
  }

  Future<DbStatusPopulated> findById(int id) async =>
      typedResultToPopulated(await _findById(id).getSingle());

  Future<DbStatusPopulated> findByRemoteId(String remoteId) async =>
      typedResultToPopulated(await _findByRemoteId(remoteId).getSingle());

  Stream<DbStatusPopulated> watchById(int id) =>
      (_findById(id).watchSingle().map(typedResultToPopulated));

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbStatuses).join(
      populateStatusJoin(),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbStatuses)..where((status) => status.id.equals(id)))
          .join(populateStatusJoin());

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String remoteId) =>
      (select(db.dbStatuses)..where((status) => status.remoteId.like(remoteId)))
          .join(populateStatusJoin());

  Future<int> insert(Insertable<DbStatus> entity) async =>
      into(db.dbStatuses).insert(entity);

  Future insertAll(
          Iterable<Insertable<DbStatus>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbStatuses, entities);
      });
  Future<bool> replace(Insertable<DbStatus> entity) async =>
      await update(db.dbStatuses).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbStatus> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbStatuses)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> selectQuery() =>
      (select(db.dbStatuses));


  SimpleSelectStatement<$DbStatusesTable, DbStatus> addFollowingWhere(
      SimpleSelectStatement<$DbStatusesTable, DbStatus> query) {
    // TODO: implement filtering by following account ids
    // return all saved statuses for now
    return query;
  }

  // TODO: separate media in own table & use join
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addMediaOnlyWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query..where((status) => isNotNull(status.mediaAttachments));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addLocalOnlyWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
          String domain) =>
      query
        ..where((status) =>
            status.pleromaLocal.equals(true) | status.url.like("%$domain%"));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addNotMutedWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query
        ..where((status) =>
            status.muted.equals(false) &
            status.pleromaThreadMuted.equals(true).not());

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query, {
    @required String minimumRemoteIdExcluding,
    @required String maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool, BoolType>(
          "db_statuses.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((status) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool, BoolType>(
          "db_statuses.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((status) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addExcludeVisibilitiesWhere(
      SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
      List<PleromaVisibility> excludeVisibilities) {
    assert(excludeVisibilities?.isNotEmpty == true);

    List<String> excludeVisibilityStrings = excludeVisibilities
        .map((visibility) => pleromaVisibilityValues.reverse[visibility])
        .toList();

    return query
      ..where((status) => status.visibility.isNotIn(excludeVisibilityStrings));
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> orderBy(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
          List<StatusOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case StatusOrderByType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  List<DbStatusPopulated> typedResultListToPopulated(
      List<TypedResult> typedResult) {
    if (typedResult == null) {
      return null;
    }
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbStatusPopulated typedResultToPopulated(TypedResult typedResult) {
    if (typedResult == null) {
      return null;
    }

    return DbStatusPopulated(
        status: typedResult.readTable(db.dbStatuses),
        account: typedResult.readTable(accountAlias));
  }

  List<Join<Table, DataClass>> populateStatusJoin() {
    return statusPopulateJoin(
        dbStatusesTable: db.dbStatuses, accountAlias: accountAlias);
  }

  static List<Join<Table, DataClass>> statusPopulateJoin({
    @required $DbStatusesTable dbStatusesTable,
    @required $DbAccountsTable accountAlias,
  }) {
    return [
      innerJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(dbStatusesTable.accountRemoteId),
      ),
    ];
  }
}

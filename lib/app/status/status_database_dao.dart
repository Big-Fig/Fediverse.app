import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_database_model.dart';
import 'package:fedi/app/status/status_repository_model.dart';
import 'package:moor/moor.dart';

part 'status_database_dao.g.dart';

@UseDao(tables: [
  DbStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_statuses;",
  "findById": "SELECT * FROM db_statuses WHERE id = :id;",
  "findByRemoteId": "SELECT * FROM db_statuses WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_statuses WHERE id = :id;",
  "clear": "DELETE FROM db_statuses",
  "getAll": "SELECT * FROM db_statuses",
  "findLocalIdByRemoteId": "SELECT id FROM db_statuses WHERE remote_id = "
      ":remoteId;",
})
class StatusDao extends DatabaseAccessor<AppDatabase> with _$StatusDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatus> entity) async =>
      into(dbStatuses).insert(entity);

  Future insertAll(
          Iterable<Insertable<DbStatus>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbStatuses, entities);
      });
  Future<bool> replace(Insertable<DbStatus> entity) async =>
      await update(dbStatuses).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbStatus> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(dbStatuses)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> selectQuery() => (select(db.dbStatuses));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addPublicWhere(
      SimpleSelectStatement<$DbStatusesTable, DbStatus> query) {
  // TODO: check
    // return all saved statuses for now
  return query;
  }
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addHomeWhere(
      SimpleSelectStatement<$DbStatusesTable, DbStatus> query) {
    // TODO: implement filtering by following account ids
    // return all saved statuses for now
    return query;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addMediaOnlyWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query..where((status) => isNotNull(status.mediaAttachments));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addLocalOnlyWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
          String domain) =>
      query
        ..where((message) =>
            message.pleromaLocal.equals(true) | message.url.like("%$domain%"));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addNotMutedWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query
        ..where((message) =>
            message.muted.equals(false) &
            message.pleromaThreadMuted.equals(true).not());

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addDateBoundsWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    DateTime minimumDate,
    DateTime maximumDate,
  ) {
    assert(minimumDate != null || maximumDate != null);

    if (minimumDate != null) {
      query = query
        ..where((message) => message.createdAt.isBiggerThanValue(minimumDate));
    }
    if (maximumDate != null) {
      query = query
        ..where((message) => message.createdAt.isSmallerThanValue(maximumDate));
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
      ..where(
          (message) => message.visibility.isNotIn(excludeVisibilityStrings));
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
}

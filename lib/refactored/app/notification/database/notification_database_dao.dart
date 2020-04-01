import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/database/notification_database_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'notification_database_dao.g.dart';

var _accountAliasId = "account";
var _statusAliasId = "status";

var _logger = Logger("notification_database_dao.dart");

@UseDao(tables: [
  DbNotifications
], queries: {
  "countAll": "SELECT Count(*) FROM db_notifications;",
  "countById": "SELECT COUNT(*) FROM db_notifications WHERE id = :id;",
  "deleteById": "DELETE FROM db_notifications WHERE id = :id;",
  "clear": "DELETE FROM db_notifications",
  "getAll": "SELECT * FROM db_notifications",
  "findLocalIdByRemoteId": "SELECT id FROM db_notifications WHERE remote_id = "
      ":remoteId;",
})
class NotificationDao extends DatabaseAccessor<AppDatabase> with _$NotificationDaoMixin {
  final AppDatabase db;
  $DbAccountsTable accountAlias;
  $DbStatusesTable statusAlias;


  // Called by the AppDatabase class
  NotificationDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    statusAlias = alias(db.dbStatuses, _statusAliasId);

  }

  Future<List<DbNotificationPopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> notificationQuery = _findAll();

    return typedResultListToPopulated(await notificationQuery.get());
  }

  Stream<List<DbNotificationPopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> notificationQuery = _findAll();

    return notificationQuery.watch().map(typedResultListToPopulated);
  }

  Future<DbNotificationPopulated> findById(int id) async =>
      typedResultToPopulated(await _findById(id).getSingle());

  Future<DbNotificationPopulated> findByRemoteId(String remoteId) async =>
      typedResultToPopulated(await _findByRemoteId(remoteId).getSingle());

  Stream<DbNotificationPopulated> watchById(int id) =>
      (_findById(id).watchSingle().map(typedResultToPopulated));

  Stream<DbNotificationPopulated> watchByRemoteId(String remoteId) =>
      (_findByRemoteId(remoteId).watchSingle().map(typedResultToPopulated));

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbNotifications).join(
      populateNotificationJoin(),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbNotifications)..where((notification) => notification.id.equals(id))).join(
          populateNotificationJoin());

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String remoteId) =>
      (select(db.dbNotifications)..where((notification) => notification.remoteId.like(remoteId)))
          .join(populateNotificationJoin());

  Future<int> insert(Insertable<DbNotification> entity) async =>
      into(db.dbNotifications).insert(entity);

  Future<int> upsert(Insertable<DbNotification> entity) async =>
      into(db.dbNotifications).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          Iterable<Insertable<DbNotification>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbNotifications, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbNotification> entity) async =>
      await update(db.dbNotifications).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbNotification> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbNotifications)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification> startSelectQuery() =>
      (select(db.dbNotifications));




  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbNotificationsTable, DbNotification> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query, {
    @required String minimumRemoteIdExcluding,
    @required String maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool, BoolType>(
          "db_notifications.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((notification) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool, BoolType>(
          "db_notifications.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((notification) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification> orderBy(
          SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
          List<NotificationOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case NotificationOrderByType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  List<DbNotificationPopulated> typedResultListToPopulated(
      List<TypedResult> typedResult) {
    if (typedResult == null) {
      return null;
    }
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbNotificationPopulated typedResultToPopulated(TypedResult typedResult) {
    if (typedResult == null) {
      return null;
    }

    var status = typedResult.readTable(statusAlias);

    DbStatusPopulated statusPopulated;
    if(status?.remoteId != null) {
      sad
    }

    return DbNotificationPopulated(
        notification: typedResult.readTable(db.dbNotifications),
        account: typedResult.readTable(accountAlias),
        statusPopulated: statusPopulated,
    );
  }

  List<Join<Table, DataClass>> populateNotificationJoin() {
    return [
      innerJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(dbNotifications.accountRemoteId),
      ),
      leftOuterJoin(
        statusAlias,
        statusAlias.remoteId.equalsExp(dbNotifications.statusRemoteId),
      ),

    ];
  }
}

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/notification/database/notification_database_model.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:moor/moor.dart';

part 'notification_database_dao.g.dart';

var _accountAliasId = "account";
var _statusAliasId = "status";
var _statusAccountAliasId = "status_account";
var _statusReblogAliasId = "status_reblog";
var _statusReblogAccountAliasId = "status_reblog_account";

@UseDao(
  tables: [
    DbNotifications,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_notifications;",
    "countById": "SELECT COUNT(*) FROM db_notifications WHERE id = :id;",
    "oldest": "SELECT * FROM db_notifications ORDER BY created_at ASC LIMIT 1;",
    "deleteById": "DELETE FROM db_notifications WHERE id = :id;",
    "clear": "DELETE FROM db_notifications",
    "getAll": "SELECT * FROM db_notifications",
    "findLocalIdByRemoteId":
        "SELECT id FROM db_notifications WHERE remote_id = "
            ":remoteId;",
    "deleteOlderThanDate":
        "DELETE FROM db_notifications WHERE created_at < :createdAt",
    "deleteOlderThanLocalId": "DELETE FROM db_notifications WHERE id = "
        ":id;",
    "getNewestByLocalIdWithOffset":
        "SELECT * FROM db_notifications ORDER BY id DESC LIMIT 1 OFFSET :offset",
  },
)
class NotificationDao extends PopulatedAppRemoteDatabaseDao<
    DbNotification,
    DbNotificationPopulated,
    int,
    String,
    $DbNotificationsTable,
    $DbNotificationsTable> with _$NotificationDaoMixin {
  final AppDatabase db;
  late $DbAccountsTable accountAlias;
  late $DbStatusesTable statusAlias;
  late $DbAccountsTable statusAccountAlias;
  late $DbStatusesTable statusReblogAlias;
  late $DbAccountsTable statusReblogAccountAlias;

  // Called by the AppDatabase class
  NotificationDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    statusAlias = alias(db.dbStatuses, _statusAliasId);
    statusAccountAlias = alias(db.dbAccounts, _statusAccountAliasId);
    statusReblogAlias = alias(db.dbStatuses, _statusReblogAliasId);
    statusReblogAccountAlias =
        alias(db.dbAccounts, _statusReblogAccountAliasId);
  }

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbNotification> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbNotifications)
            ..where(
              (i) => i.id.equals(localId),
            ))
          .write(entity);
    } else {
      localId = await insert(
        entity: entity,
        mode: null,
      );
    }

    return localId;
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
      addExcludeTypeWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    List<PleromaNotificationType>? excludeTypes,
  ) =>
          query
            ..where(
              (notification) => notification.type.isNotIn(
                excludeTypes!
                    .map(
                      (type) => type.toJsonValue(),
                    )
                    .toList(),
              ),
            );

  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
      addOnlyWithTypeWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    PleromaNotificationType onlyWithType,
  ) =>
          query
            ..where(
              (notification) => notification.type.equals(
                onlyWithType.toJsonValue(),
              ),
            );


  /// notification remote ids can't be compared
//  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
//      addRemoteIdBoundsWhere(
//    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query, {
//    @required String minimumRemoteIdExcluding,
//    @required String maximumRemoteIdExcluding,
//  }) {
//    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
//    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
//    assert(minimumExist || maximumExist);
//
//    if (minimumExist) {
//      var biggerExp = CustomExpression<bool>(
//          "db_notifications.remote_id > '$minimumRemoteIdExcluding'");
//      query = query..where((notification) => biggerExp);
//    }
//    if (maximumExist) {
//      var smallerExp = CustomExpression<bool>(
//          "db_notifications.remote_id < '$maximumRemoteIdExcluding'");
//      query = query..where((notification) => smallerExp);
//    }
//
//    return query;
//  }

  JoinedSelectStatement addExcludeContentWhere(
    JoinedSelectStatement query, {
    required String phrase,
    required bool wholeWord,
  }) {
    final regex = r"\b" + phrase + r"\b";
    if (wholeWord) {
      return query
        ..where(
          statusAlias.content.regexp(regex).not(),
        );
    } else {
      return query
        ..where(
          statusAlias.content.like("%$phrase%").not(),
        );
    }
  }

  JoinedSelectStatement addExcludeSpoilerTextWhere(
    JoinedSelectStatement query, {
    required String phrase,
    required bool wholeWord,
  }) {
    final regex = r"\b" + phrase + r"\b";
    if (wholeWord) {
      return query
        ..where(
          statusAlias.spoilerText.regexp(regex).not(),
        );
    } else {
      return query
        ..where(
          statusAlias.spoilerText.like("%$phrase%").not(),
        );
    }
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
      addCreatedAtBoundsWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query, {
    required DateTime? minimumCreatedAt,
    required DateTime? maximumCreatedAt,
  }) {
    var minimumExist = minimumCreatedAt != null;
    var maximumExist = maximumCreatedAt != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      query = query
        ..where((notification) =>
            notification.createdAt.isBiggerThanValue(minimumCreatedAt));
    }
    if (maximumExist) {
      query = query
        ..where((notification) =>
            notification.createdAt.isSmallerThanValue(maximumCreatedAt));
    }

    return query;
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification> orderBy(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    List<NotificationOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case NotificationOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                    case NotificationOrderType.createdAt:
                      expression = item.createdAt;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  Future markAsRead({required String? remoteId}) {
    var update = "UPDATE db_notifications "
        "SET unread = 0 "
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAllAsRead() {
    var update = "UPDATE db_notifications "
        "SET unread = 0 ";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAsDismissed({required String? remoteId}) {
    var update = "UPDATE db_notifications "
        "SET dismissed = 1 "
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAsDismissedWhere({
    required String? accountRemoteId,
    required PleromaNotificationType type,
  }) {
    var update = "UPDATE db_notifications "
        "SET dismissed = 1 "
        "WHERE account_remote_id = '$accountRemoteId' "
        "AND type = '${type.toJsonValue()}'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAllAsDismissed() {
    var update = "UPDATE db_notifications "
        "SET dismissed = 1 ";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
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
      leftOuterJoin(
        statusAccountAlias,
        statusAccountAlias.remoteId.equalsExp(statusAlias.accountRemoteId),
      ),
      leftOuterJoin(
        statusReblogAlias,
        statusReblogAlias.remoteId.equalsExp(statusAlias.reblogStatusRemoteId),
      ),
      leftOuterJoin(
        statusReblogAccountAlias,
        statusReblogAccountAlias.remoteId
            .equalsExp(statusReblogAlias.accountRemoteId),
      ),
    ];
  }

  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
      addOnlyNotDismissedWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
  ) =>
          query
            ..where(
              (status) => status.dismissed.isNull(),
            );

  SimpleSelectStatement<$DbNotificationsTable, DbNotification> addOnlyUnread(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
  ) =>
      query
        ..where(
          (status) => status.unread.equals(true),
        );

  @override
  $DbNotificationsTable get table => dbNotifications;
}

extension DbNotificationPopulatedTypedResultListExtension on List<TypedResult> {
  List<DbNotificationPopulated> toDbNotificationPopulatedList({
    required NotificationDao dao,
  }) {
    return map(
      (item) => item.toDbNotificationPopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension DbNotificationPopulatedTypedResultExtension on TypedResult {
  DbNotificationPopulated toDbNotificationPopulated({
    required NotificationDao dao,
  }) {
    TypedResult typedResult = this;
    var notificationAccount = typedResult.readTable(dao.accountAlias);
    var notificationStatus = typedResult.readTableOrNull(dao.statusAlias);

    var notificationStatusAccount =
        typedResult.readTableOrNull(dao.statusAccountAlias);
    var rebloggedStatus = typedResult.readTableOrNull(dao.statusReblogAlias);
    var rebloggedStatusAccount =
        typedResult.readTableOrNull(dao.statusReblogAccountAlias);

    return DbNotificationPopulated(
      dbNotification: typedResult.readTable(dao.db.dbNotifications),
      dbAccount: notificationAccount,
      reblogDbStatus: rebloggedStatus,
      reblogDbStatusAccount: rebloggedStatusAccount,
      dbStatus: notificationStatus,
      dbStatusAccount: notificationStatusAccount,
      replyDbStatus: null,
      replyDbStatusAccount: null,
      replyReblogDbStatus: null,
      replyReblogDbStatusAccount: null,
    );
  }
}

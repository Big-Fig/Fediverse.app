import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/notification/database/notification_database_model.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'notification_database_dao.g.dart';

var _accountAliasId = 'account';
var _statusAliasId = 'status';
var _statusAccountAliasId = 'status_account';
var _statusReblogAliasId = 'status_reblog';
var _statusReblogAccountAliasId = 'status_reblog_account';

@UseDao(
  tables: [
    DbNotifications,
  ],
)
class NotificationDao extends PopulatedAppRemoteDatabaseDao<
    DbNotification,
    DbNotificationPopulated,
    int,
    String,
    $DbNotificationsTable,
    $DbNotificationsTable,
    NotificationRepositoryFilters,
    NotificationRepositoryOrderingTermData> with _$NotificationDaoMixin {
  final AppDatabase db;
  // ignore: avoid-late-keyword
  late $DbAccountsTable accountAlias;
  // ignore: avoid-late-keyword
  late $DbStatusesTable statusAlias;
  // ignore: avoid-late-keyword
  late $DbAccountsTable statusAccountAlias;
  // ignore: avoid-late-keyword
  late $DbStatusesTable statusReblogAlias;
  // ignore: avoid-late-keyword
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

  SimpleSelectStatement<$DbNotificationsTable, DbNotification>
      addExcludeTypeWhere(
    SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    List<PleromaApiNotificationType>? excludeTypes,
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
    PleromaApiNotificationType onlyWithType,
  ) =>
          query
            ..where(
              (notification) => notification.type.equals(
                onlyWithType.toJsonValue(),
              ),
            );

  JoinedSelectStatement addExcludeContentWhere(
    JoinedSelectStatement query, {
    required String phrase,
    required bool wholeWord,
  }) {
    final regex = r'\b' + phrase + r'\b';
    if (wholeWord) {
      return query
        ..where(
          statusAlias.content.regexp(regex).not(),
        );
    } else {
      return query
        ..where(
          statusAlias.content.like('%$phrase%').not(),
        );
    }
  }

  JoinedSelectStatement addExcludeSpoilerTextWhere(
    JoinedSelectStatement query, {
    required String phrase,
    required bool wholeWord,
  }) {
    final regex = r'\b' + phrase + r'\b';
    if (wholeWord) {
      return query
        ..where(
          statusAlias.spoilerText.regexp(regex).not(),
        );
    } else {
      return query
        ..where(
          statusAlias.spoilerText.like('%$phrase%').not(),
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
    List<NotificationRepositoryOrderingTermData> orderTerms,
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

  Future markAsRead({required String remoteId}) {
    var update = 'UPDATE db_notifications '
        'SET unread = 0 '
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAllAsRead() {
    var update = 'UPDATE db_notifications SET unread = 0';
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAsDismissed({required String? remoteId}) {
    var update = 'UPDATE db_notifications '
        'SET dismissed = 1 '
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAsDismissedWhere({
    required String? accountRemoteId,
    required PleromaApiNotificationType type,
  }) {
    var update = 'UPDATE db_notifications '
        'SET dismissed = 1 '
        "WHERE account_remote_id = '$accountRemoteId' "
        "AND type = '${type.toJsonValue()}'";
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  Future markAllAsDismissed() {
    var update = 'UPDATE db_notifications '
        'SET dismissed = 1 ';
    var query = db.customUpdate(update, updates: {dbNotifications});

    return query;
  }

  List<Join> populateNotificationJoin() {
    return [
      // todo: think about leftOuterJoin and nullable account field
      // or foreign keys
      // in some cases status may already exist in local database,
      // but account still not added
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
              (status) =>
                  status.dismissed.isNull() | status.dismissed.equals(false),
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

  Future deleteOlderThanDate(
    DateTime dateTimeToDelete, {
    required Batch? batchTransaction,
  }) =>
      deleteOlderThanDateTime(
        dateTimeToDelete,
        fieldName: table.createdAt.$name,
        batchTransaction: batchTransaction,
      );

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    required NotificationRepositoryFilters? filters,
  }) {
    if (filters?.excludeTypes?.isNotEmpty == true) {
      addExcludeTypeWhere(query, filters?.excludeTypes);
    }

    var onlyWithType = filters?.onlyWithType;
    if (onlyWithType != null) {
      addOnlyWithTypeWhere(query, onlyWithType);
    }

    if (filters?.onlyNotDismissed == true) {
      addOnlyNotDismissedWhere(query);
    }
    if (filters?.onlyUnread == true) {
      addOnlyUnread(query);
    }
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    required RepositoryPagination<DbNotification>? pagination,
    required List<NotificationRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      if (orderingTermData.orderType == NotificationOrderType.createdAt) {
        addDateTimeBoundsWhere(
          query,
          column: dbNotifications.createdAt,
          maximumDateTimeExcluding: pagination?.olderThanItem?.createdAt,
          minimumDateTimeExcluding: pagination?.newerThanItem?.createdAt,
        );
      } else if (orderingTermData.orderType == NotificationOrderType.remoteId) {
        addRemoteIdBoundsWhere(
          query,
          maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
          minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
        );
      } else {
        throw 'Unsupported orderingTermData $orderingTermData';
      }
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    required List<NotificationRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(query, orderingTerms ?? []);
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbNotificationsTable, DbNotification> query,
    required NotificationRepositoryFilters? filters,
  }) {
    var joinQuery = query.join(populateNotificationJoin());

    // move to filters
    var excludeStatusTextConditions = filters?.excludeStatusTextConditions;
    if (excludeStatusTextConditions != null) {
      for (var condition in excludeStatusTextConditions) {
        addExcludeContentWhere(
          joinQuery,
          phrase: condition.phrase,
          wholeWord: condition.wholeWord,
        );
        addExcludeSpoilerTextWhere(
          joinQuery,
          phrase: condition.phrase,
          wholeWord: condition.wholeWord,
        );
      }
    }

    return joinQuery;
  }

  @override
  DbNotificationPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbNotificationPopulated(dao: this);
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
    var typedResult = this;
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

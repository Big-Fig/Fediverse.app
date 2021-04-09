import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/database/status_database_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:moor/moor.dart';

part 'status_database_dao.g.dart';

var _accountAliasId = "account";
var _reblogAliasId = "reblog";
var _reblogAccountAliasId = "reblogAccount";
var _replyAliasId = "reply";
var _replyAccountAliasId = "replyAccount";
var _replyReblogAliasId = "replyReblog";
var _replyReblogAccountAliasId = "replyReblogAccount";
var _statusAliasId = "status";
var _accountFollowingsAliasId = "accountFollowings";
var _replyToAccountFollowingsAliasId = "replyToAccountFollowings";
var _statusHashtagsAliasId = "statusHashtags";
var _statusListsAliasId = "statusLists";
var _conversationStatusesAliasId = "conversationStatuses";
var _homeTimelineStatusesAliasId = "homeTimelineStatuses";

@UseDao(
  tables: [
    DbStatuses,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_statuses;",
    "countById": "SELECT COUNT(*) FROM db_statuses WHERE id = :id;",
    "oldest": "SELECT * FROM db_statuses ORDER BY created_at ASC LIMIT 1;",
    "deleteById": "DELETE FROM db_statuses WHERE id = :id;",
    "deleteByRemoteId": "DELETE FROM db_statuses WHERE remote_id = "
        ":remoteId;",
    "clear": "DELETE FROM db_statuses",
    "getAll": "SELECT * FROM db_statuses",
    "findLocalIdByRemoteId": "SELECT id FROM db_statuses WHERE remote_id = "
        ":remoteId;",
    "deleteOlderThanDate":
        "DELETE FROM db_statuses WHERE created_at < :createdAt",
    "deleteOlderThanLocalId": "DELETE FROM db_statuses WHERE id = "
        ":localId;",
    "getNewestByLocalIdWithOffset":
        "SELECT * FROM db_statuses ORDER BY id DESC LIMIT 1 OFFSET :offset",
  },
)
class StatusDao extends PopulatedAppRemoteDatabaseDao<
    DbStatus,
    DbStatusPopulated,
    int,
    String,
    $DbStatusesTable,
    $DbStatusesTable> with _$StatusDaoMixin {
  final AppDatabase db;
  late $DbAccountsTable accountAlias;
  late $DbStatusesTable reblogAlias;
  late $DbAccountsTable reblogAccountAlias;
  late $DbStatusesTable replyAlias;
  late $DbAccountsTable replyAccountAlias;
  late $DbStatusesTable replyReblogAlias;
  late $DbAccountsTable replyReblogAccountAlias;
  $DbStatusesTable? statusAlias;
  late $DbStatusHashtagsTable statusHashtagsAlias;
  late $DbStatusListsTable statusListsAlias;
  late $DbAccountFollowingsTable accountFollowingsAlias;
  late $DbAccountFollowingsTable replyToAccountFollowingsAlias;
  late $DbConversationStatusesTable conversationStatusesAlias;
  late $DbHomeTimelineStatusesTable homeTimelineStatusesAlias;

  // Called by the AppDatabase class
  StatusDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    reblogAlias = alias(db.dbStatuses, _reblogAliasId);
    reblogAccountAlias = alias(db.dbAccounts, _reblogAccountAliasId);
    replyAlias = alias(db.dbStatuses, _replyAliasId);
    replyAccountAlias = alias(db.dbAccounts, _replyAccountAliasId);
    replyReblogAlias = alias(db.dbStatuses, _replyReblogAliasId);
    replyReblogAccountAlias = alias(db.dbAccounts, _replyReblogAccountAliasId);
    statusAlias = alias(db.dbStatuses, _statusAliasId);
    accountFollowingsAlias =
        alias(db.dbAccountFollowings, _accountFollowingsAliasId);
    replyToAccountFollowingsAlias =
        alias(db.dbAccountFollowings, _replyToAccountFollowingsAliasId);
    statusHashtagsAlias = alias(db.dbStatusHashtags, _statusHashtagsAliasId);
    statusListsAlias = alias(db.dbStatusLists, _statusListsAliasId);
    conversationStatusesAlias =
        alias(db.dbConversationStatuses, _conversationStatusesAliasId);
    homeTimelineStatusesAlias =
        alias(db.dbHomeTimelineStatuses, _homeTimelineStatusesAliasId);
  }

  Future<DbStatusPopulated?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async =>
      (await _findByOldPendingRemoteId(oldPendingRemoteId).getSingleOrNull())
          ?.toDbStatusPopulated(dao: this);

  Stream<DbStatusPopulated?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) =>
      (_findByOldPendingRemoteId(oldPendingRemoteId).watchSingleOrNull().map(
            (typedResult) => typedResult?.toDbStatusPopulated(dao: this),
          ));

  JoinedSelectStatement<Table, DataClass> _findByOldPendingRemoteId(
    String? oldPendingRemoteId,
  ) =>
      (select(db.dbStatuses)
            ..where(
              (status) => status.oldPendingRemoteId.equals(
                oldPendingRemoteId,
              ),
            ))
          .join(
        populateStatusJoin(
          includeAccountFollowing: false,
          includeStatusLists: false,
          includeStatusHashtags: false,
          includeConversations: false,
          includeHomeTimeline: false,
          includeReplyToAccountFollowing: false,
        ),
      );

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbStatus> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbStatuses)
            ..where(
              (i) => i.id.equals(
                localId,
              ),
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

  // TODO: separate media in own table & use join
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyMediaWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where(
          (status) => status.mediaAttachments.isNotNull(),
//            |
//            status.mediaAttachments.equals("").not()
        );

  // todo: improve performance: remove url.like filter. Add local flag on insert
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyLocalWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? localDomain,
  ) =>
      query
        ..where((status) =>
            status.pleromaLocal.equals(true) |
            status.url.like("%$localDomain%"));

  // todo: improve performance: remove url.like filter. Add local flag on insert
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyRemoteWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? localDomain,
  ) =>
      query
        ..where((status) => (status.pleromaLocal.equals(true).not() &
            status.url.like("%$localDomain%").not()));

  // todo: improve performance: remove url.like filter. Add local flag on insert
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyFromInstanceWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? instance,
  ) =>
      query..where((status) => status.url.like("%$instance%"));

  void addExcludeTextWhere(
    JoinedSelectStatement<Table, DataClass> query, {
    required String? phrase,
    required bool wholeWord,
  }) {
    addExcludeTextConditionWhere(
      query,
      tableName: "db_statuses",
      fieldName: dbStatuses.content.$name,
      phrase: phrase,
      wholeWord: wholeWord,
    );
    addExcludeTextConditionWhere(
      query,
      tableName: "db_statuses",
      fieldName: dbStatuses.spoilerText.$name,
      phrase: phrase,
      wholeWord: wholeWord,
    );
    addExcludeTextConditionWhere(
      query,
      tableName: _reblogAliasId,
      fieldName: reblogAlias.content.$name,
      phrase: phrase,
      wholeWord: wholeWord,
    );
    addExcludeTextConditionWhere(
      query,
      tableName: _reblogAliasId,
      fieldName: reblogAlias.spoilerText.$name,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  // todo: improve performance: remove url.like filter. Add local flag on insert
  JoinedSelectStatement addExcludeTextConditionWhere(
    JoinedSelectStatement query, {
    required String tableName,
    required String fieldName,
    required String? phrase,
    required bool wholeWord,
  }) {
    String expressionCondition;
    if (wholeWord) {
      final regex = r"\b" + phrase! + r"\b";
      expressionCondition = "NOT REGEXP '$regex'";
    } else {
      expressionCondition = "NOT LIKE '%$phrase%'";
    }
    String expressionContent = "$tableName.$fieldName $expressionCondition";

    return query
      ..where(
        CustomExpression<bool>(expressionContent) |
            CustomExpression<bool>("$tableName.$fieldName IS NULL"),
      );
  }

  JoinedSelectStatement addFollowingWhere(
    JoinedSelectStatement query,
    String? accountRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_accountFollowingsAliasId.account_remote_id = '$accountRemoteId'",
        ));

  JoinedSelectStatement addHashtagWhere(
    JoinedSelectStatement query,
    String? hashtag,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_statusHashtagsAliasId.hashtag = '$hashtag'",
        ));

  JoinedSelectStatement addListWhere(
    JoinedSelectStatement query,
    String? listRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_statusListsAliasId.list_remote_id = '$listRemoteId'",
        ));

  JoinedSelectStatement addConversationWhere(
    JoinedSelectStatement query,
    String? conversationRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_conversationStatusesAliasId.conversation_remote_id"
          " = '$conversationRemoteId'",
        ));

  JoinedSelectStatement addReplyToAccountSelfOrFollowingWhere(
    JoinedSelectStatement query,
    String? myAccountRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
                "db_statuses.in_reply_to_account_remote_id IS NULL",
              ) |
              CustomExpression<bool>(
                "db_statuses.in_reply_to_account_remote_id = '$myAccountRemoteId'",
              ) |
              CustomExpression<bool>(
                "$_replyToAccountFollowingsAliasId.account_remote_id = "
                // "$_replyToAccountFollowingsAliasId.following_account_remote_id = "
                "'$myAccountRemoteId'",
              ),
        );

  //
  // query
  // ..where((status) =>
  // isNull(status.inReplyToAccountRemoteId) |
  // status.inReplyToAccountRemoteId.equals(accountRemoteId));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNotMutedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where(
          (status) => status.muted.equals(false),
          // (status.muted.equals(false)) &
          // (status.pleromaThreadMuted.equals(false) |
          //     isNull(status.pleromaThreadMuted))
        );

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyFromAccountWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? accountRemoteId,
  ) =>
      query..where((status) => status.accountRemoteId.equals(accountRemoteId));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNoNsfwSensitiveWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query..where((status) => status.sensitive.equals(true).not());

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyFavouritedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query..where((status) => status.favourited.equals(true));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyBookmarkedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query..where((status) => status.bookmarked.equals(true));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNotDeletedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where(
          (status) =>
              status.deleted.isNull() |
              status.deleted.equals(
                false,
              ),
        );

  SimpleSelectStatement<$DbStatusesTable, DbStatus>
      addOnlyNotHiddenLocallyOnDeviceWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
          query
            ..where(
              (status) =>
                  status.hiddenLocallyOnDevice.isNull() |
                  status.hiddenLocallyOnDevice.equals(
                    false,
                  ),
            );

  SimpleSelectStatement<$DbStatusesTable, DbStatus>
      addOnlyPendingStatePublishedOrNull(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
          query
            ..where(
              (status) =>
                  status.pendingState.isNull() |
                  status.pendingState.equals(
                    PendingState.published.toJsonValue(),
                  ),
            );

  SimpleSelectStatement<$DbStatusesTable, DbStatus>
      addOnlyInReplyToAccountRemoteIdOrNotReply(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? accountRemoteId,
  ) =>
          query
            ..where((status) =>
                status.inReplyToAccountRemoteId.isNull() |
                status.inReplyToAccountRemoteId.equals(accountRemoteId));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNoRepliesWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where(
          (status) => status.inReplyToRemoteId.isNull(),
        );

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query, {
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_statuses.remote_id > '$minimumRemoteIdExcluding'",
      );
      query = query..where((status) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_statuses.remote_id < '$maximumRemoteIdExcluding'",
      );
      query = query..where((status) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addCreatedAtBoundsWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query, {
    required DateTime? minimumDateTimeExcluding,
    required DateTime? maximumDateTimeExcluding,
  }) {
    var minimumExist = minimumDateTimeExcluding != null;
    var maximumExist = maximumDateTimeExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      query = query
        ..where((status) =>
            status.createdAt.isBiggerThanValue(minimumDateTimeExcluding));
    }
    if (maximumExist) {
      query = query
        ..where((status) =>
            status.createdAt.isSmallerThanValue(maximumDateTimeExcluding));
    }

    return query;
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addExcludeVisibilitiesWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    List<PleromaVisibility> excludeVisibilities,
  ) {
    assert(excludeVisibilities.isNotEmpty == true);

    List<String?> excludeVisibilityStrings = excludeVisibilities
        .map((visibility) => visibility.toJsonValue())
        .toList();

    return query
      ..where((status) => status.visibility.isNotIn(excludeVisibilityStrings));
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> orderBy(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    List<StatusRepositoryOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case StatusRepositoryOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                    case StatusRepositoryOrderType.createdAt:
                      expression = item.createdAt;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  List<Join<Table, DataClass>> populateStatusJoin({
    required includeAccountFollowing,
    required includeReplyToAccountFollowing,
    required includeStatusHashtags,
    required includeStatusLists,
    required includeConversations,
    required includeHomeTimeline,
  }) {
    return [
      ...(includeHomeTimeline
          ? [
              innerJoin(
                homeTimelineStatusesAlias,
                homeTimelineStatusesAlias.statusRemoteId
                    .equalsExp(dbStatuses.remoteId),
              ),
            ]
          : []),
      innerJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(dbStatuses.accountRemoteId),
      ),
      leftOuterJoin(
        reblogAlias,
        reblogAlias.remoteId.equalsExp(dbStatuses.reblogStatusRemoteId),
      ),
      leftOuterJoin(
        reblogAccountAlias,
        reblogAccountAlias.remoteId.equalsExp(reblogAlias.accountRemoteId),
      ),
      leftOuterJoin(
        replyAlias,
        replyAlias.remoteId.equalsExp(dbStatuses.inReplyToRemoteId),
      ),
      leftOuterJoin(
        replyAccountAlias,
        replyAccountAlias.remoteId.equalsExp(replyAlias.accountRemoteId),
      ),
      leftOuterJoin(
        replyReblogAlias,
        replyReblogAlias.remoteId.equalsExp(replyAlias.reblogStatusRemoteId),
      ),
      leftOuterJoin(
        replyReblogAccountAlias,
        replyReblogAccountAlias.remoteId
            .equalsExp(replyReblogAlias.accountRemoteId),
      ),
      ...(includeAccountFollowing
          ? [
              innerJoin(
                accountFollowingsAlias,
                accountFollowingsAlias.followingAccountRemoteId
                    .equalsExp(dbStatuses.accountRemoteId),
              ),
            ]
          : []),
      ...(includeReplyToAccountFollowing
          ? [
              leftOuterJoin(
                replyToAccountFollowingsAlias,
                replyToAccountFollowingsAlias.followingAccountRemoteId
                    .equalsExp(dbStatuses.inReplyToAccountRemoteId),
              ),
            ]
          : []),
      ...(includeStatusHashtags
          ? [
              innerJoin(
                statusHashtagsAlias,
                statusHashtagsAlias.statusRemoteId
                    .equalsExp(dbStatuses.remoteId),
              ),
            ]
          : []),
      ...(includeStatusLists
          ? [
              innerJoin(
                statusListsAlias,
                statusListsAlias.statusRemoteId.equalsExp(dbStatuses.remoteId),
              ),
            ]
          : []),
      ...(includeConversations
          ? [
              innerJoin(
                conversationStatusesAlias,
                conversationStatusesAlias.statusRemoteId
                    .equalsExp(dbStatuses.remoteId),
              ),
            ]
          : []),
    ];
  }

  Future incrementRepliesCount({required String? remoteId}) {
    var update = "UPDATE db_statuses "
        "SET replies_count = replies_count + 1 "
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  Future markAsDeleted({required String? remoteId}) {
    var update = "UPDATE db_statuses "
        "SET deleted = 1 "
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  Future markAsHiddenLocallyOnDevice({required int? localId}) {
    var update = "UPDATE db_statuses "
        "SET hidden_locally_on_device = 1 "
        "WHERE id = '$localId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  @override
  $DbStatusesTable get table => dbStatuses;
}

extension TypedResultDbStatusPopulatedExtension on TypedResult {
  DbStatusPopulated toDbStatusPopulated({
    required StatusDao dao,
  }) {
    TypedResult typedResult = this;
    return DbStatusPopulated(
      reblogDbStatus: typedResult.readTableOrNull(dao.reblogAlias),
      reblogDbStatusAccount:
          typedResult.readTableOrNull(dao.reblogAccountAlias),
      dbStatus: typedResult.readTable(dao.db.dbStatuses),
      dbAccount: typedResult.readTable(dao.accountAlias),
      replyDbStatus: typedResult.readTableOrNull(dao.replyAlias),
      replyDbStatusAccount: typedResult.readTableOrNull(dao.replyAccountAlias),
      replyReblogDbStatus: typedResult.readTableOrNull(dao.replyReblogAlias),
      replyReblogDbStatusAccount:
          typedResult.readTableOrNull(dao.replyReblogAccountAlias),
    );
  }
}

extension TypedResultListDbStatusPopulatedExtension on List<TypedResult> {
  List<DbStatusPopulated> toDbStatusPopulatedList({
    required StatusDao dao,
  }) {
    return map(
      (typedResult) => typedResult.toDbStatusPopulated(dao: dao),
    ).toList();
  }
}

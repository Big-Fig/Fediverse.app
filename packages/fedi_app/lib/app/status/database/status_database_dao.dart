import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi_app/app/pending/pending_model.dart';
import 'package:fedi_app/app/status/database/status_database_model.dart';
import 'package:fedi_app/app/status/repository/status_repository_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'status_database_dao.g.dart';

var _accountAliasId = 'account';
var _reblogAliasId = 'reblog';
var _reblogAccountAliasId = 'reblogAccount';
var _replyAliasId = 'reply';
var _replyAccountAliasId = 'replyAccount';
var _replyReblogAliasId = 'replyReblog';
var _replyReblogAccountAliasId = 'replyReblogAccount';
var _statusAliasId = 'status';
var _accountFollowingsAliasId = 'accountFollowings';
var _replyToAccountFollowingsAliasId = 'replyToAccountFollowings';
var _statusHashtagsAliasId = 'statusHashtags';
var _statusListsAliasId = 'statusLists';
var _conversationStatusesAliasId = 'conversationStatuses';
var _homeTimelineStatusesAliasId = 'homeTimelineStatuses';

@UseDao(
  tables: [
    DbStatuses,
  ],
)
class StatusDao extends PopulatedAppRemoteDatabaseDao<
    DbStatus,
    DbStatusPopulated,
    int,
    String,
    $DbStatusesTable,
    $DbStatusesTable,
    StatusRepositoryFilters,
    StatusRepositoryOrderingTermData> with _$StatusDaoMixin {
  final AppDatabase db;

  // ignore: avoid-late-keyword
  late $DbAccountsTable accountAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable reblogAlias;

  // ignore: avoid-late-keyword
  late $DbAccountsTable reblogAccountAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable replyAlias;

  // ignore: avoid-late-keyword
  late $DbAccountsTable replyAccountAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable replyReblogAlias;

  // ignore: avoid-late-keyword
  late $DbAccountsTable replyReblogAccountAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable statusAlias;

  // ignore: avoid-late-keyword
  late $DbStatusHashtagsTable statusHashtagsAlias;

  // ignore: avoid-late-keyword
  late $DbStatusListsTable statusListsAlias;

  // ignore: avoid-late-keyword
  late $DbAccountFollowingsTable accountFollowingsAlias;

  // ignore: avoid-late-keyword
  late $DbAccountFollowingsTable replyToAccountFollowingsAlias;

  // ignore: avoid-late-keyword
  late $DbConversationStatusesTable conversationStatusesAlias;

  // ignore: avoid-late-keyword
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
      _findByOldPendingRemoteId(oldPendingRemoteId).watchSingleOrNull().map(
            (typedResult) => typedResult?.toDbStatusPopulated(dao: this),
          );

  JoinedSelectStatement _findByOldPendingRemoteId(
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

  // TODO: separate media in own table & use join
  void addOnlyMediaWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) => status.mediaAttachments.isNotNull(),
//            |
//            status.mediaAttachments.equals("").not()
      );

  // todo: improve performance: remove url.like filter. Add local flag on insert
  void addOnlyLocalWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? localDomain,
  ) =>
      query.where(
        (status) =>
            status.local.equals(true) | status.url.like('%$localDomain%'),
      );

  // todo: improve performance: remove url.like filter. Add local flag on insert
  void addOnlyRemoteWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? localDomain,
  ) =>
      query.where(
        (status) =>
            status.local.equals(true).not() &
            status.url.like('%$localDomain%').not(),
      );

  // todo: improve performance: remove url.like filter. Add local flag on insert
  void addOnlyFromInstanceWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? instance,
  ) =>
      query.where((status) => status.url.like('%$instance%'));

  void addExcludeTextWhere(
    JoinedSelectStatement query, {
    required String? phrase,
    required bool wholeWord,
  }) {
    addExcludeTextConditionWhere(
      query,
      tableName: 'db_statuses',
      fieldName: dbStatuses.content.$name,
      phrase: phrase,
      wholeWord: wholeWord,
    );
    addExcludeTextConditionWhere(
      query,
      tableName: 'db_statuses',
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
  void addExcludeTextConditionWhere(
    JoinedSelectStatement query, {
    required String tableName,
    required String fieldName,
    required String? phrase,
    required bool wholeWord,
  }) {
    String expressionCondition;
    if (wholeWord) {
      final regex = r'\b' + phrase! + r'\b';
      expressionCondition = "NOT REGEXP '$regex'";
    } else {
      expressionCondition = "NOT LIKE '%$phrase%'";
    }
    var expressionContent = '$tableName.$fieldName $expressionCondition';

    query.where(
      CustomExpression<bool>(expressionContent) |
          CustomExpression<bool>('$tableName.$fieldName IS NULL'),
    );
  }

  JoinedSelectStatement addFollowingWhere(
    JoinedSelectStatement query,
    String? accountRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
            "$_accountFollowingsAliasId.account_remote_id = '$accountRemoteId'",
          ),
        );

  JoinedSelectStatement addHashtagWhere(
    JoinedSelectStatement query,
    String? hashtag,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
            "$_statusHashtagsAliasId.hashtag = '$hashtag'",
          ),
        );

  JoinedSelectStatement addListWhere(
    JoinedSelectStatement query,
    String? listRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
            "$_statusListsAliasId.list_remote_id = '$listRemoteId'",
          ),
        );

  JoinedSelectStatement addConversationWhere(
    JoinedSelectStatement query,
    String? conversationRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
            '$_conversationStatusesAliasId.conversation_remote_id'
            " = '$conversationRemoteId'",
          ),
        );

  JoinedSelectStatement addReplyToAccountSelfOrFollowingWhere(
    JoinedSelectStatement query,
    String? myAccountRemoteId,
  ) =>
      query
        ..where(
          const CustomExpression<bool>(
                'db_statuses.in_reply_to_account_remote_id IS NULL',
              ) |
              CustomExpression<bool>(
                "db_statuses.in_reply_to_account_remote_id = '$myAccountRemoteId'",
              ) |
              CustomExpression<bool>(
                '$_replyToAccountFollowingsAliasId.account_remote_id = '
                // "$_replyToAccountFollowingsAliasId.following_account_remote_id = "
                "'$myAccountRemoteId'",
              ),
        );

  //
  // query
  // ..where((status) =>
  // isNull(status.inReplyToAccountRemoteId) |
  // status.inReplyToAccountRemoteId.equals(accountRemoteId));

  void addOnlyNotMutedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) => status.muted.equals(false),
        // (status.muted.equals(false)) &
        // (status.threadMuted.equals(false) |
        //     isNull(status.threadMuted))
      );

  void addOnlyFromAccountWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? accountRemoteId,
  ) =>
      query.where((status) => status.accountRemoteId.equals(accountRemoteId));

  void addOnlyNoNsfwSensitiveWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where((status) => status.sensitive.equals(true).not());

  void addOnlyFavouritedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where((status) => status.favourited.equals(true));

  void addOnlyBookmarkedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where((status) => status.bookmarked.equals(true));

  void addOnlyNotDeletedWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) =>
            status.deleted.isNull() |
            status.deleted.equals(
              false,
            ),
      );

  void addOnlyNotHiddenLocallyOnDeviceWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) =>
            status.hiddenLocallyOnDevice.isNull() |
            status.hiddenLocallyOnDevice.equals(
              false,
            ),
      );

  void addOnlyPendingStatePublishedOrNull(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) =>
            status.pendingState.isNull() |
            status.pendingState.equals(
              PendingState.published.toJsonValue(),
            ),
      );

  void addOnlyInReplyToAccountRemoteIdOrNotReply(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    String? accountRemoteId,
  ) =>
      query.where(
        (status) =>
            status.inReplyToAccountRemoteId.isNull() |
            status.inReplyToAccountRemoteId.equals(accountRemoteId),
      );

  void addOnlyNoRepliesWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query.where(
        (status) => status.inReplyToRemoteId.isNull(),
      );

  void addExcludeVisibilitiesWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    List<UnifediApiVisibility> excludeVisibilities,
  ) {
    assert(
      excludeVisibilities.isNotEmpty,
      'at least one visibility should be specified',
    );

    List<String?> excludeVisibilityStrings = excludeVisibilities
        .map((visibility) => visibility.stringValue)
        .toList();

    query
        .where((status) => status.visibility.isNotIn(excludeVisibilityStrings));
  }

  void orderBy(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    List<StatusRepositoryOrderingTermData> orderTerms,
  ) =>
      query.orderBy(
        orderTerms
            .map(
              (orderTerm) => ($DbStatusesTable item) {
                GeneratedColumn<Object?> expression;
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
              },
            )
            .toList(),
      );

  // ignore: long-method
  List<Join> populateStatusJoin({
    required bool includeAccountFollowing,
    required bool includeReplyToAccountFollowing,
    required bool includeStatusHashtags,
    required bool includeStatusLists,
    required bool includeConversations,
    required bool includeHomeTimeline,
  }) =>
      [
        ...includeHomeTimeline
            ? [
                innerJoin(
                  homeTimelineStatusesAlias,
                  homeTimelineStatusesAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId),
                ),
              ]
            : [],
        // todo: think about leftOuterJoin and nullable account field
        // or foreign keys
        // in some cases status may already exist in local database,
        // but account still not added
        // leftOuterJoin(
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
        ...includeAccountFollowing
            ? [
                innerJoin(
                  accountFollowingsAlias,
                  accountFollowingsAlias.followingAccountRemoteId
                      .equalsExp(dbStatuses.accountRemoteId),
                ),
              ]
            : [],
        ...includeReplyToAccountFollowing
            ? [
                leftOuterJoin(
                  replyToAccountFollowingsAlias,
                  replyToAccountFollowingsAlias.followingAccountRemoteId
                      .equalsExp(dbStatuses.inReplyToAccountRemoteId),
                ),
              ]
            : [],
        ...includeStatusHashtags
            ? [
                innerJoin(
                  statusHashtagsAlias,
                  statusHashtagsAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId),
                ),
              ]
            : [],
        ...includeStatusLists
            ? [
                innerJoin(
                  statusListsAlias,
                  statusListsAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId),
                ),
              ]
            : [],
        ...includeConversations
            ? [
                innerJoin(
                  conversationStatusesAlias,
                  conversationStatusesAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId),
                ),
              ]
            : [],
      ];

  Future<void> incrementRepliesCount({required String? remoteId}) {
    var update = 'UPDATE db_statuses '
        'SET replies_count = replies_count + 1 '
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  Future<void> markAsDeleted({required String? remoteId}) {
    var update = 'UPDATE db_statuses '
        'SET deleted = 1 '
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  Future<void> markAsHiddenLocallyOnDevice({required int? localId}) {
    var update = 'UPDATE db_statuses '
        'SET hidden_locally_on_device = 1 '
        "WHERE id = '$localId'";
    var query = db.customUpdate(update, updates: {dbStatuses});

    return query;
  }

  @override
  $DbStatusesTable get table => dbStatuses;

  Future<void> deleteOlderThanDate(
    DateTime dateTimeToDelete, {
    required Batch? batchTransaction,
  }) =>
      deleteOlderThanDateTime(
        dateTimeToDelete,
        fieldName: table.createdAt.$name,
        batchTransaction: batchTransaction,
      );

  @override
  DbStatusPopulated mapTypedResultToDbPopulatedItem(TypedResult typedResult) =>
      typedResult.toDbStatusPopulated(dao: this);

  @override
  // ignore: code-metrics, long-method
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    required StatusRepositoryFilters? filters,
  }) {
    assert(
      !(filters?.onlyLocalCondition != null &&
          filters?.onlyRemoteCondition != null),
      "onlyLocalCondition && onlyRemoteCondition  can't be set both",
    );

    if (filters?.onlyFromInstance?.isNotEmpty == true) {
      assert(
        filters?.onlyRemoteCondition != null,
        'onlyRemoteCondition should be notNull if onlyFromInstance was set',
      );

      addOnlyFromInstanceWhere(
        query,
        filters?.onlyFromInstance,
      );
    } else {
      if (filters?.onlyRemoteCondition != null) {
        addOnlyRemoteWhere(
          query,
          filters?.onlyRemoteCondition?.localUrlHost,
        );
      }
    }

    if (filters?.onlyLocalCondition != null) {
      assert(
        filters?.onlyLocalCondition?.localUrlHost?.isNotEmpty == true,
        'localUrlHost shoul be not empty',
      );

      addOnlyLocalWhere(
        query,
        filters?.onlyLocalCondition?.localUrlHost,
      );
    }

    if (filters?.onlyWithMedia == true) {
      addOnlyMediaWhere(query);
    }

    if (filters?.onlyFromAccount != null) {
      addOnlyFromAccountWhere(
        query,
        filters?.onlyFromAccount?.remoteId,
      );
    }

    if (filters?.withMuted != true) {
      addOnlyNotMutedWhere(query);
    }

    if (filters?.onlyNoNsfwSensitive == true) {
      addOnlyNoNsfwSensitiveWhere(query);
    }

    if (filters?.onlyBookmarked == true) {
      addOnlyBookmarkedWhere(query);
    }

    if (filters?.onlyFavourited == true) {
      addOnlyFavouritedWhere(query);
    }

    if (filters?.onlyNoReplies == true) {
      addOnlyNoRepliesWhere(query);
    }

    var excludeVisibilities = filters?.excludeVisibilities;
    if (excludeVisibilities?.isNotEmpty == true) {
      addExcludeVisibilitiesWhere(query, filters!.excludeVisibilities!);
    }

    if (filters?.onlyNotDeleted == true) {
      addOnlyNotDeletedWhere(query);
    }
    if (filters?.onlyNotHiddenLocallyOnDevice == true) {
      addOnlyNotHiddenLocallyOnDeviceWhere(query);
    }

    if (filters?.onlyPendingStatePublishedOrNull == true) {
      addOnlyPendingStatePublishedOrNull(query);
    }

    var replyVisibilityFilter =
        filters?.replyVisibilityFilterCondition?.replyVisibilityFilter;
    if (filters?.replyVisibilityFilterCondition?.replyVisibilityFilter !=
        null) {
      if (replyVisibilityFilter == UnifediApiReplyVisibilityFilter.selfValue) {
        addOnlyInReplyToAccountRemoteIdOrNotReply(
          query,
          filters?.replyVisibilityFilterCondition?.myAccountRemoteId,
        );
      }
    }
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    required RepositoryPagination<DbStatus>? pagination,
    required List<StatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
        orderingTerms?.length == 1,
        'only single order term is supported',
      );
      var orderingTermData = orderingTerms!.first;
      var isRemoteIdOrdering =
          orderingTermData.orderByType == StatusRepositoryOrderType.remoteId;
      var isCreatedAtOrdering =
          orderingTermData.orderByType == StatusRepositoryOrderType.createdAt;
      assert(
        isRemoteIdOrdering || isCreatedAtOrdering,
        'only remoteId or createdAt terms are supported',
      );
      if (isRemoteIdOrdering) {
        addRemoteIdBoundsWhere(
          query,
          maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
          minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
        );
      } else if (isCreatedAtOrdering) {
        addDateTimeBoundsWhere(
          query,
          column: dbStatuses.createdAt,
          maximumDateTimeExcluding: pagination?.olderThanItem?.createdAt,
          minimumDateTimeExcluding: pagination?.newerThanItem?.createdAt,
        );
      }
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    required List<StatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(query, orderingTerms ?? []);
  }

  @override
  // ignore: code-metrics, long-method
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
    required StatusRepositoryFilters? filters,
  }) {
    var needFilterByFollowing =
        filters?.onlyFromAccountsFollowingByAccount != null;
    var needFilterByList = filters?.onlyInListWithRemoteId?.isNotEmpty == true;
    var needFilterByTag = filters?.onlyWithHashtag?.isNotEmpty == true;
    var needFilterByConversation = filters?.onlyInConversation != null;
    var needFilterByHomeTimeline = filters?.isFromHomeTimeline == true;
    var includeReplyToAccountFollowing = false;

    var replyVisibilityFilter =
        filters?.replyVisibilityFilterCondition?.replyVisibilityFilter;
    if (filters?.replyVisibilityFilterCondition?.replyVisibilityFilter !=
        null) {
      if (replyVisibilityFilter ==
          UnifediApiReplyVisibilityFilter.followingValue) {
        includeReplyToAccountFollowing = true;
      }
    }

    var joinQuery = query.join(
      populateStatusJoin(
        includeAccountFollowing: needFilterByFollowing,
        includeStatusLists: needFilterByList,
        includeStatusHashtags: needFilterByTag,
        includeConversations:
            needFilterByConversation || filters?.mustBeConversationItem == true,
        includeHomeTimeline: needFilterByHomeTimeline,
        includeReplyToAccountFollowing: includeReplyToAccountFollowing,
      ),
    );

    var finalQuery = joinQuery;

    if (filters?.replyVisibilityFilterCondition?.replyVisibilityFilter !=
        null) {
      if (replyVisibilityFilter ==
          UnifediApiReplyVisibilityFilter.followingValue) {
        finalQuery = addReplyToAccountSelfOrFollowingWhere(
          joinQuery,
          filters?.replyVisibilityFilterCondition?.myAccountRemoteId,
        );
      }
    }

    if (filters?.excludeTextConditions?.isNotEmpty == true) {
      for (final textCondition in filters!.excludeTextConditions!) {
        addExcludeTextWhere(
          joinQuery,
          phrase: textCondition.phrase,
          wholeWord: textCondition.wholeWord,
        );
      }
    }

    if (needFilterByFollowing) {
      finalQuery = addFollowingWhere(
        joinQuery,
        filters?.onlyFromAccountsFollowingByAccount?.remoteId,
      );
    }
    if (needFilterByList) {
      finalQuery = addListWhere(
        finalQuery,
        filters?.onlyInListWithRemoteId,
      );
    }
    if (needFilterByConversation) {
      finalQuery = addConversationWhere(
        finalQuery,
        filters?.onlyInConversation?.remoteId,
      );
    }

    if (needFilterByTag) {
      finalQuery = addHashtagWhere(
        finalQuery,
        filters?.onlyWithHashtag,
      );
    }

    // if (needFilterByHomeTimeline) {
    //   // nothing it is filtered by inner join
    // }

    return joinQuery;
  }
}

extension TypedResultDbStatusPopulatedExtension on TypedResult {
  DbStatusPopulated toDbStatusPopulated({
    required StatusDao dao,
  }) {
    var typedResult = this;

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
  }) =>
      map(
        (typedResult) => typedResult.toDbStatusPopulated(dao: dao),
      ).toList();
}

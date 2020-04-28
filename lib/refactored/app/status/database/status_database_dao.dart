import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/database/status_database_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:moor/moor.dart';

part 'status_database_dao.g.dart';

var _accountAliasId = "account";
var _reblogAliasId = "reblog";
var _reblogAccountAliasId = "reblogAccount";
var _statusAliasId = "status";
var _accountFollowingsAliasId = "accountFollowings";
var _statusHashtagsAliasId = "statusHashtags";
var _statusListsAliasId = "statusLists";
var _conversationStatusesAliasId = "conversationStatuses";

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
  $DbStatusesTable reblogAlias;
  $DbAccountsTable reblogAccountAlias;
  $DbStatusesTable statusAlias;
  $DbStatusHashtagsTable statusHashtagsAlias;
  $DbStatusListsTable statusListsAlias;
  $DbAccountFollowingsTable accountFollowingsAlias;
  $DbConversationStatusesTable conversationStatusesAlias;

  // Called by the AppDatabase class
  StatusDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    reblogAlias = alias(db.dbStatuses, _reblogAliasId);
    reblogAccountAlias = alias(db.dbAccounts, _reblogAccountAliasId);
    statusAlias = alias(db.dbStatuses, _statusAliasId);
    accountFollowingsAlias =
        alias(db.dbAccountFollowings, _accountFollowingsAliasId);
    statusHashtagsAlias = alias(db.dbStatusHashtags, _statusHashtagsAliasId);
    statusListsAlias = alias(db.dbStatusLists, _statusListsAliasId);
    conversationStatusesAlias =
        alias(db.dbConversationStatuses, _conversationStatusesAliasId);
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

  Stream<DbStatusPopulated> watchByRemoteId(String remoteId) =>
      (_findByRemoteId(remoteId).watchSingle().map(typedResultToPopulated));

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbStatuses).join(
      populateStatusJoin(
          includeAccountFollowing: false,
          includeStatusLists: false,
          includeStatusHashtags: false,
          includeConversations: false),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbStatuses)..where((status) => status.id.equals(id))).join(
          populateStatusJoin(
              includeAccountFollowing: false,
              includeStatusLists: false,
              includeStatusHashtags: false,
              includeConversations: false));

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String remoteId) =>
      (select(db.dbStatuses)..where((status) => status.remoteId.like(remoteId)))
          .join(populateStatusJoin(
              includeAccountFollowing: false,
              includeStatusLists: false,
              includeStatusHashtags: false,
              includeConversations: false));

  Future<int> insert(Insertable<DbStatus> entity) async =>
      into(db.dbStatuses).insert(entity);

  Future<int> upsert(Insertable<DbStatus> entity) async =>
      into(db.dbStatuses).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          Iterable<Insertable<DbStatus>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbStatuses, entities, mode: mode);
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

  SimpleSelectStatement<$DbStatusesTable, DbStatus> startSelectQuery() =>
      (select(db.dbStatuses));

  // TODO: separate media in own table & use join
  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyMediaWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query
        ..where((status) =>
            isNotNull(status.mediaAttachments) |
            status.mediaAttachments.equals(""));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyLocalWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
          String localDomain) =>
      query
        ..where((status) =>
            status.pleromaLocal.equals(true) |
            status.url.like("%$localDomain%"));

  JoinedSelectStatement addFollowingWhere(
          JoinedSelectStatement query, String accountRemoteId) =>
      query
        ..where(CustomExpression<bool, BoolType>(
            "$_accountFollowingsAliasId.account_remote_id = '$accountRemoteId'"));

  JoinedSelectStatement addHashtagWhere(
          JoinedSelectStatement query, String hashtag) =>
      query
        ..where(CustomExpression<bool, BoolType>(
            "$_statusHashtagsAliasId.hashtag = '$hashtag'"));

  JoinedSelectStatement addListWhere(
          JoinedSelectStatement query, String listRemoteId) =>
      query
        ..where(CustomExpression<bool, BoolType>(
            "$_statusListsAliasId.list_remote_id = '$listRemoteId'"));

  JoinedSelectStatement addConversationWhere(
          JoinedSelectStatement query, String conversationRemoteId) =>
      query
        ..where(CustomExpression<bool, BoolType>(
            "$_conversationStatusesAliasId.conversation_remote_id"
            " = '$conversationRemoteId'"));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNotMutedWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query
        ..where((status) =>
            (status.muted.equals(false)) &
            (status.pleromaThreadMuted.equals(false) |
                isNull(status.pleromaThreadMuted)));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyFromAccountWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
          String accountRemoteId) =>
      query..where((status) => status.accountRemoteId.equals(accountRemoteId));

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNoNsfwSensitiveWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query..where((status) => status.sensitive.equals(true).not());

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyNoRepliesWhere(
          SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query..where((status) => isNull(status.inReplyToRemoteId));

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
    DbStatus rebloggedStatus;
    DbAccount rebloggedStatusAccount;
    rebloggedStatus = typedResult.readTable(reblogAlias);
    rebloggedStatusAccount = typedResult.readTable(reblogAccountAlias);
//
//    _logger.finest(() => "rebloggedStatus $rebloggedStatus");
//    _logger.finest(() => "rebloggedStatusAccount $rebloggedStatusAccount");
    return DbStatusPopulated(
        reblogDbStatus: rebloggedStatus,
        reblogDbStatusAccount: rebloggedStatusAccount,
        dbStatus: typedResult.readTable(db.dbStatuses),
        dbAccount: typedResult.readTable(accountAlias));
  }

  List<Join<Table, DataClass>> populateStatusJoin({
    @required includeAccountFollowing,
    @required includeStatusHashtags,
    @required includeStatusLists,
    @required includeConversations,
  }) {
    return [
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
      ...(includeAccountFollowing
          ? [
              innerJoin(
                  accountFollowingsAlias,
                  accountFollowingsAlias.followingAccountRemoteId
                      .equalsExp(dbStatuses.accountRemoteId))
            ]
          : []),
      ...(includeStatusHashtags
          ? [
              innerJoin(
                  statusHashtagsAlias,
                  statusHashtagsAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId))
            ]
          : []),
      ...(includeStatusLists
          ? [
              innerJoin(
                  statusListsAlias,
                  statusListsAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId))
            ]
          : []),
      ...(includeConversations
          ? [
              innerJoin(
                  conversationStatusesAlias,
                  conversationStatusesAlias.statusRemoteId
                      .equalsExp(dbStatuses.remoteId))
            ]
          : [])
    ];
  }
}

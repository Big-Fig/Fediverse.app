import 'package:fedi/app/account/database/account_database_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'account_database_dao.g.dart';

var _accountAliasId = "account";
var _accountFollowingsAliasId = "accountFollowings";
var _accountFollowersAliasId = "accountFollowers";
var _statusRebloggedAccounts = "statusRebloggedAccounts";
var _statusFavouritedAccounts = "statusFavouritedAccounts";
var _conversationAccountsAliasId = "conversationAccounts";
var _chatAccountsAliasId = "chatAccountsAliasId";

@UseDao(
  tables: [DbAccounts],
  queries: {
    "countAll": "SELECT Count(*) FROM db_accounts;",
    "findById": "SELECT * FROM db_accounts WHERE id = :id;",
    "findByRemoteId":
        "SELECT * FROM db_accounts WHERE remote_id LIKE :remoteId;",
    "oldest": "SELECT * FROM db_accounts ORDER BY last_status_at ASC LIMIT 1;",
    "countById": "SELECT COUNT(*) FROM db_accounts WHERE id = :id;",
    "deleteById": "DELETE FROM db_accounts WHERE id = :id;",
    "clear": "DELETE FROM db_accounts",
    "getAll": "SELECT * FROM db_accounts",
    "findLocalIdByRemoteId": "SELECT id FROM db_accounts WHERE remote_id = "
        ":remoteId;",
    "deleteOlderThanLocalId": "DELETE FROM db_accounts WHERE id = "
        ":id;",
    "getNewestByLocalIdWithOffset":
        "SELECT * FROM db_accounts ORDER BY id DESC LIMIT 1 OFFSET :offset",
  },
)
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  final AppDatabase db;
  $DbAccountsTable? accountAlias;
  late $DbAccountFollowingsTable accountFollowingsAlias;
  late $DbAccountFollowersTable accountFollowersAlias;
  late $DbStatusRebloggedAccountsTable statusRebloggedAccountsAlias;
  late $DbStatusFavouritedAccountsTable statusFavouritedAccountsAlias;
  late $DbConversationAccountsTable conversationAccountsAlias;
  late $DbChatAccountsTable chatAccountsAlias;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    accountFollowingsAlias =
        alias(db.dbAccountFollowings, _accountFollowingsAliasId);
    accountFollowersAlias =
        alias(db.dbAccountFollowers, _accountFollowersAliasId);
    statusRebloggedAccountsAlias =
        alias(db.dbStatusRebloggedAccounts, _statusRebloggedAccounts);
    statusFavouritedAccountsAlias =
        alias(db.dbStatusFavouritedAccounts, _statusFavouritedAccounts);
    conversationAccountsAlias =
        alias(db.dbConversationAccounts, _conversationAccountsAliasId);
    chatAccountsAlias = alias(db.dbChatAccounts, _chatAccountsAliasId);
  }

  Future<int> insert(Insertable<DbAccount> entity, {InsertMode? mode}) =>
      into(dbAccounts).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbAccount> entity) =>
      into(dbAccounts).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
    List<Insertable<DbAccount>> entities,
    InsertMode mode,
  ) async =>
      await batch(
        (batch) {
          batch.insertAll(
            dbAccounts,
            entities,
            mode: mode,
          );
        },
      );

  Future<bool> replace(Insertable<DbAccount> entity) async =>
      await update(dbAccounts).replace(entity);

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbAccount> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingleOrNull();

    if (localId != null && localId >= 0) {
      await (update(dbAccounts)
            ..where(
              (i) => i.id.equals(localId),
            ))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbAccountsTable, DbAccount> startSelectQuery() =>
      (select(db.dbAccounts));

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbAccountsTable, DbAccount> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbAccountsTable, DbAccount> query, {
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_accounts.remote_id > '$minimumRemoteIdExcluding'",
      );
      query = query..where((account) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_accounts.remote_id < '$maximumRemoteIdExcluding'",
      );
      query = query..where((account) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbAccountsTable, DbAccount> orderBy(
    SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    List<AccountRepositoryOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case AccountOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  List<Join<Table, DataClass>> populateAccountJoin({
    required includeAccountFollowings,
    required includeAccountFollowers,
    required includeStatusFavouritedAccounts,
    required includeStatusRebloggedAccounts,
    required includeConversationAccounts,
    required includeChatAccounts,
  }) {
    List<Join<Table, DataClass>> allJoins = [
      ...(includeAccountFollowings
          ? [
              innerJoin(
                accountFollowingsAlias,
                accountFollowingsAlias.followingAccountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
      ...(includeAccountFollowers
          ? [
              innerJoin(
                accountFollowersAlias,
                accountFollowersAlias.followerAccountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
      ...(includeStatusFavouritedAccounts
          ? [
              innerJoin(
                statusFavouritedAccountsAlias,
                statusFavouritedAccountsAlias.accountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
      ...(includeStatusRebloggedAccounts
          ? [
              innerJoin(
                statusRebloggedAccountsAlias,
                statusRebloggedAccountsAlias.accountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
      ...(includeConversationAccounts
          ? [
              leftOuterJoin(
                conversationAccountsAlias,
                conversationAccountsAlias.accountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
      ...(includeChatAccounts
          ? [
              leftOuterJoin(
                chatAccountsAlias,
                chatAccountsAlias.accountRemoteId
                    .equalsExp(dbAccounts.remoteId),
              ),
            ]
          : []),
    ];
    return allJoins;
  }

  SimpleSelectStatement<$DbAccountsTable, DbAccount> addSearchWhere(
    SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    String? searchQuery,
  ) =>
      query..where((account) => account.acct.like("%$searchQuery%"));

  JoinedSelectStatement addConversationWhere(
    JoinedSelectStatement query,
    String? conversationRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_conversationAccountsAliasId.conversation_remote_id"
          " = '$conversationRemoteId'",
        ));

  JoinedSelectStatement addChatWhere(
    JoinedSelectStatement query,
    String? chatRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>("$_chatAccountsAliasId.chat_remote_id"
            " = '$chatRemoteId'"));

  JoinedSelectStatement addStatusFavouritedByWhere(
    JoinedSelectStatement query,
    String? statusRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>("$_statusFavouritedAccounts.status_remote_id"
              " = '$statusRemoteId'"),
        );

  JoinedSelectStatement addStatusRebloggedByWhere(
    JoinedSelectStatement query,
    String? statusRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>("$_statusRebloggedAccounts.status_remote_id"
              " = '$statusRemoteId'"),
        );

  // todo: rework with single relationship table
  JoinedSelectStatement addFollowingsWhere(
    JoinedSelectStatement query,
    String? followingAccountRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          "$_accountFollowingsAliasId.account_remote_id"
          " = '$followingAccountRemoteId'",
        ));

  // todo: rework with single relationship table
  JoinedSelectStatement addFollowersWhere(
    JoinedSelectStatement query,
    String? followerAccountRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>("$_accountFollowersAliasId.account_remote_id"
              " = '$followerAccountRemoteId'"),
        );
}

extension DbAccountTypedResultExtension on TypedResult {
  DbAccount toDbAccount({
    required AccountDao dao,
  }) =>
      readTable(dao.db.dbAccounts);
}

extension DbAccountTypedResultListExtension on List<TypedResult> {
  List<DbAccount> toDbAccountList({
    required AccountDao dao,
  }) =>
      map(
        (item) => item.toDbAccount(dao: dao),
      ).toList();
}

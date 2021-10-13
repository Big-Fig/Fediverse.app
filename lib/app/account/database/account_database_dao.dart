import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/database/account_database_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'account_database_dao.g.dart';

var _accountAliasId = 'account';
var _accountFollowingsAliasId = 'accountFollowings';
var _accountFollowersAliasId = 'accountFollowers';
var _statusRebloggedAccounts = 'statusRebloggedAccounts';
var _statusFavouritedAccounts = 'statusFavouritedAccounts';
var _conversationAccountsAliasId = 'conversationAccounts';
var _chatAccountsAliasId = 'chatAccountsAliasId';

@UseDao(
  tables: [DbAccounts],
)
class AccountDao extends PopulatedAppRemoteDatabaseDao<
    DbAccount,
    DbAccountPopulated,
    int,
    String,
    $DbAccountsTable,
    $DbAccountsTable,
    AccountRepositoryFilters,
    AccountRepositoryOrderingTermData> with _$AccountDaoMixin {
  final AppDatabase db;
  // ignore: avoid-late-keyword
  late $DbAccountsTable? accountAlias;
  // ignore: avoid-late-keyword
  late $DbAccountFollowingsTable accountFollowingsAlias;
  // ignore: avoid-late-keyword
  late $DbAccountFollowersTable accountFollowersAlias;
  // ignore: avoid-late-keyword
  late $DbStatusRebloggedAccountsTable statusRebloggedAccountsAlias;
  // ignore: avoid-late-keyword
  late $DbStatusFavouritedAccountsTable statusFavouritedAccountsAlias;
  // ignore: avoid-late-keyword
  late $DbConversationAccountsTable conversationAccountsAlias;
  // ignore: avoid-late-keyword
  late $DbChatAccountsTable chatAccountsAlias;

  @override
  $DbAccountsTable get table => dbAccounts;

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

  List<Join> populateAccountJoin({
    required bool includeAccountFollowings,
    required bool includeAccountFollowers,
    required bool includeStatusFavouritedAccounts,
    required bool includeStatusRebloggedAccounts,
    required bool includeConversationAccounts,
    required bool includeChatAccounts,
  }) {
    var allJoins = <Join>[
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
      query..where((account) => account.acct.like('%$searchQuery%'));

  JoinedSelectStatement addConversationWhere(
    JoinedSelectStatement query,
    String? conversationRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          '$_conversationAccountsAliasId.conversation_remote_id'
          " = '$conversationRemoteId'",
        ));

  JoinedSelectStatement addChatWhere(
    JoinedSelectStatement query,
    String? chatRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>('$_chatAccountsAliasId.chat_remote_id'
            " = '$chatRemoteId'"));

  JoinedSelectStatement addStatusFavouritedByWhere(
    JoinedSelectStatement query,
    String? statusRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>('$_statusFavouritedAccounts.status_remote_id'
              " = '$statusRemoteId'"),
        );

  JoinedSelectStatement addStatusRebloggedByWhere(
    JoinedSelectStatement query,
    String? statusRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>('$_statusRebloggedAccounts.status_remote_id'
              " = '$statusRemoteId'"),
        );

  // todo: rework with single relationship table
  JoinedSelectStatement addFollowingsWhere(
    JoinedSelectStatement query,
    String? followingAccountRemoteId,
  ) =>
      query
        ..where(CustomExpression<bool>(
          '$_accountFollowingsAliasId.account_remote_id'
          " = '$followingAccountRemoteId'",
        ));

  // todo: rework with single relationship table
  JoinedSelectStatement addFollowersWhere(
    JoinedSelectStatement query,
    String? followerAccountRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>('$_accountFollowersAliasId.account_remote_id'
              " = '$followerAccountRemoteId'"),
        );

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required AccountRepositoryFilters? filters,
  }) {
    if (filters?.searchQuery != null) {
      addSearchWhere(query, filters?.searchQuery);
    }
    // other added after populating
    // todo: should be reworked
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required RepositoryPagination<DbAccount>? pagination,
    required List<AccountRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(orderingTermData.orderType == AccountOrderType.remoteId);
      query = addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required List<AccountRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  @override
  // ignore: code-metrics
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required AccountRepositoryFilters? filters,
  }) {
    var includeAccountFollowings = filters?.onlyInAccountFollowing != null;
    var includeAccountFollowers = filters?.onlyInAccountFollowers != null;
    var includeStatusFavouritedAccounts =
        filters?.onlyInStatusFavouritedBy != null;
    var includeStatusRebloggedAccounts =
        filters?.onlyInStatusRebloggedBy != null;
    var includeConversationAccounts = filters?.onlyInConversation != null;
    var includeChatAccounts = filters?.onlyInChat != null;
    var joinQuery = query.join(
      populateAccountJoin(
        includeAccountFollowings: includeAccountFollowings,
        includeAccountFollowers: includeAccountFollowers,
        includeStatusFavouritedAccounts: includeStatusFavouritedAccounts,
        includeStatusRebloggedAccounts: includeStatusRebloggedAccounts,
        includeConversationAccounts: includeConversationAccounts,
        includeChatAccounts: includeChatAccounts,
      ),
    );
    // should be added in filters phase
    // todo: should be reworked

    if (includeAccountFollowings) {
      joinQuery = addFollowingsWhere(
        joinQuery,
        filters?.onlyInAccountFollowing?.remoteId,
      );
    }
    if (includeAccountFollowers) {
      joinQuery = addFollowersWhere(
        joinQuery,
        filters?.onlyInAccountFollowers?.remoteId,
      );
    }
    if (includeStatusFavouritedAccounts) {
      joinQuery = addStatusFavouritedByWhere(
        joinQuery,
        filters?.onlyInStatusFavouritedBy?.remoteId,
      );
    }
    if (includeStatusRebloggedAccounts) {
      joinQuery = addStatusRebloggedByWhere(
        joinQuery,
        filters?.onlyInStatusRebloggedBy?.remoteId,
      );
    }
    if (includeConversationAccounts) {
      joinQuery = addConversationWhere(
        joinQuery,
        filters?.onlyInConversation?.remoteId,
      );
    }
    if (includeChatAccounts) {
      joinQuery = addChatWhere(
        joinQuery,
        filters?.onlyInChat?.remoteId,
      );
    }

    return joinQuery;
  }

  @override
  DbAccountPopulated mapTypedResultToDbPopulatedItem(TypedResult typedResult) =>
      typedResult.toDbAccountPopulated(dao: this);
}

extension DbAccountTypedResultExtension on TypedResult {
  DbAccount toDbAccount({
    required AccountDao dao,
  }) =>
      readTable(dao.db.dbAccounts);

  DbAccountPopulated toDbAccountPopulated({
    required AccountDao dao,
  }) =>
      DbAccountPopulated(
        dbAccount: toDbAccount(
          dao: dao,
        ),
      );
}

extension DbAccountTypedResultListExtension on List<TypedResult> {
  List<DbAccount> toDbAccountList({
    required AccountDao dao,
  }) =>
      map(
        (item) => item.toDbAccount(dao: dao),
      ).toList();
}

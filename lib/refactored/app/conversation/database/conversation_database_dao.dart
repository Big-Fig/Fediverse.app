import 'package:fedi/refactored/app/conversation/database/conversation_database_model.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'conversation_database_dao.g.dart';

var _accountAliasId = "account";
var _conversationAccountsAliasId = "conversationAccounts";

@UseDao(tables: [
  DbConversations
], queries: {
  "countAll": "SELECT Count(*) FROM db_conversations;",
  "findById": "SELECT * FROM db_conversations WHERE id = :id;",
  "findByRemoteId":
      "SELECT * FROM db_conversations WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_conversations WHERE id = :id;",
  "deleteById": "DELETE FROM db_conversations WHERE id = :id;",
  "clear": "DELETE FROM db_conversations",
  "getAll": "SELECT * FROM db_conversations",
  "findLocalIdByRemoteId": "SELECT id FROM db_conversations WHERE remote_id = "
      ":remoteId;",
})
class ConversationDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationDaoMixin {
  final AppDatabase db;
  $DbAccountsTable accountAlias;
  $DbConversationAccountsTable conversationAccountsAlias;

  // Called by the AppDatabase class
  ConversationDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    conversationAccountsAlias =
        alias(db.dbConversationAccounts, _conversationAccountsAliasId);
  }

  Future<int> insert(Insertable<DbConversation> entity) async =>
      into(db.dbConversations).insert(entity);

  Future<int> upsert(Insertable<DbConversation> entity) async =>
      into(db.dbConversations).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(Iterable<Insertable<DbConversation>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbConversations, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbConversation> entity) async =>
      await update(db.dbConversations).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbConversation> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbConversations)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbConversationsTable, DbConversation>
      startSelectQuery() => (select(db.dbConversations));

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbConversationsTable, DbConversation>
      addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbConversationsTable, DbConversation> query, {
    @required String minimumRemoteIdExcluding,
    @required String maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool, BoolType>(
          "db_conversations.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((conversation) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool, BoolType>(
          "db_conversations.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((conversation) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbConversationsTable, DbConversation> orderBy(
          SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
          List<ConversationOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case ConversationOrderByType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyMediaWhere(
      SimpleSelectStatement<$DbStatusesTable, DbStatus> query) =>
      query
        ..where((status) =>
        isNotNull(status.mediaAttachments) |
        status.mediaAttachments.equals(""));
}

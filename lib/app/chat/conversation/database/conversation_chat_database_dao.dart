import 'package:fedi/app/chat/conversation/database/conversation_chat_database_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_database_dao.g.dart';

var _accountAliasId = "account";
var _conversationAccountsAliasId = "conversationAccounts";

@UseDao(
  tables: [
    DbConversations,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_conversations;",
    "findById": "SELECT * FROM db_conversations WHERE id = :id;",
    "oldest": "SELECT * FROM db_conversations ORDER BY updated_at ASC LIMIT 1;",
    "findByRemoteId":
        "SELECT * FROM db_conversations WHERE remote_id LIKE :remoteId;",
    "countById": "SELECT COUNT(*) FROM db_conversations WHERE id = :id;",
    "deleteById": "DELETE FROM db_conversations WHERE id = :id;",
    "deleteByRemoteId":
        "DELETE FROM db_conversations WHERE remote_id = :remoteId;",
    "clear": "DELETE FROM db_conversations",
    "getAll": "SELECT * FROM db_conversations",
    "findLocalIdByRemoteId":
        "SELECT id FROM db_conversations WHERE remote_id = "
            ":remoteId;",
  },
)
class ConversationDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationDaoMixin {
  final AppDatabase db;
  $DbAccountsTable? accountAlias;
  $DbConversationAccountsTable? conversationAccountsAlias;

  // Called by the AppDatabase class
  ConversationDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    conversationAccountsAlias =
        alias(db.dbConversationAccounts, _conversationAccountsAliasId);
  }

  Future<int> insert(
    Insertable<DbConversation> entity, {
    InsertMode? mode,
  }) async =>
      into(db.dbConversations).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbConversation> entity) async =>
      into(db.dbConversations).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
    List<Insertable<DbConversation>> entities,
    InsertMode mode,
  ) async =>
      await batch((batch) {
        batch.insertAll(db.dbConversations, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbConversation> entity) async =>
      await update(db.dbConversations).replace(entity);

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbConversation> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

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
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_conversations.remote_id > '$minimumRemoteIdExcluding'",
      );
      query = query..where((conversation) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_conversations.remote_id < '$maximumRemoteIdExcluding'",
      );
      query = query..where((conversation) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbConversationsTable, DbConversation> orderBy(
    SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    List<ConversationChatOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case ConversationChatOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                    case ConversationChatOrderType.updatedAt:
                      expression = item.updatedAt;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyMediaWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where((status) =>
            status.mediaAttachments.isNotNull() |
            status.mediaAttachments.equals(""));

  Future<int> getTotalAmountUnread() => totalAmountUnreadQuery().getSingle();

  Stream<int> watchTotalAmountUnread() =>
      totalAmountUnreadQuery().watchSingle();

  Selectable<int> totalAmountUnreadQuery() {
    return customSelect(
      'SELECT COUNT(*) FROM db_conversations WHERE unread=1;',
      readsFrom: {dbConversations},
    ).map((QueryRow row) => row.readInt('COUNT(*)'));
  }
}

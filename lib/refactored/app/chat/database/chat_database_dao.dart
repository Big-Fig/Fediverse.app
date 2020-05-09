import 'package:fedi/refactored/app/chat/database/chat_database_model.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'chat_database_dao.g.dart';

var _accountAliasId = "account";
var _chatAccountsAliasId = "chatAccounts";

@UseDao(tables: [
  DbChats
], queries: {
  "countAll": "SELECT Count(*) FROM db_chats;",
  "findById": "SELECT * FROM db_chats WHERE id = :id;",
  "findByRemoteId": "SELECT * FROM db_chats WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_chats WHERE id = :id;",
  "deleteById": "DELETE FROM db_chats WHERE id = :id;",
  "clear": "DELETE FROM db_chats",
  "getAll": "SELECT * FROM db_chats",
  "findLocalIdByRemoteId": "SELECT id FROM db_chats WHERE remote_id = "
      ":remoteId;",
})
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  @override
  final AppDatabase db;
  $DbAccountsTable accountAlias;
  $DbChatAccountsTable chatAccountsAlias;

  // Called by the AppDatabase class
  ChatDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    chatAccountsAlias = alias(db.dbChatAccounts, _chatAccountsAliasId);
  }

  Future<int> insert(Insertable<DbChat> entity, {InsertMode mode}) async =>
      into(db.dbChats).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbChat> entity) async =>
      into(db.dbChats).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          Iterable<Insertable<DbChat>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbChats, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbChat> entity) async =>
      await update(db.dbChats).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbChat> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbChats)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> startSelectQuery() =>
      (select(db.dbChats));

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbChatsTable, DbChat> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbChatsTable, DbChat> query, {
    @required String minimumRemoteIdExcluding,
    @required String maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool, BoolType>(
          "db_chats.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((chat) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool, BoolType>(
          "db_chats.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((chat) => smallerExp);
    }

    return query;
  }

  Future<int> incrementUnreadCount() {
    var query = db.customUpdate("UPDATE db_chats "
        "SET unread = unread + 1");

    return query;
  }

  Future<int> getTotalAmountUnread() {
    var query = db.customSelectQuery("SELECT SUM(db_chats.unread) "
        "as unread_total FROM db_chats");

    return query
        .map((queryRow) => queryRow.readInt("unread_total"))
        .getSingle();
  }

  Stream<int> watchTotalAmountUnread() {
    // todo: remove hack
    // it is not possible to use custom sql query from getTotalAmountUnread
    // unfortunately moor don't support watch for custom queries with sum only
    var query = db.select(dbChats)
      ..where((chat) => chat.unread.isBiggerThanValue(0));

    var unreadChatsStream = query.watch();

    return unreadChatsStream.map((unreadChats) {
      return unreadChats.fold(0, (previous, chat) => chat.unread);
    });
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> orderBy(
          SimpleSelectStatement<$DbChatsTable, DbChat> query,
          List<ChatOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case ChatOrderByType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());
}

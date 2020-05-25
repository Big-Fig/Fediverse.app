import 'package:fedi/app/chat/database/chat_database_model.dart';
import 'package:fedi/app/chat/repository/chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'chat_database_dao.g.dart';

var _accountAliasId = "account";
var _chatAccountsAliasId = "chatAccounts";

@UseDao(tables: [DbChats],
    queries: {
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

  Future insertAll(Iterable<Insertable<DbChat>> entities,
      InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbChats, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbChat> entity) async =>
      await update(db.dbChats).replace(entity);

  Future<int> updateByRemoteId(String remoteId,
      Insertable<DbChat> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbChats)
        ..where((i) => i.id.equals(localId))).write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> startSelectQuery() =>
      (select(db.dbChats));

  SimpleSelectStatement<$DbChatsTable, DbChat> addUpdatedAtBoundsWhere(
      SimpleSelectStatement<$DbChatsTable, DbChat> query,
      {@required DateTime minimumDateTimeExcluding, @required DateTime maximumDateTimeExcluding,}) {
    var minimumExist = minimumDateTimeExcluding != null;
    var maximumExist = maximumDateTimeExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      query = query
        ..where((chat) =>
            chat.updatedAt.isBiggerThanValue(minimumDateTimeExcluding));
    }
    if (maximumExist) {
      query = query
        ..where((chat) =>
            chat.updatedAt.isSmallerThanValue(maximumDateTimeExcluding));
    }

    return query;
  }

  Future<int> incrementUnreadCount(
      {@required String chatRemoteId, @required DateTime updatedAt}) {
    var update = "UPDATE db_chats "
        "SET unread = unread + 1, updated_at = ${updatedAt.millisecondsSinceEpoch} "
        "WHERE remote_id = '$chatRemoteId'";
    var query = db.customUpdate(update, updates: {dbChats});

    return query;
  }

  Future<int> getTotalAmountUnread() => totalAmountUnreadQuery().getSingle();

  Stream<int> watchTotalAmountUnread() =>
      totalAmountUnreadQuery().watchSingle();

  Selectable<int> totalAmountUnreadQuery() {
    var unreadCount = dbChats.unread.total();

    final query = selectOnly(dbChats)
      ..addColumns([unreadCount]);

    var mapped = query.map((row) => row.read(unreadCount));
    return mapped.map((value) => value.toInt());
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> orderBy(
      SimpleSelectStatement<$DbChatsTable, DbChat> query,
      List<ChatOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms.map((orderTerm) =>
            (item) {
          var expression;
          switch (orderTerm.orderByType) {
            case ChatOrderByType.remoteId:
              expression = item.remoteId;
              break;
            case ChatOrderByType.updatedAt:
              expression = item.updatedAt;
              break;
          }
          return OrderingTerm(
              expression: expression, mode: orderTerm.orderingMode);
        }).toList());
}

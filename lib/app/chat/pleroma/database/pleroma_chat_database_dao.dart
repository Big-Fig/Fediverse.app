import 'package:fedi/app/chat/pleroma/database/pleroma_chat_database_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'pleroma_chat_database_dao.g.dart';

var _accountAliasId = "account";
var _chatAccountsAliasId = "chatAccounts";
var _chatMessageAliasId = "chatMessage";
var _chatMessageAccountAliasId = "chatMessageAccount";

@UseDao(
  tables: [
    DbChats,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_chats;",
    "countById": "SELECT COUNT(*) FROM db_chats WHERE id = :id;",
    "deleteById": "DELETE FROM db_chats WHERE id = :id;",
    "oldest": "SELECT * FROM db_chats ORDER BY updated_at ASC LIMIT 1;",
    "clear": "DELETE FROM db_chats",
    "getAll": "SELECT * FROM db_chats",
    "findLocalIdByRemoteId": "SELECT id FROM db_chats WHERE remote_id = "
        ":remoteId;",
  },
)
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  final AppDatabase db;
  late $DbAccountsTable accountAlias;
  late $DbChatMessagesTable chatMessageAlias;
  late $DbAccountsTable chatMessageAccountAlias;
  late $DbChatAccountsTable chatAccountsAlias;

  // Called by the AppDatabase class
  ChatDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    chatAccountsAlias = alias(db.dbChatAccounts, _chatAccountsAliasId);
    chatMessageAlias = alias(db.dbChatMessages, _chatMessageAliasId);
    chatMessageAccountAlias = alias(
      db.dbAccounts,
      _chatMessageAccountAliasId,
    );
  }

  Future<List<DbPleromaChatPopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAll();

    return (await chatMessageQuery.get())
        .toDbPleromaChatPopulatedList(dao: this);
  }

  Stream<List<DbPleromaChatPopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAll();

    return chatMessageQuery.watch().map(
          (list) => list.toDbPleromaChatPopulatedList(
            dao: this,
          ),
        );
  }

  Future<DbPleromaChatPopulated?> findById(int id) async =>
      (await _findById(id).getSingleOrNull())?.toDbPleromaChatPopulated(
        dao: this,
      );

  Future<DbPleromaChatPopulated?> findByRemoteId(String remoteId) async =>
      (await _findByRemoteId(remoteId).getSingleOrNull())
          ?.toDbPleromaChatPopulated(
        dao: this,
      );

  Stream<DbPleromaChatPopulated?> watchById(int id) =>
      _findById(id).watchSingleOrNull().map(
            (value) => value?.toDbPleromaChatPopulated(
              dao: this,
            ),
          );

  Stream<DbPleromaChatPopulated?> watchByRemoteId(String? remoteId) =>
      _findByRemoteId(remoteId).watchSingleOrNull().map(
            (value) => value?.toDbPleromaChatPopulated(
              dao: this,
            ),
          );

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbChats).join(
      populateChatJoin(),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbChats)..where((chatMessage) => chatMessage.id.equals(id)))
          .join(populateChatJoin());

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String? remoteId) =>
      (select(db.dbChats)
            ..where((chatMessage) => chatMessage.remoteId.like(remoteId!)))
          .join(populateChatJoin());

  Future<int> insert(Insertable<DbChat> entity, {InsertMode? mode}) async =>
      into(db.dbChats).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbChat> entity) async =>
      into(db.dbChats).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(List<Insertable<DbChat>> entities, InsertMode mode) async =>
      await batch(
        (batch) {
          batch.insertAll(
            db.dbChats,
            entities,
            mode: mode,
          );
        },
      );

  Future<bool> replace(Insertable<DbChat> entity) async =>
      await update(db.dbChats).replace(entity);

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbChat> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingleOrNull();

    if (localId != null && localId >= 0) {
      await (update(db.dbChats)
            ..where(
              (i) => i.id.equals(localId),
            ))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> startSelectQuery() =>
      (select(db.dbChats));

  SimpleSelectStatement<$DbChatsTable, DbChat> addUpdatedAtBoundsWhere(
    SimpleSelectStatement<$DbChatsTable, DbChat> query, {
    required DateTime? minimumDateTimeExcluding,
    required DateTime? maximumDateTimeExcluding,
  }) {
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

  Future<int> incrementUnreadCount({
    required String? chatRemoteId,
    required DateTime updatedAt,
  }) {
    var update = "UPDATE db_chats "
        "SET unread = unread + 1,"
        " updated_at = ${updatedAt.millisecondsSinceEpoch ~/ 1000} "
        "WHERE remote_id = '$chatRemoteId'";
    var query = db.customUpdate(update, updates: {
      dbChats,
    });

    return query;
  }

  Future<int> getTotalAmountUnread() => totalAmountUnreadQuery().getSingle();

  Stream<int> watchTotalAmountUnread() =>
      totalAmountUnreadQuery().watchSingle();

  Selectable<int> totalAmountUnreadQuery() {
    var unreadCount = dbChats.unread.total();

    final query = selectOnly(dbChats)..addColumns([unreadCount]);

    var mapped = query.map((row) => row.read(unreadCount));
    return mapped.map((value) => value!.toInt());
  }

  SimpleSelectStatement<$DbChatsTable, DbChat> orderBy(
    SimpleSelectStatement<$DbChatsTable, DbChat> query,
    List<PleromaChatOrderingTermData> orderTerms,
  ) {
    // ignore: curly_braces_in_flow_control_structures
    return query
        ..orderBy(
          orderTerms
              .map(
                (orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case PleromaChatOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                    case PleromaChatOrderType.updatedAt:
                      expression = item.updatedAt;
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
  }

  List<Join<Table, DataClass>> populateChatJoin() {
    return [
      leftOuterJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(dbChats.accountRemoteId),
      ),
    ];
  }

  List<Join<Table, DataClass>> chatLastMessageJoin() {
    return [
      leftOuterJoin(
        chatMessageAlias,
        chatMessageAlias.chatRemoteId.equalsExp(dbChats.remoteId),
      ),
      leftOuterJoin(
        chatMessageAccountAlias,
        chatMessageAccountAlias.remoteId
            .equalsExp(chatMessageAlias.accountRemoteId),
      ),
    ];
  }
}

extension DbPleromaChatPopulatedTypedResultListExtension on List<TypedResult> {
  List<DbPleromaChatPopulated> toDbPleromaChatPopulatedList({
    required ChatDao dao,
  }) {
    return map(
      (item) => item.toDbPleromaChatPopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension DbPleromaChatPopulatedTypedResultExtension on TypedResult {
  DbPleromaChatPopulated toDbPleromaChatPopulated({
    required ChatDao dao,
  }) {
    return DbPleromaChatPopulated(
      dbChat: readTable(dao.db.dbChats),
      dbAccount: readTable(dao.accountAlias),
    );
  }
}

extension DbPleromaChatWithLastMessagePopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbPleromaChatWithLastMessagePopulated>
      toDbPleromaChatWithLastMessagePopulatedList({
    required ChatDao dao,
  }) {
    return map(
      (item) => item.toDbPleromaChatWithLastMessagePopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension DbPleromaChatWithLastMessagePopulatedTypedResultExtension
    on TypedResult {
  DbPleromaChatWithLastMessagePopulated
      toDbPleromaChatWithLastMessagePopulated({
    required ChatDao dao,
  }) {
    var dbChatMessage = readTableOrNull(dao.chatMessageAlias);
    var dbChatMessageAccount = readTableOrNull(dao.chatMessageAccountAlias);

    DbChatMessagePopulated? dbChatMessagePopulated;

    if (dbChatMessage != null && dbChatMessageAccount != null) {
      dbChatMessagePopulated = DbChatMessagePopulated(
        dbChatMessage: dbChatMessage,
        dbAccount: dbChatMessageAccount,
      );
    }

    return DbPleromaChatWithLastMessagePopulated(
      dbPleromaChatPopulated: toDbPleromaChatPopulated(dao: dao),
      dbChatMessagePopulated: dbChatMessagePopulated,
    );
  }
}

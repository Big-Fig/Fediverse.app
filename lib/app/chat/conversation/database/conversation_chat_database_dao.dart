import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_database_dao.g.dart';

var _accountAliasId = "account";
var _conversationAccountsAliasId = "conversationAccount";
var _conversationStatusesAliasId = "conversationStatus";
var _statusAliasId = "status";
var _statusAccountAliasId = "statusAccount";
var _statusReblogAliasId = "statusReblog";
var _statusReblogAccountAliasId = "statusReblogAccount";
var _statusReplyAliasId = "statusReply";
var _statusReplyAccountAliasId = "statusReplyAccount";
var _statusReplyReblogAliasId = "statusReplyReblog";
var _statusReplyReblogAccountAliasId = "statusReplyReblogAccount";

@UseDao(
  tables: [
    DbConversations,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_conversations;",
    "oldest": "SELECT * FROM db_conversations ORDER BY updated_at ASC LIMIT 1;",
    "countById": "SELECT COUNT(*) FROM db_conversations WHERE id = :id;",
    "deleteById": "DELETE FROM db_conversations WHERE id = :id;",
    "deleteByRemoteId":
        "DELETE FROM db_conversations WHERE remote_id = :remoteId;",
    "clear": "DELETE FROM db_conversations",
    "findLocalIdByRemoteId":
        "SELECT id FROM db_conversations WHERE remote_id = "
            ":remoteId;",
  },
)
class ConversationDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationDaoMixin {
  final AppDatabase db;
  late $DbAccountsTable accountAlias;
  late $DbConversationAccountsTable conversationAccountsAlias;
  late $DbConversationStatusesTable conversationStatusesAlias;

  late $DbStatusesTable statusAlias;
  late $DbAccountsTable statusAccountAlias;

  late $DbStatusesTable statusReblogAlias;
  late $DbAccountsTable statusReblogAccountAlias;
  late $DbStatusesTable statusReplyAlias;
  late $DbAccountsTable statusReplyAccountAlias;
  late $DbStatusesTable statusReplyReblogAlias;
  late $DbAccountsTable statusReplyReblogAccountAlias;

  // Called by the AppDatabase class
  ConversationDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
    conversationAccountsAlias =
        alias(db.dbConversationAccounts, _conversationAccountsAliasId);
    conversationStatusesAlias =
        alias(db.dbConversationStatuses, _conversationStatusesAliasId);

    statusAlias = alias(db.dbStatuses, _statusAliasId);
    statusAccountAlias = alias(db.dbAccounts, _statusAccountAliasId);

    statusReblogAlias = alias(db.dbStatuses, _statusReblogAliasId);
    statusReblogAccountAlias =
        alias(db.dbAccounts, _statusReblogAccountAliasId);
    statusReplyAlias = alias(db.dbStatuses, _statusReplyAliasId);
    statusReplyAccountAlias = alias(db.dbAccounts, _statusReplyAccountAliasId);
    statusReplyReblogAlias = alias(db.dbStatuses, _statusReplyReblogAliasId);
    statusReplyReblogAccountAlias =
        alias(db.dbAccounts, _statusReplyReblogAccountAliasId);
  }

  Future<List<DbConversationPopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAll();

    List<TypedResult> typedResultList = (await chatMessageQuery.get());
    return typedResultList.toDbConversationChatPopulatedList(dao: this);
  }

  Stream<List<DbConversationPopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAll();

    return chatMessageQuery.watch().map(
          (list) => list.toDbConversationChatPopulatedList(
            dao: this,
          ),
        );
  }

  Future<DbConversationPopulated?> findById(int id) async =>
      (await _findById(id).getSingleOrNull())?.toDbConversationPopulated(
        dao: this,
      );

  Future<DbConversationPopulated?> findByRemoteId(String remoteId) async =>
      (await _findByRemoteId(remoteId).getSingleOrNull())
          ?.toDbConversationPopulated(
        dao: this,
      );

  Stream<DbConversationPopulated?> watchById(int id) =>
      _findById(id).watchSingleOrNull().map(
            (value) => value?.toDbConversationPopulated(
              dao: this,
            ),
          );

  Stream<DbConversationPopulated?> watchByRemoteId(String remoteId) =>
      _findByRemoteId(remoteId).watchSingleOrNull().map(
            (value) => value?.toDbConversationPopulated(
              dao: this,
            ),
          );

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbConversations).join(
      populateChatJoin(),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbConversations)
            ..where((chatMessage) => chatMessage.id.equals(id)))
          .join(populateChatJoin());

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String? remoteId) =>
      (select(db.dbConversations)
            ..where((chatMessage) => chatMessage.remoteId.like(remoteId!)))
          .join(populateChatJoin());

  Future<int> insert(Insertable<DbConversation> entity,
          {InsertMode? mode}) async =>
      into(db.dbConversations).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbConversation> entity) async =>
      into(db.dbConversations).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          List<Insertable<DbConversation>> entities, InsertMode mode) async =>
      await batch(
        (batch) {
          batch.insertAll(
            db.dbConversations,
            entities,
            mode: mode,
          );
        },
      );

  Future<bool> replace(Insertable<DbConversation> entity) async =>
      await update(db.dbConversations).replace(entity);

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbConversation> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingleOrNull();

    if (localId != null && localId >= 0) {
      await (update(db.dbConversations)
            ..where(
              (i) => i.id.equals(localId),
            ))
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
        ..orderBy(
          orderTerms
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
              .toList(),
        );

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

  List<Join<Table, DataClass>> populateChatJoin() {
    return [
      // todo: accounts join
      // leftOuterJoin(
      //   accountAlias,
      //   accountAlias.remoteId.equalsExp(dbConversations.accountRemoteId),
      // ),
    ];
  }

  List<Join<Table, DataClass>> conversationLastMessageJoin() {
    return [
      // leftOuterJoin(
      //   chatMessageAlias,
      //   chatMessageAlias.chatRemoteId.equalsExp(dbChats.remoteId),
      // ),
      leftOuterJoin(
        conversationStatusesAlias,
        conversationStatusesAlias.conversationRemoteId
            .equalsExp(dbConversations.remoteId),
      ),
      leftOuterJoin(
        statusAlias,
        statusAlias.remoteId
            .equalsExp(conversationStatusesAlias.statusRemoteId),
      ),
      innerJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(statusAlias.accountRemoteId),
      ),
      leftOuterJoin(
        statusReblogAlias,
        statusReblogAlias.remoteId.equalsExp(statusAlias.reblogStatusRemoteId),
      ),
      leftOuterJoin(
        statusReblogAccountAlias,
        statusReblogAccountAlias.remoteId
            .equalsExp(statusReblogAlias.accountRemoteId),
      ),
      leftOuterJoin(
        statusReplyAlias,
        statusReplyAlias.remoteId.equalsExp(statusAlias.inReplyToRemoteId),
      ),
      leftOuterJoin(
        statusReplyAccountAlias,
        statusReplyAccountAlias.remoteId
            .equalsExp(statusReplyAlias.accountRemoteId),
      ),
      leftOuterJoin(
        statusReplyReblogAlias,
        statusReplyReblogAlias.remoteId
            .equalsExp(statusReplyAlias.reblogStatusRemoteId),
      ),
      leftOuterJoin(
        statusReplyReblogAccountAlias,
        statusReplyReblogAccountAlias.remoteId
            .equalsExp(statusReplyReblogAlias.accountRemoteId),
      ),
    ];
  }
}

extension DbConversationChatPopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbConversationPopulated> toDbConversationChatPopulatedList({
    required ConversationDao dao,
  }) {
    return map(
      (item) => item.toDbConversationPopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension DbConversationChatPopulatedTypedResultExtension on TypedResult {
  DbConversationPopulated toDbConversationPopulated({
    required ConversationDao dao,
  }) {
    return DbConversationPopulated(
      dbConversation: readTable(dao.dbConversations),
    );
  }
}

extension DbConversationChatWithLastMessagePopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbConversationChatWithLastMessagePopulated>
      toDbConversationChatWithLastMessagePopulatedList({
    required ConversationDao dao,
  }) {
    return map(
      (item) => item.toDbConversationChatWithLastMessagePopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension DbConversationChatWithLastMessagePopulatedTypedResultExtension
    on TypedResult {
  DbConversationChatWithLastMessagePopulated
      toDbConversationChatWithLastMessagePopulated({
    required ConversationDao dao,
  }) {
    TypedResult typedResult = this;
    var dbStatus = typedResult.readTableOrNull(dao.statusAlias);
    var dbStatusAccount = typedResult.readTableOrNull(dao.statusAccountAlias);
    DbStatusPopulated? dbStatusPopulated;

    if (dbStatus != null && dbStatusAccount != null) {
      dbStatusPopulated = DbStatusPopulated(
        dbStatus: dbStatus,
        dbAccount: dbStatusAccount,
        reblogDbStatus: typedResult.readTableOrNull(dao.statusReblogAlias),
        reblogDbStatusAccount:
            typedResult.readTableOrNull(dao.statusReblogAccountAlias),
        replyDbStatus: typedResult.readTableOrNull(dao.statusReplyAlias),
        replyDbStatusAccount:
            typedResult.readTableOrNull(dao.statusReplyAccountAlias),
        replyReblogDbStatus:
            typedResult.readTableOrNull(dao.statusReplyReblogAlias),
        replyReblogDbStatusAccount:
            typedResult.readTableOrNull(dao.statusReplyReblogAccountAlias),
      );
    }

    return DbConversationChatWithLastMessagePopulated(
      dbConversationPopulated: toDbConversationPopulated(dao: dao),
      dbStatusPopulated: dbStatusPopulated,
    );
  }
}

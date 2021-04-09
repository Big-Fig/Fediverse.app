import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:moor/moor.dart';

part 'pleroma_chat_message_database_dao.g.dart';

var _accountAliasId = "account";

@UseDao(
  tables: [DbChatMessages],
  queries: {
    "findById": "SELECT * FROM db_chat_messages WHERE id = :id;",
    "findByRemoteId":
    "SELECT * FROM db_chat_messages WHERE remote_id LIKE :remoteId;",
    "getAll": "SELECT * FROM db_chat_messages",
    "countAll": "SELECT Count(*) FROM db_chat_messages;",
    "countById": "SELECT COUNT(*) FROM db_chat_messages WHERE id = :id;",
    "deleteById": "DELETE FROM db_chat_messages WHERE id = :id;",
    "deleteByRemoteId": "DELETE FROM db_chat_messages WHERE remote_id = "
        ":remoteId;",
    "clear": "DELETE FROM db_chat_messages",
    "oldest": "SELECT * FROM db_chat_messages ORDER BY created_at ASC LIMIT 1;",
    "findLocalIdByRemoteId":
        "SELECT id FROM db_chat_messages WHERE remote_id = "
            ":remoteId;",
    "deleteOlderThanDate":
        "DELETE FROM db_chat_messages WHERE created_at < :createdAt",
    "deleteOlderThanLocalId": "DELETE FROM db_chat_messages WHERE id = "
        ":localId;",
    "getNewestByLocalIdWithOffset":
        "SELECT * FROM db_chat_messages ORDER BY id DESC LIMIT 1 OFFSET :offset",
  },
)
class ChatMessageDao extends PopulatedAppRemoteDatabaseDao<
    DbChatMessage,
    DbChatMessagePopulated,
    int,
    String,
    $DbChatMessagesTable,
    $DbChatMessagesTable> with _$ChatMessageDaoMixin {
  final AppDatabase db;
  late $DbAccountsTable accountAlias;

  // Called by the AppDatabase class
  ChatMessageDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
  }

  Future<List<DbChatMessagePopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAllQuery();

    var typedResults = await chatMessageQuery.get();
    return typedResults.toDbChatMessagePopulatedList(
      dao: this,
    );
  }

  Stream<List<DbChatMessagePopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> chatMessageQuery = _findAllQuery();

    return chatMessageQuery.watch().map(
          (typedResults) => typedResults.toDbChatMessagePopulatedList(
            dao: this,
          ),
        );
  }

  Future<DbChatMessagePopulated?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async {
    var typedResult = await _findByOldPendingRemoteIdQuery(oldPendingRemoteId)
        .getSingleOrNull();
    return typedResult?.toDbChatMessagePopulated(
      dao: this,
    );
  }

  Stream<DbChatMessagePopulated?> watchByOldPendingRemoteId(
    String? oldPendingRemoteId,
  ) =>
      _findByOldPendingRemoteIdQuery(oldPendingRemoteId)
          .watchSingleOrNull()
          .map((typedResult) {
        return typedResult?.toDbChatMessagePopulated(
          dao: this,
        );
      });

  JoinedSelectStatement<Table, DataClass> _findAllQuery() {
    var sqlQuery = (select(db.dbChatMessages).join(
      populateChatMessageJoin(),
    ));
    return sqlQuery;
  }

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage>
      addOnlyPendingStatePublishedOrNull(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
  ) =>
          query
            ..where(
              (chatMessage) =>
                  chatMessage.pendingState.isNull() |
                  chatMessage.pendingState.equals(
                    PendingState.published.toJsonValue(),
                  ),
            );

  JoinedSelectStatement<Table, DataClass> _findByOldPendingRemoteIdQuery(
    String? oldPendingRemoteId,
  ) =>
      (select(db.dbChatMessages)
            ..where(
              (chatMessage) => chatMessage.oldPendingRemoteId.like(
                oldPendingRemoteId!,
              ),
            ))
          .join(
        populateChatMessageJoin(),
      );

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbChatMessage> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingleOrNull();

    if (localId != null && localId >= 0) {
      await (update(db.dbChatMessages)
            ..where(
              (i) => i.id.equals(localId),
            ))
          .write(entity);
    } else {
      localId = await insert(
        entity: entity,
        mode: null,
      );
    }

    return localId;
  }

  JoinedSelectStatement addChatWhere(
    JoinedSelectStatement query,
    String chatRemoteId,
  ) =>
      query
        ..where(
          CustomExpression<bool>(
            "db_chat_messages.chat_remote_id = '$chatRemoteId'",
          ),
        );

  JoinedSelectStatement addChatsWhere(
    JoinedSelectStatement query,
    List<String> chatRemoteIds,
  ) =>
      query
        ..where(CustomExpression<bool>("db_chat_messages.chat_remote_id IN ("
            "${chatRemoteIds.join(", ")})"));

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage>
      addOnlyNotDeletedWhere(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
  ) =>
          query
            ..where(
              (chatMessage) =>
                  chatMessage.deleted.isNull() |
                  chatMessage.deleted.equals(
                    false,
                  ),
            );

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage>
      addOnlyNotHiddenLocallyOnDevice(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
  ) =>
          query
            ..where(
              (chatMessage) =>
                  chatMessage.hiddenLocallyOnDevice.isNull() |
                  chatMessage.hiddenLocallyOnDevice.equals(
                    false,
                  ),
            );

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage>
      addCreatedAtBoundsWhere(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query, {
    required DateTime? minimumDateTimeExcluding,
    required DateTime? maximumDateTimeExcluding,
  }) {
    var minimumExist = minimumDateTimeExcluding != null;
    var maximumExist = maximumDateTimeExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      query = query
        ..where(
          (chatMessage) =>
              chatMessage.createdAt.isBiggerThanValue(minimumDateTimeExcluding),
        );
    }
    if (maximumExist) {
      query = query
        ..where(
          (chatMessage) => chatMessage.createdAt
              .isSmallerThanValue(maximumDateTimeExcluding),
        );
    }

    return query;
  }

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> orderBy(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    List<PleromaChatMessageRepositoryOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map(
              (orderTerm) => (item) {
                var expression;
                switch (orderTerm.orderType) {
                  case PleromaChatMessageOrderType.remoteId:
                    expression = item.remoteId;
                    break;
                  case PleromaChatMessageOrderType.createdAt:
                    expression = item.createdAt;
                    break;
                }
                return OrderingTerm(
                  expression: expression,
                  mode: orderTerm.orderingMode,
                );
              },
            )
            .toList());

  List<Join<Table, DataClass>> populateChatMessageJoin() {
    return [
      leftOuterJoin(
        accountAlias,
        accountAlias.remoteId.equalsExp(dbChatMessages.accountRemoteId),
      ),
    ];
  }

  void addGroupByChatId(JoinedSelectStatement<Table, DataClass> query) {
    query.groupBy(
      [dbChatMessages.chatRemoteId],
      having: CustomExpression("MAX(db_chat_messages.created_at)"),
    );
  }

  Future markAsDeleted({required String? remoteId}) {
    var update = "UPDATE db_chat_messages "
        "SET deleted = 1 "
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbChatMessages});

    return query;
  }

  Future markAsHiddenLocallyOnDevice({required int? localId}) {
    var update = "UPDATE db_chat_messages "
        "SET hidden_locally_on_device = 1 "
        "WHERE id = '$localId'";
    var query = db.customUpdate(update, updates: {dbChatMessages});

    return query;
  }

  @override
  $DbChatMessagesTable get table => dbChatMessages;
}

extension ListTypedResultDbChatMessagePopulatedExtension on List<TypedResult> {
  List<DbChatMessagePopulated> toDbChatMessagePopulatedList({
    required ChatMessageDao dao,
  }) {
    return map(
      (typedResult) => typedResult.toDbChatMessagePopulated(
        dao: dao,
      ),
    ).toList();
  }
}

extension TypedResultDbChatMessagePopulatedExtension on TypedResult {
  DbChatMessagePopulated toDbChatMessagePopulated({
    required ChatMessageDao dao,
  }) {
    return DbChatMessagePopulated(
      dbChatMessage: readTable(dao.db.dbChatMessages),
      dbAccount: readTable(dao.accountAlias),
    );
  }
}

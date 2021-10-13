import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'pleroma_chat_message_database_dao.g.dart';

var _accountAliasId = 'account';

@UseDao(
  tables: [DbChatMessages],
)
class ChatMessageDao extends PopulatedAppRemoteDatabaseDao<
    DbChatMessage,
    DbChatMessagePopulated,
    int,
    String,
    $DbChatMessagesTable,
    $DbChatMessagesTable,
    PleromaChatMessageRepositoryFilters,
    PleromaChatMessageRepositoryOrderingTermData> with _$ChatMessageDaoMixin {
  final AppDatabase db;

  // ignore: avoid-late-keyword
  late $DbAccountsTable accountAlias;

  // Called by the AppDatabase class
  ChatMessageDao(this.db) : super(db) {
    accountAlias = alias(db.dbAccounts, _accountAliasId);
  }

  Future<List<DbChatMessagePopulated>> findAll() async {
    var chatMessageQuery = _findAllQuery();

    var typedResults = await chatMessageQuery.get();

    return typedResults.toDbChatMessagePopulatedList(
      dao: this,
    );
  }

  Stream<List<DbChatMessagePopulated>> watchAll() {
    var chatMessageQuery = _findAllQuery();

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
          .map(
            (typedResult) => typedResult?.toDbChatMessagePopulated(
              dao: this,
            ),
          );

  JoinedSelectStatement _findAllQuery() {
    var sqlQuery = select(db.dbChatMessages).join(
      populateChatMessageJoin(),
    );

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

  JoinedSelectStatement _findByOldPendingRemoteIdQuery(
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

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> addChatWhere(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    String chatRemoteId,
  ) =>
      query
        ..where(
          (_) => CustomExpression<bool>(
            "db_chat_messages.chat_remote_id = '$chatRemoteId'",
          ),
        );

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> addChatsWhere(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    List<String> chatRemoteIds,
  ) =>
      query
        ..where(
          (_) => CustomExpression<bool>(
            'db_chat_messages.chat_remote_id IN ('
            "${chatRemoteIds.join(", ")})",
          ),
        );

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

  SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> orderBy(
    SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    List<PleromaChatMessageRepositoryOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(
          orderTerms
              .map(
                (orderTerm) => ($DbChatMessagesTable item) {
                  GeneratedColumn<Object?> expression;
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
              .toList(),
        );

  List<Join> populateChatMessageJoin() => [
        leftOuterJoin(
          accountAlias,
          accountAlias.remoteId.equalsExp(dbChatMessages.accountRemoteId),
        ),
      ];

  void addGroupByChatId(JoinedSelectStatement query) {
    query.groupBy(
      [dbChatMessages.chatRemoteId],
      having: CustomExpression('MAX(db_chat_messages.created_at)'),
    );
  }

  Future markAsDeleted({
    required String remoteId,
    // required Batch? batchTransaction,
  }) async {
    // todo: support batch
    // if (batchTransaction != null) {
    //   batchTransaction.customStatement(sql)
    // } else {
    //   await db.batch((batch) {
    //     markAsDeleted(
    //       remoteId: remoteId,
    //       batchTransaction: batch,
    //     );
    //   });
    // }

    var update = 'UPDATE db_chat_messages '
        'SET deleted = 1 '
        "WHERE remote_id = '$remoteId'";
    var query = db.customUpdate(update, updates: {dbChatMessages});

    return query;
  }

  Future markAsHiddenLocallyOnDevice({
    required int? localId,
    // required Batch? batchTransaction,
  }) {
    // todo: support batch
    var update = 'UPDATE db_chat_messages '
        'SET hidden_locally_on_device = 1 '
        "WHERE id = '$localId'";
    var query = db.customUpdate(update, updates: {dbChatMessages});

    return query;
  }

  @override
  $DbChatMessagesTable get table => dbChatMessages;

  Future deleteOlderThanDate(
    DateTime dateTimeToDelete, {
    required Batch? batchTransaction,
  }) =>
      deleteOlderThanDateTime(
        dateTimeToDelete,
        fieldName: table.createdAt.$name,
        batchTransaction: batchTransaction,
      );

  @override
  DbChatMessagePopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbChatMessagePopulated(dao: this);

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    required PleromaChatMessageRepositoryFilters? filters,
  }) {
    if (filters?.onlyPendingStatePublishedOrNull == true) {
      addOnlyPendingStatePublishedOrNull(query);
    }

    if (filters?.onlyNotDeleted == true) {
      addOnlyNotDeletedWhere(query);
    }

    if (filters?.onlyNotHiddenLocallyOnDevice == true) {
      addOnlyNotHiddenLocallyOnDevice(query);
    }

    var onlyInChats = filters?.onlyInChats;
    if (onlyInChats != null) {
      if (onlyInChats.length == 1) {
        addChatWhere(
          query,
          onlyInChats.first.remoteId,
        );
      } else {
        addChatsWhere(
          query,
          onlyInChats
              .map(
                (chat) => chat.remoteId,
              )
              .toList(),
        );
      }
    }
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    required RepositoryPagination<DbChatMessage>? pagination,
    required List<PleromaChatMessageRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == PleromaChatMessageOrderType.createdAt,
      );
      addDateTimeBoundsWhere(
        query,
        column: dbChatMessages.createdAt,
        maximumDateTimeExcluding: pagination?.olderThanItem?.createdAt,
        minimumDateTimeExcluding: pagination?.newerThanItem?.createdAt,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    required List<PleromaChatMessageRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbChatMessagesTable, DbChatMessage> query,
    required PleromaChatMessageRepositoryFilters? filters,
  }) {
    var joinedSelectStatement = query.join(populateChatMessageJoin());

    if (filters?.groupByChatId == true) {
      addGroupByChatId(joinedSelectStatement);
    }

    return joinedSelectStatement;
  }
}

extension ListTypedResultDbChatMessagePopulatedExtension on List<TypedResult> {
  List<DbChatMessagePopulated> toDbChatMessagePopulatedList({
    required ChatMessageDao dao,
  }) =>
      map(
        (typedResult) => typedResult.toDbChatMessagePopulated(
          dao: dao,
        ),
      ).toList();
}

extension TypedResultDbChatMessagePopulatedExtension on TypedResult {
  DbChatMessagePopulated toDbChatMessagePopulated({
    required ChatMessageDao dao,
  }) =>
      DbChatMessagePopulated(
        dbChatMessage: readTable(dao.db.dbChatMessages),
        dbAccount: readTable(dao.accountAlias),
      );
}

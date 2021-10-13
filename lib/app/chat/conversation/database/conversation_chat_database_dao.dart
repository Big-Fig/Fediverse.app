import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_database_dao.g.dart';

var _accountAliasId = 'account';
var _conversationAccountsAliasId = 'conversationAccount';
var _conversationStatusesAliasId = 'conversationStatus';
var _statusAliasId = 'status';
var _statusAccountAliasId = 'statusAccount';
var _statusReblogAliasId = 'statusReblog';
var _statusReblogAccountAliasId = 'statusReblogAccount';
var _statusReplyAliasId = 'statusReply';
var _statusReplyAccountAliasId = 'statusReplyAccount';
var _statusReplyReblogAliasId = 'statusReplyReblog';
var _statusReplyReblogAccountAliasId = 'statusReplyReblogAccount';

@UseDao(
  tables: [
    DbConversations,
  ],
)
class ConversationDao extends PopulatedAppRemoteDatabaseDao<
    DbConversation,
    DbConversationPopulated,
    int,
    String,
    $DbConversationsTable,
    $DbConversationsTable,
    ConversationChatRepositoryFilters,
    ConversationRepositoryChatOrderingTermData> with _$ConversationDaoMixin {
  final AppDatabase db;
  // ignore: avoid-late-keyword
  late $DbAccountsTable accountAlias;
  // ignore: avoid-late-keyword
  late $DbConversationAccountsTable conversationAccountsAlias;
  // ignore: avoid-late-keyword
  late $DbConversationStatusesTable conversationStatusesAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable statusAlias;
  // ignore: avoid-late-keyword
  late $DbAccountsTable statusAccountAlias;

  // ignore: avoid-late-keyword
  late $DbStatusesTable statusReblogAlias;
  // ignore: avoid-late-keyword
  late $DbAccountsTable statusReblogAccountAlias;
  // ignore: avoid-late-keyword
  late $DbStatusesTable statusReplyAlias;
  // ignore: avoid-late-keyword
  late $DbAccountsTable statusReplyAccountAlias;
  // ignore: avoid-late-keyword
  late $DbStatusesTable statusReplyReblogAlias;
  // ignore: avoid-late-keyword
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

  SimpleSelectStatement<$DbConversationsTable, DbConversation> orderBy(
    SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    List<ConversationRepositoryChatOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(
          orderTerms
              .map(
                (orderTerm) => ($DbConversationsTable item) {
                  GeneratedColumn<Object?> expression;
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
                },
              )
              .toList(),
        );

  SimpleSelectStatement<$DbStatusesTable, DbStatus> addOnlyMediaWhere(
    SimpleSelectStatement<$DbStatusesTable, DbStatus> query,
  ) =>
      query
        ..where(
          (status) =>
              status.mediaAttachments.isNotNull() |
              status.mediaAttachments.equals(''),
        );

  Future<int> getTotalAmountUnread() => totalAmountUnreadQuery().getSingle();

  Stream<int> watchTotalAmountUnread() =>
      totalAmountUnreadQuery().watchSingle();

  Selectable<int> totalAmountUnreadQuery() => customSelect(
        'SELECT COUNT(*) FROM db_conversations WHERE unread=1;',
        readsFrom: {dbConversations},
      ).map((QueryRow row) => row.read<int>('COUNT(*)'));

  List<Join<Table, DataClass>> populateChatJoin() => [
        // todo: accounts join
      ];

  List<Join> conversationLastMessageJoin() => [
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
          statusAccountAlias,
          statusAccountAlias.remoteId.equalsExp(statusAlias.accountRemoteId),
        ),
        leftOuterJoin(
          statusReblogAlias,
          statusReblogAlias.remoteId
              .equalsExp(statusAlias.reblogStatusRemoteId),
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

  @override
  $DbConversationsTable get table => dbConversations;

  @override
  // ignore: no-empty-block
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required ConversationChatRepositoryFilters? filters,
    // ignore: no-empty-block
  }) {
    // nothing by now
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required RepositoryPagination<DbConversation>? pagination,
    required List<ConversationRepositoryChatOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(orderingTermData.orderType == ConversationChatOrderType.updatedAt);
      addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required List<ConversationRepositoryChatOrderingTermData>? orderingTerms,
  }) {
    orderBy(query, orderingTerms ?? []);
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required ConversationChatRepositoryFilters? filters,
  }) {
    var withLastMessage = filters?.withLastMessage == true;
    var joinQuery = query.join([
      ...populateChatJoin(),
      if (withLastMessage) ...conversationLastMessageJoin(),
    ]);

    if (withLastMessage) {
      // todo: rework with moor-like code
      var fieldName = statusAlias.createdAt.$name;
      var aliasName = statusAlias.aliasedName;
      var having = CustomExpression<bool>('MAX($aliasName.$fieldName)');
      joinQuery.groupBy(
        [
          dbConversations.remoteId,
        ],
        having: having,
      );
    }

    return joinQuery;
  }

  @override
  DbConversationPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbConversationPopulated(dao: this);
}

extension DbConversationChatPopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbConversationPopulated> toDbConversationChatPopulatedList({
    required ConversationDao dao,
  }) =>
      map(
        (item) => item.toDbConversationPopulated(
          dao: dao,
        ),
      ).toList();
}

extension DbConversationChatPopulatedTypedResultExtension on TypedResult {
  DbConversationPopulated toDbConversationPopulated({
    required ConversationDao dao,
  }) =>
      DbConversationPopulated(
        dbConversation: readTable(dao.dbConversations),
      );
}

extension DbConversationChatWithLastMessagePopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbConversationChatWithLastMessagePopulated>
      toDbConversationChatWithLastMessagePopulatedList({
    required ConversationDao dao,
  }) =>
          map(
            (item) => item.toDbConversationChatWithLastMessagePopulated(
              dao: dao,
            ),
          ).toList();
}

extension DbConversationChatWithLastMessagePopulatedTypedResultExtension
    on TypedResult {
  DbConversationChatWithLastMessagePopulated
      toDbConversationChatWithLastMessagePopulated({
    required ConversationDao dao,
  }) {
    var typedResult = this;
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

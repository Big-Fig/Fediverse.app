import 'package:fedi/app/chat/unifedi/database/unifedi_chat_database_model.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'unifedi_chat_database_dao.g.dart';

var _accountAliasId = 'account';
var _chatAccountsAliasId = 'chatAccounts';
var _chatMessageAliasId = 'chatMessage';
var _chatMessageAccountAliasId = 'chatMessageAccount';

final _logger = Logger('unifedi_chat_database_dao.dart');

@UseDao(
  tables: [
    DbChats,
  ],
)
class ChatDao extends PopulatedAppRemoteDatabaseDao<
    DbChat,
    DbUnifediChatPopulated,
    int,
    String,
    $DbChatsTable,
    $DbChatsTable,
    UnifediChatRepositoryFilters,
    UnifediChatRepositoryOrderingTermData> with _$ChatDaoMixin {
  final AppDatabase db;

  // ignore: avoid-late-keyword
  late $DbAccountsTable accountAlias;

  // ignore: avoid-late-keyword
  late $DbChatMessagesTable chatMessageAlias;

  // ignore: avoid-late-keyword
  late $DbAccountsTable chatMessageAccountAlias;

  // ignore: avoid-late-keyword
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

  void addUpdatedAtBoundsWhere(
    SimpleSelectStatement<$DbChatsTable, DbChat> query, {
    required DateTime? minimumDateTimeExcluding,
    required DateTime? maximumDateTimeExcluding,
  }) {
    var minimumExist = minimumDateTimeExcluding != null;
    var maximumExist = maximumDateTimeExcluding != null;
    assert(minimumExist || maximumExist, 'min or max should exist');

    if (minimumExist) {
      query.where(
        (chat) => chat.updatedAt.isBiggerThanValue(minimumDateTimeExcluding),
      );
    }
    if (maximumExist) {
      query.where(
        (chat) => chat.updatedAt.isSmallerThanValue(maximumDateTimeExcluding),
      );
    }
  }

  Future<int> incrementUnreadCount({
    required String chatRemoteId,
    required DateTime updatedAt,
  }) {
    var update = 'UPDATE db_chats '
        'SET unread = unread + 1,'
        " updated_at = '${updatedAt.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond}' "
        "WHERE remote_id = '$chatRemoteId'";

    _logger.finest(() => 'incrementUnreadCount $update');
    var query = db.customUpdate(
      update,
      updates: {
        dbChats,
      },
    );

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

  void orderBy(
    SimpleSelectStatement<$DbChatsTable, DbChat> query,
    List<UnifediChatRepositoryOrderingTermData> orderTerms,
  ) =>
      query.orderBy(
        orderTerms
            .map(
              (orderTerm) => ($DbChatsTable item) {
                GeneratedColumn<Object?> expression;
                switch (orderTerm.orderType) {
                  case UnifediChatOrderType.remoteId:
                    expression = item.remoteId;
                    break;
                  case UnifediChatOrderType.updatedAt:
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

  List<Join> populateChatJoin() => [
        leftOuterJoin(
          accountAlias,
          accountAlias.remoteId.equalsExp(dbChats.accountRemoteId),
        ),
      ];

  List<Join> chatLastMessageJoin() => [
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

  @override
  $DbChatsTable get table => dbChats;

  @override
  // ignore: no-empty-block
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbChatsTable, DbChat> query,
    required UnifediChatRepositoryFilters? filters,
    // ignore: no-empty-block
  }) {
    // nothing
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbChatsTable, DbChat> query,
    required RepositoryPagination<DbChat>? pagination,
    required List<UnifediChatRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
        orderingTerms?.length == 1,
        'only single order term is supported',
      );
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == UnifediChatOrderType.updatedAt,
        'only updatedAt term supported',
      );
      addDateTimeBoundsWhere(
        query,
        column: dbChats.updatedAt,
        maximumDateTimeExcluding: pagination?.olderThanItem?.updatedAt,
        minimumDateTimeExcluding: pagination?.newerThanItem?.updatedAt,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbChatsTable, DbChat> query,
    required List<UnifediChatRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(query, orderingTerms ?? []);
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbChatsTable, DbChat> query,
    required UnifediChatRepositoryFilters? filters,
  }) {
    var join = query.join([
      ...populateChatJoin(),
      if (filters?.withLastMessage == true) ...chatLastMessageJoin(),
    ]);
    if (filters?.withLastMessage == true) {
      // todo: rework with moor-like code
      var fieldName = chatMessageAlias.createdAt.$name;
      var aliasName = chatMessageAlias.aliasedName;
      var having = CustomExpression<bool>('MAX($aliasName.$fieldName)');
      join.groupBy(
        [
          dbChats.remoteId,
        ],
        having: having,
      );
    }

    return join;
  }

  @override
  DbUnifediChatPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbUnifediChatPopulated(dao: this);
}

extension DbUnifediChatPopulatedTypedResultListExtension on List<TypedResult> {
  List<DbUnifediChatPopulated> toDbUnifediChatPopulatedList({
    required ChatDao dao,
  }) =>
      map(
        (item) => item.toDbUnifediChatPopulated(
          dao: dao,
        ),
      ).toList();
}

extension DbUnifediChatPopulatedTypedResultExtension on TypedResult {
  DbUnifediChatPopulated toDbUnifediChatPopulated({
    required ChatDao dao,
  }) =>
      DbUnifediChatPopulated(
        dbChat: readTable(dao.db.dbChats),
        dbAccount: readTable(dao.accountAlias),
      );
}

extension DbUnifediChatWithLastMessagePopulatedTypedListExtension
    on List<TypedResult> {
  List<DbUnifediChatWithLastMessagePopulated>
      toDbUnifediChatWithLastMessagePopulatedList({
    required ChatDao dao,
  }) =>
          map(
            (item) => item.toDbUnifediChatWithLastMessagePopulated(
              dao: dao,
            ),
          ).toList();
}

extension DbUnifediChatWithLastMessagePopulatedTypedExtension on TypedResult {
  DbUnifediChatWithLastMessagePopulated
      toDbUnifediChatWithLastMessagePopulated({
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

    return DbUnifediChatWithLastMessagePopulated(
      dbUnifediChatPopulated: toDbUnifediChatPopulated(dao: dao),
      dbChatMessagePopulated: dbChatMessagePopulated,
    );
  }
}

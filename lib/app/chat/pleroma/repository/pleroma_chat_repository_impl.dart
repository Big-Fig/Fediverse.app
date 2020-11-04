import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("chat_repository_impl.dart");

class ChatRepository extends AsyncInitLoadingBloc implements IChatRepository {
  ChatDao dao;
  ChatAccountsDao chatAccountsDao;

  final IAccountRepository accountRepository;
  final IChatMessageRepository chatMessageRepository;

  ChatRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository,
    @required this.chatMessageRepository,
  }) {
    dao = appDatabase.chatDao;
    chatAccountsDao = appDatabase.chatAccountsDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbChatPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  @override
  Future upsertRemoteChat(IPleromaChat remoteChat) async {
    _logger.finer(() => "upsertRemoteChat $remoteChat");

    var remoteAccounts = [remoteChat.account];

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        chatRemoteId: remoteChat.id, conversationRemoteId: null);

    var lastMessage = remoteChat.lastMessage;
    if (lastMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
    }

    await upsert(mapRemoteChatToDbChat(remoteChat));
  }

  @override
  Future upsertRemoteChats(List<IPleromaChat> remoteChats) async {
    _logger.finer(() => "upsertRemoteChats ${remoteChats.length}");

    for (var remoteChat in remoteChats) {
      var lastMessage = remoteChat.lastMessage;
      if (lastMessage != null) {
        await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
      }

      await accountRepository.upsertRemoteAccounts([remoteChat.account],
          chatRemoteId: remoteChat.id, conversationRemoteId: null);
    }

    await upsertAll(remoteChats.map(mapRemoteChatToDbChat).toList());
  }

  @override
  Future upsertAll(Iterable<DbChat> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbChat> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(items, InsertMode.insertOrRollback);
  }

  @override
  Future clear() => dao.clear();

  @override
  Future<bool> deleteById(int id) async {
    var affectedRows = await dao.deleteById(id);
    assert(affectedRows == 0 || affectedRows == 1);
    return (affectedRows) == 1;
  }

  @override
  Future<DbChatPopulatedWrapper> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbChatPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<DbChatPopulatedWrapper> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbChatPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbChatPopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbChat item) => dao.insert(item);

  @override
  Future<int> upsert(DbChat item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbChat DbChat) {
    if (DbChat.id != id) {
      DbChat = DbChat.copyWith(id: id);
    }
    return dao.replace(DbChat);
  }

  DbChatPopulatedWrapper mapDataClassToItem(DbChatPopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbChatPopulatedWrapper(dataClass);
  }

  Insertable<DbChat> mapItemToDataClass(DbChatPopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbChatPopulated.dbChat;
  }

  @override
  Future updateLocalChatByRemoteChat(
      {@required IChat oldLocalChat,
      @required IPleromaChat newRemoteChat}) async {
    _logger.finer(() => "updateLocalChatByRemoteChat \n"
        "\t old: $oldLocalChat \n"
        "\t newRemoteChat: $newRemoteChat");

    await accountRepository.upsertRemoteAccounts([newRemoteChat.account],
        chatRemoteId: oldLocalChat.remoteId, conversationRemoteId: null);

    var lastMessage = newRemoteChat.lastMessage;
    if (lastMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
    }
    if (oldLocalChat.localId != null) {
      await updateById(
          oldLocalChat.localId, mapRemoteChatToDbChat(newRemoteChat));
    } else {
      await upsertRemoteChat(newRemoteChat);
    }
  }

  @override
  Future<List<DbChatPopulatedWrapper>> getChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThan: olderThan,
        newerThan: newerThan,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbChatPopulatedWrapper>> watchChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData}) {
    var query = createQuery(
      olderThan: olderThan,
      newerThan: newerThan,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbChatPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t olderThan=$olderThan\n"
        "\t newerThan=$newerThan\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThan != null || newerThan != null) {
      assert(orderingTermData?.orderByType == ChatOrderByType.updatedAt);
      dao.addUpdatedAtBoundsWhere(query,
          maximumDateTimeExcluding: olderThan?.updatedAt,
          minimumDateTimeExcluding: newerThan?.updatedAt);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }

    var joinQuery = query.join(
      dao.populateChatJoin(),
    );

    assert(!(limit == null && offset != null));
    if (limit != null) {
      joinQuery.limit(limit, offset: offset);
    }
    return joinQuery;
  }

  @override
  Future<DbChatPopulatedWrapper> getChat(
      {@required IChat onlyInChat,
      @required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbChatPopulatedWrapper> watchChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData}) {
    var query = createQuery(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);

    Stream<DbChatPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbChat) => mapDataClassToItem(dbChat));
  }

  @override
  Future<IChat> findByAccount({@required IAccount account}) async {
    // todo: rework with one query
    var dbChatAccount = await chatAccountsDao
        .findByAccountRemoteId(account.remoteId)
        .getSingle();

    if (dbChatAccount != null) {
      return DbChatPopulatedWrapper(
          await dao.findByRemoteId(dbChatAccount.chatRemoteId));
    } else {
      return null;
    }
  }

  @override
  Future markAsRead({@required IChat chat}) {
    return updateById(
        chat.localId,
        DbChat(
            id: chat.localId,
            remoteId: chat.remoteId,
            unread: 0,
            updatedAt: DateTime.now(),
            accountRemoteId: chat.accounts.first.remoteId));
  }

  @override
  Future<int> getTotalUnreadCount() => dao.getTotalAmountUnread();

  @override
  Stream<int> watchTotalUnreadCount() => dao.watchTotalAmountUnread();

  @override
  Future incrementUnreadCount(
          {@required String chatRemoteId, @required DateTime updatedAt}) =>
      dao.incrementUnreadCount(
          chatRemoteId: chatRemoteId, updatedAt: updatedAt);
}

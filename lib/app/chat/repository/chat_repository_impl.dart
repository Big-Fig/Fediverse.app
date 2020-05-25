import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_model_adapter.dart';
import 'package:fedi/app/chat/database/chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/database/chat_database_dao.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository_model.dart';
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
  Future<DbChatWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteIdQuery(remoteId).getSingle());

  @override
  Stream<DbChatWrapper> watchByRemoteId(String remoteId) =>
      dao.findByRemoteIdQuery(remoteId).watchSingle().map(mapDataClassToItem);

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
  Future<DbChatWrapper> findById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbChatWrapper> watchById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbChatWrapper>> getAll() =>
      dao.getAllQuery().map(mapDataClassToItem).get();

  @override
  Future<int> countAll() => dao.countAllQuery().getSingle();

  @override
  Stream<List<DbChatWrapper>> watchAll() =>
      dao.getAllQuery().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbChat item) => dao.insert(item);

  @override
  Future<int> upsert(DbChat item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbChat dbChat) {
    if (dbChat.id != id) {
      dbChat = dbChat.copyWith(id: id);
    }
    return dao.replace(dbChat);
  }

  DbChatWrapper mapDataClassToItem(DbChat dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbChatWrapper(dataClass);
  }

  Insertable<DbChat> mapItemToDataClass(DbChatWrapper item) => item.dbChat;

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
  Future<List<DbChatWrapper>> getChats(
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

    var dbChats = await query.get();
    return dbChats.map((dbChat) => mapDataClassToItem(dbChat)).toList();
  }

  @override
  Stream<List<DbChatWrapper>> watchChats(
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

    Stream<List<DbChat>> stream = query.watch();
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  SimpleSelectStatement createQuery(
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

    assert(!(limit == null && offset != null));
    if (limit != null) {
      query.limit(limit, offset: offset);
    }
    return query;
  }

  @override
  Future<DbChatWrapper> getChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData}) async {
    var chats = await getChats(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return chats?.first;
  }

  @override
  Stream<DbChatWrapper> watchChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData}) {
    var chatsStream = watchChats(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return chatsStream.map((chats) => chats?.first);
  }

  @override
  Future<IChat> findByAccount({@required IAccount account}) async {
    // todo: rework with one query
    var dbChatAccount = await chatAccountsDao
        .findByAccountRemoteIdQuery(account.remoteId)
        .getSingle();

    if (dbChatAccount != null) {
      return DbChatWrapper(await dao
          .findByRemoteIdQuery(dbChatAccount.chatRemoteId)
          .getSingle());
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
            updatedAt: DateTime.now()));
  }

  @override
  Future<int> getTotalUnreadCount() => dao.getTotalAmountUnread();

  @override
  Stream<int> watchTotalUnreadCount() => dao.watchTotalAmountUnread();

  @override
  Future incrementUnreadCount({@required String chatRemoteId, @required DateTime updatedAt}) =>
      dao.incrementUnreadCount(chatRemoteId: chatRemoteId, updatedAt: updatedAt);
}

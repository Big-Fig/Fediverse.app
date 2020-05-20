import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_model_adapter.dart';
import 'package:fedi/app/chat/message/database/chat_message_database_dao.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("chat_message_repository_impl.dart");

class ChatMessageRepository extends AsyncInitLoadingBloc
    implements IChatMessageRepository {
  ChatMessageDao dao;
  IAccountRepository accountRepository;

  ChatMessageRepository(
      {@required AppDatabase appDatabase, @required this.accountRepository}) {
    dao = appDatabase.chatMessageDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteChatMessage(IPleromaChatMessage remoteChatMessage) async {
    _logger.finer(() => "upsertRemoteChatMessage $remoteChatMessage");
//    var remoteAccount = remoteChatMessage.account;
//
//    await accountRepository.upsertRemoteAccount(remoteAccount,
//        chatRemoteId: chatRemoteId);
//
    await upsert(mapRemoteChatMessageToDbChatMessage(remoteChatMessage));
  }

  @override
  Future upsertRemoteChatMessages(
      List<IPleromaChatMessage> remoteChatMessages) async {
    _logger
        .finer(() => "upsertRemoteChatMessages ${remoteChatMessages.length}");
    if (remoteChatMessages.isEmpty) {
      return;
    }

//
//    List<IPleromaAccount> remoteAccounts = remoteChatMessages
//        .map((remoteChatMessage) => remoteChatMessage.account)
//        .toList();
//
//    await accountRepository.upsertRemoteAccounts(remoteAccounts,
//        chatRemoteId: chatRemoteId);

    await upsertAll(
        remoteChatMessages.map(mapRemoteChatMessageToDbChatMessage).toList());
  }

  @override
  Future<DbChatMessagePopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  @override
  Future<List<DbChatMessagePopulatedWrapper>> getChatMessages(
      {@required IChat onlyInChat,
      @required IChatMessage olderThanChatMessage,
      @required IChatMessage newerThanChatMessage,
      @required int limit,
      @required int offset,
      @required ChatMessageOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThanChatMessage: olderThanChatMessage,
        newerThanChatMessage: newerThanChatMessage,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData,
        onlyInChat: onlyInChat);

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbChatMessagePopulatedWrapper>> watchChatMessages(
      {@required IChat onlyInChat,
      @required IChatMessage olderThanChatMessage,
      @required IChatMessage newerThanChatMessage,
      @required int limit,
      @required int offset,
      @required ChatMessageOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyInChat: onlyInChat,
        olderThanChatMessage: olderThanChatMessage,
        newerThanChatMessage: newerThanChatMessage,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    Stream<List<DbChatMessagePopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery(
      {@required IChat onlyInChat,
      @required IChatMessage olderThanChatMessage,
      @required IChatMessage newerThanChatMessage,
      @required int limit,
      @required int offset,
      @required ChatMessageOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t onlyInChat=$onlyInChat\n"
        "\t olderThanChatMessage=$olderThanChatMessage\n"
        "\t newerThanChatMessage=$newerThanChatMessage\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");


    var query = dao.startSelectQuery();

    if (olderThanChatMessage != null || newerThanChatMessage != null) {
      assert(orderingTermData?.orderByType == ChatMessageOrderByType.createdAt);
      dao.addCreatedAtBoundsWhere(query,
          maximumDateTimeExcluding: olderThanChatMessage?.createdAt,
          minimumDateTimeExcluding: newerThanChatMessage?.createdAt);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var joinQuery = query.join(
      dao.populateChatMessageJoin(),
    );

    var finalQuery = joinQuery;

    if (onlyInChat != null) {
      finalQuery = dao.addChatWhere(finalQuery, onlyInChat.remoteId);
    }

    assert(!(limit == null && offset != null));
    if (limit != null) {
      finalQuery.limit(limit, offset: offset);
    }
    return finalQuery;
  }

  @override
  Future upsertAll(Iterable<DbChatMessage> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbChatMessage> items) async {
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
  Future<IChatMessage> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbChatMessagePopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<IChatMessage> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbChatMessagePopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAllQuery().getSingle();

  @override
  Stream<List<DbChatMessagePopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbChatMessage item) => dao.insert(item);

  @override
  Future<int> upsert(DbChatMessage item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbChatMessage dbChatMessage) {
    if (dbChatMessage.id != id) {
      dbChatMessage = dbChatMessage.copyWith(id: id);
    }
    return dao.replace(dbChatMessage);
  }

  DbChatMessagePopulatedWrapper mapDataClassToItem(
      DbChatMessagePopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbChatMessagePopulatedWrapper(dataClass);
  }

  Insertable<DbChatMessage> mapItemToDataClass(
      DbChatMessagePopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbChatMessagePopulated.dbChatMessage;
  }

  @override
  Future updateLocalChatMessageByRemoteChatMessage(
      {@required IChatMessage oldLocalChatMessage,
      @required IPleromaChatMessage newRemoteChatMessage}) async {
    _logger.finer(() => "updateLocalChatMessageByRemoteChatMessage \n"
        "\t old: $oldLocalChatMessage \n"
        "\t newRemoteChatMessage: $newRemoteChatMessage");

//    var remoteAccount = newRemoteChatMessage.account;
//
//    await accountRepository.upsertRemoteAccount(remoteAccount,
//        chatRemoteId: oldLocalChatMessage.remoteId, conversationRemoteId: null);

    await updateById(oldLocalChatMessage.localId,
        mapRemoteChatMessageToDbChatMessage(newRemoteChatMessage));
  }

  @override
  Future<DbChatMessagePopulatedWrapper> getChatMessage(
      {@required IChat onlyInChat,
      @required IChatMessage olderThanChatMessage,
      @required IChatMessage newerThanChatMessage,
      @required ChatMessageOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThanChatMessage: olderThanChatMessage,
        newerThanChatMessage: newerThanChatMessage,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData,
        onlyInChat: onlyInChat);

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbChatMessagePopulatedWrapper> watchChatMessage(
      {@required IChat onlyInChat,
      @required IChatMessage olderThanChatMessage,
      @required IChatMessage newerThanChatMessage,
      @required ChatMessageOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyInChat: onlyInChat,
        olderThanChatMessage: olderThanChatMessage,
        newerThanChatMessage: newerThanChatMessage,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData);

    Stream<DbChatMessagePopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbChatMessage) => mapDataClassToItem(dbChatMessage));
  }

  @override
  Future<IChatMessage> getChatLastChatMessage({@required IChat chat}) =>
      getChatMessage(
          onlyInChat: chat,
          olderThanChatMessage: null,
          newerThanChatMessage: null,
          orderingTermData: ChatMessageOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: ChatMessageOrderByType.createdAt));

  @override
  Stream<IChatMessage> watchChatLastChatMessage({@required IChat chat}) =>
      watchChatMessage(
          onlyInChat: chat,
          olderThanChatMessage: null,
          newerThanChatMessage: null,
          orderingTermData: ChatMessageOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: ChatMessageOrderByType.createdAt));

}

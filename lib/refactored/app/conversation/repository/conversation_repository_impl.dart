import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model_adapter.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_database_dao.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_repository_impl.dart");

class ConversationRepository extends AsyncInitLoadingBloc
    implements IConversationRepository {
  ConversationDao dao;

  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;

  ConversationRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository,
    @required this.statusRepository,
  }) {
    dao = appDatabase.conversationDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteConversation(
      IPleromaConversation remoteConversation) async {
    _logger.finer(() => "upsertRemoteConversation $remoteConversation");
    var remoteAccounts = remoteConversation.accounts;

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: remoteConversation.id);

    await upsert(mapRemoteConversationToDbConversation(remoteConversation));
  }

  @override
  Future upsertRemoteConversations(
      List<IPleromaConversation> remoteConversations) async {
    _logger
        .finer(() => "upsertRemoteConversations ${remoteConversations.length}");

    for (var remoteConversation in remoteConversations) {
      await statusRepository.upsertRemoteStatus(remoteConversation.lastStatus,
          listRemoteId: null, conversationRemoteId: remoteConversation.id);

      await accountRepository.upsertRemoteAccounts(remoteConversation.accounts,
          conversationRemoteId: remoteConversation.id);
    }

    await upsertAll(remoteConversations
        .map(mapRemoteConversationToDbConversation)
        .toList());
  }

  @override
  Future<DbConversationWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteIdQuery(remoteId).getSingle());

  @override
  Stream<DbConversationWrapper> watchByRemoteId(String remoteId) =>
      dao.findByRemoteIdQuery(remoteId).watchSingle().map(mapDataClassToItem);

  @override
  Future upsertAll(Iterable<DbConversation> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbConversation> items) async {
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
  Future<DbConversationWrapper> findById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbConversationWrapper> watchById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbConversationWrapper>> getAll() =>
      dao.getAllQuery().map(mapDataClassToItem).get();

  @override
  Stream<List<DbConversationWrapper>> watchAll() =>
      dao.getAllQuery().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbConversation item) => dao.insert(item);

  @override
  Future<int> upsert(DbConversation item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbConversation dbConversation) {
    if (dbConversation.id != id) {
      dbConversation = dbConversation.copyWith(id: id);
    }
    return dao.replace(dbConversation);
  }

  DbConversationWrapper mapDataClassToItem(DbConversation dataClass) =>
      DbConversationWrapper(dataClass);

  Insertable<DbConversation> mapItemToDataClass(DbConversationWrapper item) =>
      item.dbConversation;

  @override
  Future updateLocalConversationByRemoteConversation(
      {@required IConversation oldLocalConversation,
      @required IPleromaConversation newRemoteConversation}) async {
    _logger.finer(() => "updateLocalConversationByRemoteConversation \n"
        "\t old: $oldLocalConversation \n"
        "\t newRemoteConversation: $newRemoteConversation");

    var remoteAccounts = newRemoteConversation.accounts;

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: oldLocalConversation.remoteId);

    await updateById(oldLocalConversation.localId,
        mapRemoteConversationToDbConversation(newRemoteConversation));
  }

  @override
  Future<List<DbConversationWrapper>> getConversations(
      {@required IConversation olderThanConversation,
      @required IConversation newerThanConversation,
      @required int limit,
      @required int offset,
      @required ConversationOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThanConversation: olderThanConversation,
        newerThanConversation: newerThanConversation,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    var dbConversations = await query.get();
    return dbConversations
        .map((dbConversation) => mapDataClassToItem(dbConversation))
        .toList();
  }

  @override
  Stream<List<DbConversationWrapper>> watchConversations(
      {@required IConversation olderThanConversation,
      @required IConversation newerThanConversation,
      @required int limit,
      @required int offset,
      @required ConversationOrderingTermData orderingTermData}) {
    var query = createQuery(
      olderThanConversation: olderThanConversation,
      newerThanConversation: newerThanConversation,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbConversation>> stream = query.watch();
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  SimpleSelectStatement createQuery(
      {@required IConversation olderThanConversation,
      @required IConversation newerThanConversation,
      @required int limit,
      @required int offset,
      @required ConversationOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t olderThanConversation=$olderThanConversation\n"
        "\t newerThanConversation=$newerThanConversation\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThanConversation != null || newerThanConversation != null) {
      dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanConversation?.remoteId,
          minimumRemoteIdExcluding: newerThanConversation?.remoteId);
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
  Future<DbConversationWrapper> getConversation(
      {@required IConversation olderThanConversation,
      @required IConversation newerThanConversation,
      @required ConversationOrderingTermData orderingTermData}) async {
    var conversations = await getConversations(
        olderThanConversation: olderThanConversation,
        newerThanConversation: newerThanConversation,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return conversations?.first;
  }

  @override
  Stream<DbConversationWrapper> watchConversation(
      {@required IConversation olderThanConversation,
      @required IConversation newerThanConversation,
      @required ConversationOrderingTermData orderingTermData}) {
    var conversationsStream = watchConversations(
        olderThanConversation: olderThanConversation,
        newerThanConversation: newerThanConversation,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return conversationsStream.map((conversations) => conversations?.first);
  }
}

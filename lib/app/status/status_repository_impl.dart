import 'package:fedi/app/status/status_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

abstract class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
//  final ProfileDao dao;
//  final ConversationsRepository conversationsRepository;
//  final ConversationItemsRepository conversationItemsRepository;
//  final INumberAccountApi remoteAccountApi;
//  final INumberProfileApi remoteProfileApi;
//  final INumberConversationApi remoteConversationApi;
//
//  TimelineRepository({
//    @required this.dao,
//    @required this.remoteAccountApi,
//    @required this.remoteProfileApi,
//    @required this.conversationsRepository,
//    @required this.conversationItemsRepository,
//    @required this.remoteConversationApi,
//  });
//
//  DbProfileWrapper mapDataClassToItem(DbProfile dataClass) =>
//      DbProfileWrapper(dataClass);
//
//  Insertable<DbProfile> mapItemToDataClass(DbProfileWrapper item) =>
//      item.dbStatus;
//
//  @override
//  Future internalAsyncInit() {
//    addDisposable(
//        disposable: remoteProfileApi.subscribeForConversationUpdate(
//            callback: upsertConversationFromPush));
//    return null;
//  }
//
//  @override
//  Future askForUpdateFromRemote() async {
//    _logger.e(() => "askForUpdateFromRemote");
//    var restResponse = (await remoteAccountApi.getProfiles());
//
//    if (restResponse.isSuccess) {
//      var numberProfiles = restResponse.body;
//
//      clear();
//      insertAll(numberProfiles.map(
//          (numberProfile) => DbProfileWrapper(numberProfile.toDbProfile())));
//    } else {
//      _logger.e(() => "askForUpdateFromRemote error ${restResponse.error}");
//    }
//  }
//
//  @override
//  Future clear() => dao.clear();
//
//  @override
//  Future<bool> deleteById(int id) async {
//    var affectedRows = await dao.deleteById(id);
//    assert(affectedRows == 0 || affectedRows == 1);
//    return (affectedRows) == 1;
//  }
//
//  @override
//  Future<IProfile> findById(int id) =>
//      dao.findById(id).map(mapDataClassToItem).getSingle();
//
//  @override
//  Stream<IProfile> watchById(int id) =>
//      dao.findById(id).map(mapDataClassToItem).watchSingle();
//
//  @override
//  Future<bool> isExistWithId(int id) =>
//      dao.countById(id).map((count) => count > 0).getSingle();
//
//  @override
//  Future<List<IProfile>> getAll() => dao.getAll().map(mapDataClassToItem).get();
//
//  @override
//  Stream<List<IProfile>> watchAll() =>
//      dao.getAll().map(mapDataClassToItem).watch();
//
//  @override
//  Future<int> insert(IProfile item) => dao.insert(mapItemToDataClass(item));
//
//  @override
//  Future insertAll(Iterable<DbProfileWrapper> items) =>
//      dao.insertAll(items.map(mapItemToDataClass).toList());
//
//  @override
//  Future<bool> updateById(int id, DbProfileWrapper item) {
//    var dbProfile = item.dbStatus;
//    if (item.localId != id) {
//      dbProfile = dbProfile.copyWith(id: id);
//    }
//    return dao.replace(dbProfile);
//  }
//
//  Future upsertConversationFromPush(
//      NumberConversationWithLatestItem numberConversationWithLatestItem) async {
//
//    var numberConversation = numberConversationWithLatestItem.conversation;
//
//    var localProfile = await dao
//        .findByRemoteId(numberConversation.profileRemoteId)
//        .getSingle();
//
//    int conversationId = await conversationsRepository
//        .insertOrUpdateFromBackend(
//        profileId: localProfile.id, numberConversation: numberConversation);
//
//    if (numberConversationWithLatestItem.latestItem != null) {
//      conversationItemsRepository.insertOrUpdateFromBackend(
//          profileId: localProfile.id,
//          conversationId: conversationId,
//          numberConversationItem: numberConversationWithLatestItem.latestItem);
//    }
//  }
}

import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/repository/unifedi_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger =
    Logger('unifedi_chat_with_last_message_cached_list_bloc_impl.dart');

class UnifediChatWithLastMessageCachedListBloc
    extends IUnifediChatWithLastMessageCachedListBloc {
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediChatRepository chatRepository;
  final IUnifediChatWithLastMessageRepository chatWithLastMessageRepository;

  UnifediChatWithLastMessageCachedListBloc({
    required this.unifediApiChatService,
    required this.chatRepository,
    required this.chatWithLastMessageRepository,
  });

  @override
  IUnifediApiService get unifediApi => unifediApiChatService;

  UnifediChatRepositoryFilters? get filters => null;

  UnifediChatRepositoryOrderingTermData get orderingTermData =>
      UnifediChatRepositoryOrderingTermData.updatedAtDesc;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IUnifediChatWithLastMessage? newerThan,
    required IUnifediChatWithLastMessage? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    List<IUnifediApiChat> remoteChats;

    remoteChats = await unifediApiChatService.getChats(
      pagination: UnifediApiPagination(
        maxId: olderThan?.chat.remoteId,
        minId: newerThan?.chat.remoteId,
        limit: limit,
      ),
    );

    await chatRepository.upsertAllInRemoteType(
      remoteChats,
      batchTransaction: null,
    );
  }

  @override
  Future<List<IUnifediChatWithLastMessage>> loadLocalItems({
    required int? limit,
    required IUnifediChatWithLastMessage? newerThan,
    required IUnifediChatWithLastMessage? olderThan,
  }) async {
    _logger.finest(
      () => 'start loadLocalItems \n'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var chats = await chatWithLastMessageRepository.getChatsWithLastMessage(
      filters: filters,
      pagination: RepositoryPagination(
        olderThanItem: olderThan?.chat,
        newerThanItem: newerThan?.chat,
        limit: limit,
      ),
      orderingTermData: orderingTermData,
    );

    _logger.finer(() => 'finish loadLocalItems chats ${chats.length}');

    return chats;
  }

  @override
  Stream<List<IUnifediChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IUnifediChatWithLastMessage? item,
  ) =>
      chatWithLastMessageRepository.watchChatsWithLastMessage(
        filters: filters,
        pagination: RepositoryPagination(
          newerThanItem: item?.chat,
        ),
        orderingTermData: orderingTermData,
      );
}

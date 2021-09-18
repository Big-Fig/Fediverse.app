import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger('pleroma_chat_with_last_message_cached_list_bloc_impl.dart');

class PleromaChatWithLastMessageCachedListBloc
    extends IPleromaChatWithLastMessageCachedListBloc {
  final IUnifediApiChatService pleromaApiChatService;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatWithLastMessageRepository chatWithLastMessageRepository;

  PleromaChatWithLastMessageCachedListBloc({
    required this.pleromaApiChatService,
    required this.chatRepository,
    required this.chatWithLastMessageRepository,
  });

  @override
  IUnifediApiService get unifediApi => pleromaApiChatService;

  PleromaChatRepositoryFilters? get filters => null;

  PleromaChatRepositoryOrderingTermData get orderingTermData =>
      PleromaChatRepositoryOrderingTermData.updatedAtDesc;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IPleromaChatWithLastMessage? newerThan,
    required IPleromaChatWithLastMessage? olderThan,
  }) async {
    _logger.fine(() => 'start refreshItemsFromRemoteForPage \n'
        '\t newerThan = $newerThan'
        '\t olderThan = $olderThan');

    List<IUnifediApiChat> remoteChats;

    remoteChats = await pleromaApiChatService.getChats(
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
  Future<List<IPleromaChatWithLastMessage>> loadLocalItems({
    required int? limit,
    required IPleromaChatWithLastMessage? newerThan,
    required IPleromaChatWithLastMessage? olderThan,
  }) async {
    _logger.finest(() => 'start loadLocalItems \n'
        '\t newerThan=$newerThan'
        '\t olderThan=$olderThan');

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
  Stream<List<IPleromaChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IPleromaChatWithLastMessage? item,
  ) =>
      chatWithLastMessageRepository.watchChatsWithLastMessage(
        filters: filters,
        pagination: RepositoryPagination(
          newerThanItem: item?.chat,
        ),
        orderingTermData: orderingTermData,
      );
}

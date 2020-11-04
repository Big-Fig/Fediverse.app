import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor_flutter/moor_flutter.dart';

var _logger = Logger("chat_cached_list_bloc_impl.dart");

class ChatWithLastMessageCachedListBloc extends IChatWithLastMessageCachedBloc {
  final IPleromaChatService pleromaChatService;
  final IChatRepository chatRepository;
  final IChatWithLastMessageRepository chatWithLastMessageRepository;

  ChatWithLastMessageCachedListBloc({
    @required this.pleromaChatService,
    @required this.chatRepository,
    @required this.chatWithLastMessageRepository,
  });

  @override
  IPleromaApi get pleromaApi => pleromaChatService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IChatWithLastMessage newerThan,
      @required IChatWithLastMessage olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaChat> remoteChats;

    remoteChats = await pleromaChatService.getChats(
        maxId: olderThan?.chat?.remoteId,
        sinceId: newerThan?.chat?.remoteId,
        limit: limit);

    if (remoteChats != null) {
      await chatRepository.upsertRemoteChats(remoteChats);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "chats is null");
      return false;
    }
  }

  @override
  Future<List<IChatWithLastMessage>> loadLocalItems(
      {@required int limit,
      @required IChatWithLastMessage newerThan,
      @required IChatWithLastMessage olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var chats = await chatWithLastMessageRepository.getChatsWithLastMessage(
        olderThan: olderThan?.chat,
        newerThan: newerThan?.chat,
        limit: limit,
        offset: null,
        orderingTermData: ChatOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatOrderByType.updatedAt));

    _logger.finer(() => "finish loadLocalItems chats ${chats.length}");
    return chats;
  }

  @override
  Stream<List<IChatWithLastMessage>> watchLocalItemsNewerThanItem(
          IChatWithLastMessage item) =>
      chatWithLastMessageRepository.watchChatsWithLastMessage(
          olderThan: null,
          newerThan: item?.chat,
          limit: null,
          offset: null,
          orderingTermData: ChatOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: ChatOrderByType.updatedAt));
}

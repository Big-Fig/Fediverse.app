import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("chat_messages_list_bloc_chat_api_impl.dart");

class ChatMessageListBloc extends DisposableOwner
    implements IChatMessageCachedListBloc {
  final IPleromaChatService pleromaChatService;
  final IChatMessageRepository chatMessageRepository;
  final IChat chat;

  ChatMessageListBloc(
      {@required this.chat,
      @required this.pleromaChatService,
      @required this.chatMessageRepository});

  @override
  IPleromaApi get pleromaApi => pleromaChatService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IChatMessage newerThan,
      @required IChatMessage olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t chat = $chat"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");
    try {
      var remoteMessages = await pleromaChatService.getChatMessages(
          chatId: chat.remoteId,
          maxId: olderThan?.remoteId,
          sinceId: newerThan?.remoteId,
          limit: limit);

      if (remoteMessages != null) {
        await chatMessageRepository.upsertRemoteChatMessages(remoteMessages);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "messages is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  @override
  Future<List<IChatMessage>> loadLocalItems(
      {@required int limit,
      @required IChatMessage newerThan,
      @required IChatMessage olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var messages = await chatMessageRepository.getChatMessages(
        onlyInChat: chat,
        limit: limit,
        offset: null,
        orderingTermData: ChatMessageOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatMessageOrderByType.createdAt),
        olderThanChatMessage: olderThan,
        newerThanChatMessage: newerThan);

    _logger.finer(
        () => "finish loadLocalItems for $chat messages ${messages.length}");
    return messages;
  }

  @override
  Stream<List<IChatMessage>> watchLocalItemsNewerThanItem(IChatMessage item) {
    return chatMessageRepository.watchChatMessages(
        onlyInChat: chat,
        limit: null,
        offset: null,
        orderingTermData: ChatMessageOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatMessageOrderByType.createdAt),
        olderThanChatMessage: null,
        newerThanChatMessage: item);
  }

  static ChatMessageListBloc createFromContext(BuildContext context,
          {@required IChat chat}) =>
      ChatMessageListBloc(
          chat: chat,
          pleromaChatService: IPleromaChatService.of(context, listen: false),
          chatMessageRepository:
              IChatMessageRepository.of(context, listen: false));

  static Widget provideToContext(
    BuildContext context, {
    @required IChat chat,
    @required Widget child,
  }) {
    return DisposableProvider<IChatMessageCachedListBloc>(
      create: (context) =>
          ChatMessageListBloc.createFromContext(context, chat: chat),
      child: child,
    );
  }
}

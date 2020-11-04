import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_message_cached_list_bloc_impl.dart");

class PleromaChatMessageListBloc extends DisposableOwner
    implements IPleromaChatMessageCachedListBloc {
  final IPleromaChatService pleromaChatService;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IPleromaChat chat;

  PleromaChatMessageListBloc(
      {@required this.chat,
      @required this.pleromaChatService,
      @required this.chatMessageRepository});

  @override
  IPleromaApi get pleromaApi => pleromaChatService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IPleromaChatMessage newerThan,
      @required IPleromaChatMessage olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t chat = $chat"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

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
  }

  @override
  Future<List<IPleromaChatMessage>> loadLocalItems(
      {@required int limit,
      @required IPleromaChatMessage newerThan,
      @required IPleromaChatMessage olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var messages = await chatMessageRepository.getChatMessages(
        onlyInChats: [chat],
        limit: limit,
        offset: null,
        orderingTermData: PleromaChatMessageOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatMessageOrderByType.createdAt),
        olderThanChatMessage: olderThan,
        newerThanChatMessage: newerThan);

    _logger.finer(
        () => "finish loadLocalItems for $chat messages ${messages.length}");
    return messages;
  }

  @override
  Stream<List<IPleromaChatMessage>> watchLocalItemsNewerThanItem(IPleromaChatMessage item) {
    return chatMessageRepository.watchChatMessages(
        onlyInChats: [chat],
        limit: null,
        offset: null,
        orderingTermData: PleromaChatMessageOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatMessageOrderByType.createdAt),
        olderThanChatMessage: null,
        newerThanChatMessage: item);
  }

  static PleromaChatMessageListBloc createFromContext(BuildContext context,
          {@required IPleromaChat chat}) =>
      PleromaChatMessageListBloc(
          chat: chat,
          pleromaChatService: IPleromaChatService.of(context, listen: false),
          chatMessageRepository:
              IPleromaChatMessageRepository.of(context, listen: false));

  static Widget provideToContext(
    BuildContext context, {
    @required IPleromaChat chat,
    @required Widget child,
  }) {
    return DisposableProvider<IPleromaChatMessageCachedListBloc>(
      create: (context) =>
          PleromaChatMessageListBloc.createFromContext(context, chat: chat),
      child: child,
    );
  }
}

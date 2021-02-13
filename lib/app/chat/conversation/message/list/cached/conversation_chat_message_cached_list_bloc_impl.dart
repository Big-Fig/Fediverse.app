import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/message/list/cached/conversation_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/status/context_api/conversation_chat_status_list_context_api_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/status/conversation_api/conversation_chat_status_list_conversation_api_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_message_cached_list_bloc_impl.dart");

class ConversationChatMessageCachedListBloc extends DisposableOwner
    implements IConversationChatMessageCachedListBloc {
  final ConversationChatStatusListBloc conversationChatStatusListBloc;
  final IConversationChat chat;
  final IConversationChatMessage lastMessage;

  ConversationChatMessageCachedListBloc({
    @required this.chat,
    @required this.conversationChatStatusListBloc,
    @required this.lastMessage,
  });

  @override
  IPleromaApi get pleromaApi => conversationChatStatusListBloc.pleromaApi;

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    @required int limit,
    @required IConversationChatMessage newerThan,
    @required IConversationChatMessage olderThan,
  }) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t chat = $chat"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    var remoteMessages =
        await conversationChatStatusListBloc.refreshItemsFromRemoteForPage(
      olderThan: olderThan?.status,
      newerThan: newerThan?.status,
      limit: limit,
    );

    if (remoteMessages != null) {
      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "messages is null");
      return false;
    }
  }

  @override
  Future<List<IConversationChatMessage>> loadLocalItems({
    @required int limit,
    @required IConversationChatMessage newerThan,
    @required IConversationChatMessage olderThan,
  }) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var statuses = await conversationChatStatusListBloc.loadLocalItems(
      olderThan: olderThan?.status,
      newerThan: newerThan?.status,
      limit: limit,
    );

    _logger.finer(
        () => "finish loadLocalItems for $chat messages ${statuses.length}");
    return statuses
        ?.map(
          (status) => ConversationChatMessageStatusAdapter(status),
        )
        ?.toList();
  }

  @override
  Stream<List<IConversationChatMessage>> watchLocalItemsNewerThanItem(
    IConversationChatMessage item,
  ) =>
      conversationChatStatusListBloc
          .watchLocalItemsNewerThanItem(item?.status)
          .map(
            (statuses) => statuses
                ?.map(
                  (status) => ConversationChatMessageStatusAdapter(status),
                )
                ?.toList(),
          );

  static ConversationChatMessageCachedListBloc createFromContext(
    BuildContext context, {
    @required IConversationChat conversation,
    @required IConversationChatMessage lastMessage,
  }) {
    var chatStatusListBloc = _createStatusListBloc(
      context: context,
      conversation: conversation,
      lastMessage: lastMessage,
    );
    var chatMessageCachedListBloc = ConversationChatMessageCachedListBloc(
      chat: conversation,
      lastMessage: lastMessage,
      conversationChatStatusListBloc: chatStatusListBloc,
    );
    chatMessageCachedListBloc.addDisposable(disposable: chatStatusListBloc);
    return chatMessageCachedListBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required IConversationChat conversation,
    @required IConversationChatMessage lastMessage,
    @required Widget child,
  }) {
    return DisposableProvider<IConversationChatMessageCachedListBloc>(
      create: (context) =>
          ConversationChatMessageCachedListBloc.createFromContext(
        context,
        conversation: conversation,
        lastMessage: lastMessage,
      ),
      child: child,
    );
  }
}

ConversationChatStatusListBloc _createStatusListBloc({
  @required BuildContext context,
  @required IConversationChat conversation,
  @required IConversationChatMessage lastMessage,
}) {
  var currentInstanceBloc = ICurrentAuthInstanceBloc.of(context, listen: false);

  if (currentInstanceBloc.currentInstance.isPleromaInstance) {
    // pleroma instances support loading by conversation id
    return ConversationChatStatusListConversationApiBloc.createFromContext(
      context,
      conversation: conversation,
    );
  } else {
    // mastodon instances support conversation
    // only by status context
    return ConversationChatStatusListContextApiBloc.createFromContext(
      context,
      conversation: conversation,
      statusToFetchContext: lastMessage?.status,
    );
  }
}

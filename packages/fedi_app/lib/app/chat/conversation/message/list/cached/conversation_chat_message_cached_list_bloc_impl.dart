import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/chat/conversation/message/list/cached/conversation_chat_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/conversation/status/context_api/conversation_chat_status_list_context_api_bloc_impl.dart';
import 'package:fedi_app/app/chat/conversation/status/conversation_api/conversation_chat_status_list_conversation_api_bloc_impl.dart';
import 'package:fedi_app/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('unifedi_chat_message_cached_list_bloc_impl.dart');

class ConversationChatMessageCachedListBloc extends DisposableOwner
    implements IConversationChatMessageCachedListBloc {
  final ConversationChatStatusListBloc conversationChatStatusListBloc;
  final IConversationChat? chat;
  final IConversationChatMessage? lastMessage;

  ConversationChatMessageCachedListBloc({
    required this.chat,
    required this.conversationChatStatusListBloc,
    required this.lastMessage,
  });

  @override
  IUnifediApiService get unifediApi =>
      conversationChatStatusListBloc.unifediApi;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IConversationChatMessage? newerThan,
    required IConversationChatMessage? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t chat = $chat'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    await conversationChatStatusListBloc.refreshItemsFromRemoteForPage(
      olderThan: olderThan?.status,
      newerThan: newerThan?.status,
      limit: limit,
    );
  }

  @override
  Future<List<IConversationChatMessage>> loadLocalItems({
    required int? limit,
    required IConversationChatMessage? newerThan,
    required IConversationChatMessage? olderThan,
  }) async {
    _logger.finest(
      () => 'start loadLocalItems \n'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var statuses = await conversationChatStatusListBloc.loadLocalItems(
      olderThan: olderThan?.status,
      newerThan: newerThan?.status,
      limit: limit,
    );

    _logger.finer(
      () => 'finish loadLocalItems for $chat messages ${statuses.length}',
    );

    return statuses
        .map(
          (status) => status.toConversationChatMessageStatusAdapter(),
        )
        .toList();
  }

  @override
  Stream<List<IConversationChatMessage>> watchLocalItemsNewerThanItem(
    IConversationChatMessage? item,
  ) =>
      conversationChatStatusListBloc
          .watchLocalItemsNewerThanItem(item?.status)
          .map(
            (statuses) => statuses
                .map(
                  (status) => status.toConversationChatMessageStatusAdapter(),
                )
                .toList(),
          );

  static ConversationChatMessageCachedListBloc createFromContext(
    BuildContext context, {
    required IConversationChat? conversation,
    required IConversationChatMessage? lastMessage,
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
    chatStatusListBloc.disposeWith(chatMessageCachedListBloc);

    return chatMessageCachedListBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IConversationChat? conversation,
    required IConversationChatMessage? lastMessage,
    required Widget child,
  }) =>
      DisposableProvider<IConversationChatMessageCachedListBloc>(
        create: (context) =>
            ConversationChatMessageCachedListBloc.createFromContext(
          context,
          conversation: conversation,
          lastMessage: lastMessage,
        ),
        child: child,
      );
}

ConversationChatStatusListBloc _createStatusListBloc({
  required BuildContext context,
  required IConversationChat? conversation,
  required IConversationChatMessage? lastMessage,
}) {
  var currentInstanceBloc = ICurrentAccessBloc.of(context, listen: false);

  if (currentInstanceBloc.currentInstance!.isPleroma) {
    // unifedi instances support loading by conversation id
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

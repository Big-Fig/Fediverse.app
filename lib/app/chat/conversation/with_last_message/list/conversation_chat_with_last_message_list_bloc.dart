import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/conversation_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessageListBloc extends IDisposable {
  static IConversationChatWithLastMessageListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatWithLastMessageListBloc>(
        context,
        listen: listen,
      );

  IConversationChatWithLastMessageCachedListBloc? get cachedListBloc;

  IConversationChatWithLastMessagePaginationBloc? get paginationBloc;

  IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
      IConversationChatWithLastMessage?>? get chatPaginationListBloc;

  ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<IConversationChatWithLastMessage>,
      IConversationChatWithLastMessage?>? get paginationListWithNewItemsBloc;
}

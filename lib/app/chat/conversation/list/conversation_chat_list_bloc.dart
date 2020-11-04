import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/pagination/conversation_chat_pagination_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatListBloc extends IDisposable {
  static IConversationChatListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatListBloc>(context, listen: listen);

  IConversationChatCachedListBloc get conversationListService;

  IConversationChatPaginationBloc get conversationPaginationBloc;

  IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>
      get conversationPaginationListBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IConversationChat>, IConversationChat>
  get conversationPaginationListWithNewItemsBloc;
}

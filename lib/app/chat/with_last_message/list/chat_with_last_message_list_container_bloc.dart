import 'package:fedi/app/chat/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/chat/with_last_message/list/cached/chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/with_last_message/pagination/chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IChatWithLastMessageListContainerBloc extends IDisposable {
  static IChatWithLastMessageListContainerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatWithLastMessageListContainerBloc>(context,
          listen: listen);

  IChatWithLastMessageCachedBloc get chatListBloc;

  IChatWithLastMessagePaginationBloc get chatPaginationBloc;

  IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
      IChatWithLastMessage> get chatPaginationListBloc;

  ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<IChatWithLastMessage>,
      IChatWithLastMessage> get chatPaginationListWithNewItemsBloc;
}

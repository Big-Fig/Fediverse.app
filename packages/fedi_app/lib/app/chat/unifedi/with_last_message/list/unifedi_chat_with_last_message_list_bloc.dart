import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/unifedi_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatWithLastMessageListBloc extends IDisposable {
  static IUnifediChatWithLastMessageListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatWithLastMessageListBloc>(
        context,
        listen: listen,
      );

  IUnifediChatWithLastMessageCachedListBloc get chatListBloc;

  IUnifediChatWithLastMessagePaginationBloc get chatPaginationBloc;

  IPaginationListBloc<PaginationPage<IUnifediChatWithLastMessage>,
      IUnifediChatWithLastMessage> get chatPaginationListBloc;

  IUnifediChatWithLastMessagePaginationListWithNewItemsBloc<
          CachedPaginationPage<IUnifediChatWithLastMessage>>
      get chatPaginationListWithNewItemsBloc;
}

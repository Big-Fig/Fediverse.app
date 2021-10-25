import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IUnifediChatWithLastMessage>>
    extends ICachedPaginationListWithNewItemsBloc<TPage,
        IUnifediChatWithLastMessage> {
  static IUnifediChatWithLastMessagePaginationListWithNewItemsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatWithLastMessagePaginationListWithNewItemsBloc>(
        context,
        listen: listen,
      );
}

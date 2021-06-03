import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChatWithLastMessage>>
    extends ICachedPaginationListWithNewItemsBloc<TPage,
        IPleromaChatWithLastMessage> {
  static IPleromaChatWithLastMessagePaginationListWithNewItemsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatWithLastMessagePaginationListWithNewItemsBloc>(
        context,
        listen: listen,
      );
}

import 'package:fedi/app/chat/chat_body_wrapper_widget.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_widget.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/pleroma_chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/pleroma_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatWidget extends StatelessWidget {
  const PleromaChatWidget();

  @override
  Widget build(BuildContext context) {
    var chatBloc = IPleromaChatBloc.of(context, listen: true);
    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: chatBloc,
      loadingFinishedBuilder: (context) {
        return PleromaChatMessageCachedListBloc.provideToContext(
          context,
          chat: chatBloc.chat,
          child: PleromaChatMessageCachedPaginationBloc.provideToContext(
            context,
            child: PleromaChatMessageCachedPaginationListWithNewItemsBloc
                .provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: const ChatBodyWrapperWidget(
                child: ChatMessageListWidget<IPleromaChatMessage>(
                  itemBuilder: _itemBuilder,
                  itemContextBuilder: _itemContextBuilder,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _itemBuilder(BuildContext context) =>
    const ChatMessageListItemWidget<IPleromaChatMessage>();

Widget _itemContextBuilder(
  BuildContext context, {
  required Widget child,
}) {
  return DisposableProxyProvider<IPleromaChatMessage, IPleromaChatMessageBloc>(
    update: (context, chatMessage, previous) {
      if (previous != null && previous.remoteId == chatMessage.remoteId) {
        return previous;
      } else {
        return PleromaChatMessageBloc.createFromContext(
          context,
          chatMessage,
        );
      }
    },
    child: ProxyProvider<IPleromaChatMessageBloc, IChatMessageBloc>(
      update: (context, value, _) => value,
      child: child,
    ),
  );
}

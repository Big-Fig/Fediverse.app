import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/chat_body_wrapper_widget.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_widget.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/chat/unifedi/message/list/cached/unifedi_chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/message/pagination/cached/unifedi_chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/message/pagination/cached/unifedi_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_bloc.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UnifediChatWidget extends StatelessWidget {
  const UnifediChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IUnifediChatBloc.of(context, listen: true);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: chatBloc,
      loadingFinishedBuilder: (context) =>
          UnifediChatMessageCachedListBloc.provideToContext(
        context,
        chat: chatBloc.chat,
        child: UnifediChatMessageCachedPaginationBloc.provideToContext(
          context,
          child: UnifediChatMessageCachedPaginationListWithNewItemsBloc
              .provideToContext(
            context,
            mergeNewItemsImmediately: true,
            child: const ChatBodyWrapperWidget(
              child: ChatMessageListWidget<IUnifediChatMessage>(
                itemBuilder: _itemBuilder,
                itemContextBuilder: _itemContextBuilder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: avoid-returning-widgets
Widget _itemBuilder(BuildContext context) =>
    const ChatMessageListItemWidget<IUnifediChatMessage>();

// ignore: avoid-returning-widgets
Widget _itemContextBuilder(
  BuildContext context, {
  required Widget child,
}) =>
    DisposableProxyProvider<IUnifediChatMessage, IUnifediChatMessageBloc>(
      update: (context, chatMessage, previous) {
        if (previous != null && previous.remoteId == chatMessage.remoteId) {
          return previous;
        } else {
          return UnifediChatMessageBloc.createFromContext(
            context,
            chatMessage,
          );
        }
      },
      child: ProxyProvider<IUnifediChatMessageBloc, IChatMessageBloc>(
        update: (context, value, _) => value,
        child: child,
      ),
    );

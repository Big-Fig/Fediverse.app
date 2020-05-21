import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/chat/message/pagination/cached/chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/message/pagination/list/chat_message_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/post/chat_post_message_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: true);
    return AsyncInitLoadingWidget(
        asyncInitLoadingBloc: chatBloc,
        loadingFinishedBuilder: (context) {
          return DisposableProvider<IChatMessageCachedListBloc>(
              create: (context) => ChatMessageListBloc.createFromContext(
                  context,
                  chat: chatBloc.chat),
              child: DisposableProvider<
                  IPaginationBloc<PaginationPage<IChatMessage>, IChatMessage>>(
                create: (context) =>
                    ChatMessageCachedPaginationBloc.createFromContext(context),
                child: DisposableProvider<
                    IPaginationListBloc<PaginationPage<IChatMessage>,
                        IChatMessage>>(
                  create: (context) =>
                      ChatMessagePaginationListWithNewItemsBloc(
                          mergeNewItemsImmediately: true,
                          chatMessageCachedListService:
                              IChatMessageCachedListBloc.of(context,
                                  listen: false),
                          paginationBloc: Provider.of<
                              IPaginationBloc<PaginationPage<IChatMessage>,
                                  IChatMessage>>(context, listen: false)),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ChatMessageListWidget(
                          key: PageStorageKey(chatBloc.chat.remoteId),
                        ),
                      ),
                      Container(height: 1, color: FediColors.ultraLightGrey),
                      ChatPostMessageWidget()
                    ],
                  ),
                ),
              ));
        });
  }
}

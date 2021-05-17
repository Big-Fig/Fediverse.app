import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/list/pleroma_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatWithLastMessageListWidget
    extends FediPaginationListWidget<IPleromaChatWithLastMessage> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const PleromaChatWithLastMessageListWidget({
    required Key key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    bool refreshOnFirstLoad = true,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IPleromaChatWithLastMessage> items,
    required Widget? header,
    required Widget? footer,
  }) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        keyboardDismissBehavior: keyboardDismissBehavior,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) =>
            Provider<IPleromaChatWithLastMessage>.value(
          value: items[index],
          child: DisposableProxyProvider<IPleromaChatWithLastMessage,
              IPleromaChatBloc>(
            update: (context, chatWithLastMessage, oldBloc) {
              // don't recreate bloc if it is already crated for this chat
              // all data updates handled inside bloc
              if (oldBloc != null &&
                  oldBloc.chat.remoteId == chatWithLastMessage.chat.remoteId) {
                return oldBloc;
              } else {
                var pleromaChatBloc = PleromaChatBloc.createFromContext(
                  context,
                  chat: chatWithLastMessage.chat,
                  lastChatMessage: chatWithLastMessage.lastChatMessage,
                );

                var pleromaChatWithLastMessagePaginationListWithNewItemsBloc =
                    IPleromaChatWithLastMessagePaginationListWithNewItemsBloc
                        .of(context, listen: false);
                pleromaChatBloc.addDisposable(
                  streamSubscription: pleromaChatBloc.chatStream.listen(
                    (chat) {
                      pleromaChatWithLastMessagePaginationListWithNewItemsBloc
                          .onItemUpdated(
                        SimplePleromaChatWithLastMessage(
                          chat: pleromaChatBloc.chat,
                          lastChatMessage: pleromaChatBloc.lastChatMessage,
                        ),
                      );
                    },
                  ),
                );

                return pleromaChatBloc;
              }
            },
            child: ProxyProvider<IPleromaChatBloc, IChatBloc>(
              update: (context, value, _) => value,
              child: FediListTile(
                isFirstInList: index == 0 && header == null,
                child: const ChatListItemWidget(
                  onClick: _goToChatPage,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
          IPleromaChatWithLastMessage>
      retrievePaginationListBloc(BuildContext context, {required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
            IPleromaChatWithLastMessage>>(context, listen: listen);

    return paginationListBloc;
  }
}

void _goToChatPage(BuildContext context) {
  var chatBloc = IPleromaChatBloc.of(context, listen: false);
  goToPleromaChatPage(context, chat: chatBloc.chat);
}

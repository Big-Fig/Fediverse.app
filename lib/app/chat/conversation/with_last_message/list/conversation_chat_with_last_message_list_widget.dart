import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_page.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/list/conversation_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_dispose/easy_dispose.dart';

class ConversationChatWithLastMessageListWidget
    extends FediPaginationListWidget<IConversationChatWithLastMessage> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const ConversationChatWithLastMessageListWidget({
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
    required List<IConversationChatWithLastMessage> items,
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
            Provider<IConversationChatWithLastMessage>.value(
          value: items[index],
          child: DisposableProxyProvider<IConversationChatWithLastMessage,
              IConversationChatBloc>(
            update: (context, chatWithLastMessage, oldBloc) {
              // dont recreate bloc if it is already crated for this chat
              // all data updates handled inside bloc
              if (oldBloc != null &&
                  oldBloc.chat.remoteId == chatWithLastMessage.chat.remoteId) {
                return oldBloc;
              } else {
                var conversationChatBloc = ConversationChatBloc.createFromContext(
                  context,
                  chat: chatWithLastMessage.chat,
                  lastChatMessage: chatWithLastMessage.lastChatMessage,
                );

                var conversationChatWithLastMessagePaginationListWithNewItemsBloc =
                IConversationChatWithLastMessagePaginationListWithNewItemsBloc
                    .of(context, listen: false);
                conversationChatBloc.chatStream.listen(
                      (chat) {
                    conversationChatWithLastMessagePaginationListWithNewItemsBloc
                        .onItemUpdated(
                      SimpleConversationChatWithLastMessage(
                        chat: conversationChatBloc.chat,
                        lastChatMessage: conversationChatBloc.lastChatMessage,
                      ),
                    );
                  },
                ).disposeWith(conversationChatBloc);
                
                return conversationChatBloc;
              }
            },
            child: ProxyProvider<IConversationChatBloc, IChatBloc>(
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
  IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
      IConversationChatWithLastMessage> retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
            IConversationChatWithLastMessage>>(context, listen: listen);

    return paginationListBloc;
  }
}

void _goToChatPage(BuildContext context) {
  var chatBloc = IConversationChatBloc.of(context, listen: false);
  var paginationListBloc = IPaginationListBloc.of(context, listen: false);
  goToConversationChatPage(
    context,
    chat: chatBloc.chat,
    lastChatMessage: chatBloc.lastChatMessage,
    onDeletedCallback: () {
      paginationListBloc.refreshWithController();
    },
  );
}

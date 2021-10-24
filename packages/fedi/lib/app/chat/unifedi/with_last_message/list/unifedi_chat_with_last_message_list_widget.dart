import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_page.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UnifediChatWithLastMessageListWidget
    extends FediPaginationListWidget<IUnifediChatWithLastMessage> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const UnifediChatWithLastMessageListWidget({
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
          isNeedToAddPaddingForUiTests: true,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IUnifediChatWithLastMessage> items,
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
            Provider<IUnifediChatWithLastMessage>.value(
          value: items[index],
          child: DisposableProxyProvider<IUnifediChatWithLastMessage,
              IUnifediChatBloc>(
            update: (context, chatWithLastMessage, oldBloc) {
              // dont recreate bloc if it is already crated for this chat
              // all data updates handled inside bloc
              if (oldBloc != null &&
                  oldBloc.chat.remoteId == chatWithLastMessage.chat.remoteId) {
                return oldBloc;
              } else {
                var unifediChatBloc = UnifediChatBloc.createFromContext(
                  context,
                  chat: chatWithLastMessage.chat,
                  lastChatMessage: chatWithLastMessage.lastChatMessage,
                );

                var unifediChatWithLastMessagePaginationListWithNewItemsBloc =
                    IUnifediChatWithLastMessagePaginationListWithNewItemsBloc
                        .of(context, listen: false);
                unifediChatBloc.chatStream.listen(
                  (chat) {
                    unifediChatWithLastMessagePaginationListWithNewItemsBloc
                        .onItemUpdated(
                      SimpleUnifediChatWithLastMessage(
                        chat: unifediChatBloc.chat,
                        lastChatMessage: unifediChatBloc.lastChatMessage,
                      ),
                    );
                  },
                ).disposeWith(unifediChatBloc);

                return unifediChatBloc;
              }
            },
            child: ProxyProvider<IUnifediChatBloc, IChatBloc>(
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
  IPaginationListBloc<PaginationPage<IUnifediChatWithLastMessage>,
          IUnifediChatWithLastMessage>
      retrievePaginationListBloc(BuildContext context, {required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IUnifediChatWithLastMessage>,
            IUnifediChatWithLastMessage>>(context, listen: listen);

    return paginationListBloc;
  }
}

void _goToChatPage(BuildContext context) {
  var chatBloc = IUnifediChatBloc.of(context, listen: false);
  goToUnifediChatPage(context, chat: chatBloc.chat);
}

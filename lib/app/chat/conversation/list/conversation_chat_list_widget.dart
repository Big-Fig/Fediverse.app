import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_page.dart';
import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConversationChatListWidget extends FediPaginationListWidget<IConversationChat> {
  const ConversationChatListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
  }) : super(
      key: key,
      footer: footer,
      header: header,
      alwaysShowHeader: alwaysShowHeader,
      alwaysShowFooter: alwaysShowFooter);

  @override
  ScrollView buildItemsCollectionView(
      {@required BuildContext context,
        @required List<IConversationChat> items,
        @required Widget header,
        @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IConversationChat>.value(
            value: items[index],
            child: DisposableProxyProvider<IConversationChat, IConversationChatBloc>(
              update: (context, chat, oldValue) =>
                  ConversationChatBloc.createFromContext(context,
                      chat: chat, lastChatMessage: null),
              child: FediListTile(
                isFirstInList: index == 0 && header == null,
                child: ProxyProvider<IConversationChatBloc, IChatBloc>(
                  update: (context, value, _) => value,
                  child: const ChatListItemWidget(
                    onClick: _goToChat,
                  ),
                ),
              ),
            ),
          ));

  @override
  IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>
  retrievePaginationListBloc(BuildContext context,
      {@required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>>(
        context,
        listen: listen);
    return paginationListBloc;
  }
}

void _goToChat(BuildContext context) {
  var conversationChatBloc = IConversationChatBloc.of(context, listen: false);
  goToConversationChatPage(context, chat: conversationChatBloc.chat);
}


// import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_page.dart';
// import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
// import 'package:fedi/app/ui/list/fedi_list_tile.dart';
// import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
// import 'package:fedi/disposable/disposable_provider.dart';
// import 'package:fedi/pagination/list/pagination_list_bloc.dart';
// import 'package:fedi/pagination/list/pagination_list_widget.dart';
// import 'package:fedi/pagination/pagination_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class ConversationChatListWidget extends FediPaginationListWidget<IConversationChat> {
//   ConversationChatListWidget({
//     @required Key key,
//     Widget header,
//     Widget footer,
//     bool alwaysShowHeader,
//     bool alwaysShowFooter,
//   }) : super(
//       key: key,
//       footer: footer,
//       header: header,
//       alwaysShowHeader: alwaysShowHeader,
//       alwaysShowFooter: alwaysShowFooter);
//
//   @override
//   ScrollView buildItemsCollectionView(
//       {@required BuildContext context,
//         @required List<IConversationChat> items,
//         @required Widget header,
//         @required Widget footer}) =>
//       PaginationListWidget.buildItemsListView(
//           context: context,
//           items: items,
//           header: header,
//           footer: footer,
//           itemBuilder: (context, index) => Provider<IConversationChat>.value(
//             value: items[index],
//             child: DisposableProxyProvider<IConversationChat, IConversationChatBloc>(
//               update: (context, chat, oldValue) =>
//                   ConversationChatBloc.createFromContext(context,
//                       chat: chat, lastChatMessage: null),
//               child: FediListTile(
//                 isFirstInList: index == 0 && header == null,
//                 child: const ChatListItemWidget(
//                   onClick: _goToChat,
//                 ),
//               ),
//             ),
//           ));
//
//   @override
//   IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>
//   retrievePaginationListBloc(BuildContext context,
//       {@required bool listen}) {
//     var paginationListBloc = Provider.of<
//         IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>>(
//         context,
//         listen: listen);
//     return paginationListBloc;
//   }
// }
//
// void _goToChat(BuildContext context) {
//   var conversationChatBloc = IConversationChatBloc.of(context, listen: false);
//   goToConversationChatPage(context, chat: conversationChatBloc.chat);
// }

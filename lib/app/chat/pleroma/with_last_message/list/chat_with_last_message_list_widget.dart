import 'package:fedi/app/chat/pleroma/chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/list/chat_list_item_widget.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatWithLastMessageListWidget
    extends FediPaginationListWidget<IChatWithLastMessage> {
  const ChatWithLastMessageListWidget({
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
          @required List<IChatWithLastMessage> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IChatWithLastMessage>.value(
                value: items[index],
                child: DisposableProxyProvider<IChatWithLastMessage, IChatBloc>(
                    update: (context, chatWithLastMessage, oldValue) =>
                        ChatBloc.createFromContext(
                          context,
                          chat: chatWithLastMessage.chat,
                          lastChatMessage: chatWithLastMessage.lastChatMessage,
                        ),
                    child: FediListTile(
                        isFirstInList: index == 0 && header == null,
                        child: ChatListItemWidget())),
              ));

  @override
  IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
          IChatWithLastMessage>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
            IChatWithLastMessage>>(context, listen: listen);
    return paginationListBloc;
  }
}

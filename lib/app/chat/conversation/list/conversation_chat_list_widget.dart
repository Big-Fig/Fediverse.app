import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/conversation_chat_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';

class ConversationChatListWidget extends FediPaginationListWidget<IConversationChat> {
  const ConversationChatListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter
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
                child:
                    DisposableProxyProvider<IConversationChat, IConversationChatBloc>(
                        update: (context, conversation, oldValue) =>
                            ConversationChatBloc.createFromContext(context,
                                conversation: conversation),
                        child: FediListTile(
                            isFirstInList: index == 0 && header == null,
                            child: ConversationChatListItemWidget())),
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

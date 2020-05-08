import 'package:fedi/refactored/app/chat/chat_bloc.dart';
import 'package:fedi/refactored/app/chat/chat_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPaginationListWidget
    extends PaginationListWidget<IChat> {
  ChatPaginationListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    RefreshAction additionalRefreshAction,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
            additionalRefreshAction: additionalRefreshAction);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IChat> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IChat>.value(
                value: items[index],
                child:
                    DisposableProxyProvider<IChat, IChatBloc>(
                        update: (context, chat, oldValue) =>
                            ChatBloc.createFromContext(context,
                                chat: chat),
                        child: ChatListItemWidget()),
              ));

  @override
  IPaginationListBloc<PaginationPage<IChat>, IChat>
      retrievePaginationListBloc(BuildContext context, {bool listen}) {
    var chatPaginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<IChat>, IChat>>(
        context,
        listen: listen);
    return chatPaginationListBloc;
  }
}

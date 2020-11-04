import 'package:fedi/app/chat/pleroma/chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/chat_model.dart';
import 'package:fedi/app/chat/pleroma/list/chat_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatListWidget extends FediPaginationListWidget<IChat> {
  ChatListWidget({
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
                child: DisposableProxyProvider<IChat, IChatBloc>(
                  update: (context, chat, oldValue) =>
                      ChatBloc.createFromContext(context,
                          chat: chat, lastChatMessage: null),
                  child: FediListTile(
                    isFirstInList: index == 0 && header == null,
                    child: const ChatListItemWidget(),
                  ),
                ),
              ));

  @override
  IPaginationListBloc<PaginationPage<IChat>, IChat> retrievePaginationListBloc(
      BuildContext context,
      {@required bool listen}) {
    var paginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IChat>, IChat>>(context,
            listen: listen);
    return paginationListBloc;
  }
}

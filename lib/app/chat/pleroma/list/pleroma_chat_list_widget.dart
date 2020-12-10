import 'package:fedi/app/chat/list/chat_list_item_widget.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatListWidget extends FediPaginationListWidget<IPleromaChat> {
  PleromaChatListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IPleromaChat> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IPleromaChat>.value(
                value: items[index],
                child: DisposableProxyProvider<IPleromaChat, IPleromaChatBloc>(
                  update: (context, chat, oldValue) =>
                      PleromaChatBloc.createFromContext(context,
                          chat: chat, lastChatMessage: null),
                  child: FediListTile(
                    isFirstInList: index == 0 && header == null,
                    child: const ChatListItemWidget(
                      onClick: _goToChat,
                    ),
                  ),
                ),
              ));

  @override
  IPaginationListBloc<PaginationPage<IPleromaChat>, IPleromaChat>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<IPleromaChat>, IPleromaChat>>(
        context,
        listen: listen);
    return paginationListBloc;
  }
}

void _goToChat(BuildContext context) {
  var pleromaChatBloc = IPleromaChatBloc.of(context, listen: false);
  goToPleromaChatPage(context, chat: pleromaChatBloc.chat);
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/list/chat_list_container_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_widget.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("chats_list_widget.dart");

class ChatListContainerWidget extends StatelessWidget {
  const ChatListContainerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var chatsListBloc = IChatListContainerBloc.of(context, listen: true);

    return MultiProvider(
      providers: [
        Provider.value(value: chatsListBloc.chatListService),
        Provider.value(value: chatsListBloc.chatPaginationBloc),
        Provider.value(value: chatsListBloc.chatPaginationListBloc),
        Provider.value(value: chatsListBloc.chatPaginationListWithNewItemsBloc),
        Provider.value(
            value: chatsListBloc.chatPaginationListWithNewItemsBloc
                as IPaginationListWithNewItemsBloc),
        Provider.value(
            value: chatsListBloc.chatPaginationListWithNewItemsBloc
                as IPaginationListBloc),
      ],
      child: Stack(
        children: [
          ChatListWidget(
            key: PageStorageKey("ChatsListWidget"),
          ),
          _buildOverlayNewItems(context)
        ],
      ),
    );
  }
  Builder _buildOverlayNewItems(BuildContext context) =>
      Builder(
        builder: (context) {
          var fediNestedScrollViewBloc =
          IFediNestedScrollViewBloc.of(context, listen: false);
          return StreamBuilder<bool>(
              stream:
              fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
              builder: (context, snapshot) {
                var isAtLeastStartExpand = snapshot.data;
                var topPadding = isAtLeastStartExpand == true
                    ? 24.0
                    : 24.0 + MediaQuery
                    .of(context)
                    .padding
                    .top;

                _logger.finest(() => "topPadding $topPadding");

//
//                            topPadding =
//                                24.0 + MediaQuery.of(context).padding.top;
//                                24.0;
                return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child:
                      PaginationListWithNewItemsOverlayWidget(
                        textBuilder: (context, updateItemsCount) =>
                            plural(
                                "app.chat.list.new_items"
                                    ".action.tap_to_load_new",
                                updateItemsCount),
                      ),
                    ));
              });
        },
      );

}

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/app/conversation/list/conversation_list_widget.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("conversations_list_widget.dart");

class ConversationsListWidget extends StatelessWidget {
  const ConversationsListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var conversationsListBloc =
        IConversationsListBloc.of(context, listen: true);

    return MultiProvider(
      providers: [
        Provider.value(value: conversationsListBloc.conversationListService),
        Provider.value(value: conversationsListBloc.conversationPaginationBloc),
        Provider.value(
            value: conversationsListBloc.conversationPaginationListBloc),
        Provider.value(
            value: conversationsListBloc.conversationPaginationListBloc
                as IPaginationListWithNewItemsBloc),
        Provider.value(
            value: conversationsListBloc.conversationPaginationListBloc
                as IPaginationListBloc),
      ],
      child: ConversationListWidget(
        key: PageStorageKey("ConversationsListWidget"),
      ),
    );
  }
}

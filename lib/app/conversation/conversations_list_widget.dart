import 'package:fedi/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/app/conversation/list/conversation_list_widget.dart';
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
      ],
      child: ConversationListWidget(
        key: PageStorageKey("ConversationsListWidget"),
      ),
    );
  }
}

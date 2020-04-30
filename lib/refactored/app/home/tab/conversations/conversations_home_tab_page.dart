import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversations_list_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/conversations_list_widget.dart';
import 'package:fedi/refactored/app/conversation/start/start_conversation_page.dart';
import 'package:fedi/refactored/app/conversation/websockets/my_account_conversations_websockets_handler_impl.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversations_home_tab_page.dart");

class ConversationsHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  ConversationsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)
            .tr("app.home.tab.conversations.title")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              goToStartConversationPage(context);
            },
          ),
        ],
      ),
      body: DisposableProvider<IConversationsListBloc>(
          create: (context) => ConversationsListBloc.createFromContext(context),
          child: ConversationsListWidget(key: this.key)),
    );
  }
}

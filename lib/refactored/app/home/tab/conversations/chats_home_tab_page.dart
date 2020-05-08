import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/chat/chats_list_bloc.dart';
import 'package:fedi/refactored/app/chat/chats_list_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/chats_list_widget.dart';
import 'package:fedi/refactored/app/chat/start/start_chat_page.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chats_home_tab_page.dart");

class ChatsHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  ChatsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)
            .tr("app.home.tab.chats.title")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              goToStartChatPage(context);
            },
          ),
        ],
      ),
      body: DisposableProvider<IChatsListBloc>(
          create: (context) => ChatsListBloc.createFromContext(context),
          child: ChatsListWidget(key: key)),
    );
  }
}

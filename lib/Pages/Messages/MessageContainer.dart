import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fedi/Pages/Messages/ChatPage.dart';
import 'package:fedi/Pages/Messages/MessagesPage.dart';
import 'package:fedi/Pages/Messages/UserListPage.dart';
import 'package:fedi/Pleroma/Models/Account.dart';

class MessageConatiner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageContainer();
  }
}

class _MessageContainer extends State<MessageConatiner>
    with TickerProviderStateMixin {

  TabController _controller;
  int _currentIndex = 0;
  List<Widget> pageControllers;

  final GlobalKey<MessagesPageState> _messageKey = GlobalKey();

  void initState() {
    super.initState();
    pageControllers = [
      MessagesPage(
        key: _messageKey,
      )
    ];
    _controller = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    _controller.addListener(_controllerChanged);
  }

  refreshPage() {
    _messageKey.currentState.fetchStatuses();
  }

  sendMessage(Account account) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            account: account,
            refreshMasterList: refreshPage,
            refreshMesagePage: refreshPage,
          ),
        ));
  }

  _goToUserList() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UserListPage(sendMessage)));
  }

  @override
  Widget build(BuildContext context) {

    var appLocalizations = AppLocalizations.of(context);

    List<String> titles = [
      appLocalizations.tr("message.tabs.messages"),
      appLocalizations.tr("message.tabs.notifications"),
    ];

    return Scaffold(
      body: pageControllers[_currentIndex],
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _goToUserList();
            },
          )
        ],
        // bottom: TabBar(
        //   controller: _controller,
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.mail_outline),
        //     ),
        //     Tab(
        //       icon: Icon(Icons.notifications_none),
        //     )
        //   ],
        // ),
      ),
    );
  }

  _controllerChanged() {
    setState(() {
      _currentIndex = _controller.index;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fedi/Pages/Messages/ChatPage.dart';
import 'package:fedi/Pages/Messages/MessagesPage.dart';
import 'package:fedi/Pages/Messages/UserListPage.dart';
import 'package:fedi/Pleroma/Models/Account.dart';

class MessageConatiner extends StatefulWidget {

  final List<Widget> pageControllers = [
    MessagesPage()
  ];

  @override
  State<StatefulWidget> createState() {
    return _MessageContainer();
  }
}

class _MessageContainer extends State<MessageConatiner> with TickerProviderStateMixin {
  List<String> titles = ["Messages", "Notifications"];
  TabController _controller;
  int _currentIndex = 0;


  void initState() {
    super.initState();
    _controller = TabController(length: 2, initialIndex: 0, vsync: this,);
     _controller.addListener(_controllerChanged);
  }

  sendMessage(Account account){
    print("test");
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            account: account,
          ),
        ));
  }

  _goToUserList(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserListPage(sendMessage)
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pageControllers[_currentIndex],
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

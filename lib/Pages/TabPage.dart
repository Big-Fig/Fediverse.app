import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/CaptureController.dart';
import 'package:phaze/Pages/Search/Search.dart';
import 'package:phaze/Pages/Timeline/MyTimelinePage.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Transitions/SlideBottomRoute.dart';
import './Placeholder.dart';
import 'Messages/MessageContainer.dart';
import 'Profile/AccountsBottomSheet.dart';
import 'Profile/MyProfilePage.dart';

class TabPage extends StatefulWidget {
  final Function addNewInstance;
  final Function loadInstance;

  TabPage({this.addNewInstance, this.loadInstance});

  @override
  State<StatefulWidget> createState() {
    return _TabPage();
  }
}

class _TabPage extends State<TabPage> {
  List<String> statuses = [''];
  AccountsBottomSheet bottomSheet;
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyTimelinePage(),
    Search(),
    PlaceholderWidget(Colors.green),
    MessageConatiner(),
    MyProfilePage(),
  ];

  List<AppBar> _appBar;

  @override
  Widget build(BuildContext context) {
    _appBar = [
      AppBar(
        title: Text('Your Timeline'),
      ),
      AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white54,
            hintText: 'Search',
            border: InputBorder.none,
            helperStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      AppBar(
        title: Text('New Post'),
      ),
      null,
      AppBar(
        centerTitle: true,
        title: FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                CurrentInstance.instance.currentAccount.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            showAccountSheet(context);
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: _appBar[_currentIndex],
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.add_box),
              title: Text('Post')),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.message),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
          context,
          SlideBottomRoute(page: CaptureController()),
        );
      } else {
        _currentIndex = index;
      }
    });
  }

  showAccountSheet(BuildContext context) {
    bottomSheet = AccountsBottomSheet(
      addAccount: addAccount,
      swapAccount: swapAccount,
    );
    showModalBottomSheet(
        builder: (BuildContext context) {
          return bottomSheet;
        },
        context: context);
  }

  addAccount() {
    bottomSheet.hide();
    widget.addNewInstance();
  }

  swapAccount() {
    print("SWAP account");
    bottomSheet.hide();
    widget.loadInstance();
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:phaze/Pages/Home/HomeContainerPage.dart';
import 'package:phaze/Pages/Messages/VideoChat/WebRTCManager.dart';
import 'package:phaze/Pages/Push/PushHelper.dart';
import 'package:phaze/Pages/Search/Search.dart';
import 'package:phaze/Pages/Timeline/MyTimelinePage.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Transitions/SlideBottomRoute.dart';
import './Placeholder.dart';
import 'Messages/MessageContainer.dart';
// import 'Messages/VideoChatPage.dart';
// import 'Messages/signaling.dart';
import 'Notifications/NotificationPage.dart';
import 'Post/CaptureController.dart';
import 'Post/TextEditor.dart';
import 'Profile/AccountsBottomSheet.dart';
import 'Profile/MyProfilePage.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class TabPage extends StatefulWidget {
  final Function addNewInstance;
  final Function loadInstance;

  TabPage({this.addNewInstance, this.loadInstance});

  @override
  State<StatefulWidget> createState() {
    return _TabPage();
  }
}

class _TabPage extends State<TabPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  WebRTCManager manager = WebRTCManager.instance;

  List<String> statuses = [''];
  AccountsBottomSheet bottomSheet;
  int _currentIndex = 0;
  List<Widget> _children;

  List<AppBar> _appBar;
  TabController _tabController;
  final List<Widget> _homeControllers = [MyTimelinePage(), Search()];

  @override
  initState() {
    super.initState();
    _firebaseMessaging.requestNotificationPermissions();
    _tabController = TabController(length: 2, vsync: this);
    _children = [
      HomeContainerPage(_tabController, _homeControllers),
      NotificationPage(),
      PlaceholderWidget(Colors.green),
      MessageConatiner(),
      MyProfilePage(),
    ];

    if (CurrentInstance.instance.notificationId != null) {
      loadNotification();
    }
  }

  loadNotification() {
    print("Loading notification ${CurrentInstance.instance.notificationId}");

    // if (CurrentInstance.instance.notificationId == "mention") {
    //   _currentIndex = 3;
    // } else {
    //   _currentIndex = 1;
    // }
    // CurrentInstance.instance.notificationId = null;
    // setState(() {});
  }

  MediaStream currentStream;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    PushHelper.instance.config(context, swapAccount);

    _appBar = [
      null,
      // AppBar(
      //   title: Text('Your Timeline'),
      // ),
      AppBar(
        title: Text("Notifications"),
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
            icon: Icon(Icons.notifications),
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
        // Navigator.push(
        //   context,
        //   SlideBottomRoute(page: TextEditor()),
        // );

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
    if (bottomSheet != null) {
      bottomSheet.hide();
    }

    widget.loadInstance();
  }

  @override
  bool get wantKeepAlive => true;
}

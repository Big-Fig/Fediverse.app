import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:phaze/Pages/Home/HomeContainerPage.dart';
import 'package:phaze/Pages/Messages/VideoChat/WebRTCManager.dart';
import 'package:phaze/Pages/Profile/EditProfile.dart';
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
import 'Profile/AccountsBottomSheet.dart';
import 'Profile/MyProfilePage.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class TabPage extends StatefulWidget {
  final GlobalKey<MyTimelinePageState> _timelineKey = GlobalKey();
  final GlobalKey<SearchState> _searchKey = GlobalKey();
  final GlobalKey<NotificationPageState> _notificationKey = GlobalKey();
  final Function addNewInstance;
  final Function loadInstance;

  TabPage({this.addNewInstance, this.loadInstance});

  @override
  State<StatefulWidget> createState() {
    return TabPageState();
  }
}

class TabPageState extends State<TabPage>
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
  List<Widget> _homeControllers = [];

  String currentTimeline = "Home";

  @override
  initState() {
    super.initState();
    _homeControllers = [
      MyTimelinePage(
        this,
        key: widget._timelineKey,
      ),
      Search(
        key:  widget._searchKey,
      )
    ];
    _firebaseMessaging.requestNotificationPermissions();
    _tabController = TabController(length: 2, vsync: this);
    _children = [
      HomeContainerPage(_tabController, _homeControllers,  widget._timelineKey, this),
      NotificationPage(
        key:  widget._notificationKey,
      ),
      PlaceholderWidget(Colors.green),
      MessageConatiner(),
      MyProfilePage(),
    ];

    if (PushHelper.instance.notifcationType != null) {
      loadNotification();
    }
  }

  loadNotification() {
    print("Loading notification ${PushHelper.instance.notifcationType}");

    // if (PushHelper.instance.notifcationType == "mention") {
    //   _currentIndex = 3;
    // } else {
    //   _currentIndex = 1;
    // }

    _currentIndex = 1;
    PushHelper.instance.notifcationType = null;
    setState(() {});
  }

  MediaStream currentStream;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    PushHelper.instance.swapAccount = swapAccount;
    PushHelper.instance.register();
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile(), settings:RouteSettings(name: "/MyProfile"),));
            },
          )
        ],
      ),
    ];

    return Scaffold(
      key: PageStorageKey<String>("tabpagekey"),
      appBar: _appBar[_currentIndex],
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.notifications),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.add_box),
              title: Text('')),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.message),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.person),
            title: Text(''),
          ),
        ],
      ),
    );
  }

  void onDoubleDap(int index) {}

  List<int> tabTaps = [0, 0, 0, 0, 0];
  int currentIndex = 0;
  void onTabTapped(int index) {
    if (currentIndex != index) {
      currentIndex = index;
    } else {
      tabTaps[index] += 1;
    }
    int taps = tabTaps[index];
    if (taps > 1 && index == 0) {
      if ( widget._timelineKey.currentState.mounted) {
         widget._timelineKey.currentState.refreshEverything();
      }

      if ( widget._searchKey.currentState.mounted) {
         widget._searchKey.currentState.refreshEverything();
      }
    } else if (taps > 1 && index == 1) {
      if ( widget._notificationKey.currentState.mounted) {
         widget._notificationKey.currentState.refreshEverything();
      }
    }

    Timer(Duration(seconds: 1), () {
      tabTaps[index] = 0;
    });
    print("single tap");
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

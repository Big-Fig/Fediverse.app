import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/webrtc.dart';
import 'package:fedi/Pages/Home/HomeContainerPage.dart';
import 'package:fedi/Pages/Messages/VideoChat/WebRTCManager.dart';
import 'package:fedi/Pages/Profile/EditProfile.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pages/Gallery/GalleryPage.dart';
import 'package:fedi/Pages/Timeline/MyTimelinePage.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Transitions/SlideBottomRoute.dart';
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
  final Function addNewInstance;
  final Function refreshInstance;
  final Function loadInstance;
  final Function logout;
  final int initalIndex;

  TabPage(this.initalIndex,
      {this.addNewInstance,
      this.loadInstance,
      this.refreshInstance,
      this.logout});

  @override
  State<StatefulWidget> createState() {
    return TabPageState();
  }
}

class TabPageState extends State<TabPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final GlobalKey<MyTimelinePageState> _timelineKey = GlobalKey();
  final GlobalKey<GalleryPageState> _galleryKey = GlobalKey();
  final GlobalKey<NotificationPageState> _notificationKey = GlobalKey();
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  // WebRTCManager manager = WebRTCManager.instance;

  String currentTimeline = "Home";
  List<String> statuses = [''];
  AccountsBottomSheet bottomSheet;
  int _currentIndex = 0;
  List<Widget> _children;

  List<AppBar> _appBar;
  TabController _tabController;
  List<Widget> _homeControllers = [];
  MyProfilePage myProfile = MyProfilePage();

  rebuildWithSelectedTimelien(String timeline) {
    print("updates going on here!!!!");
    print(currentTimeline);
    _timelineKey.currentState.selectTimeline(timeline);
  }

  @override
  initState() {
    super.initState();
    _homeControllers = [
      MyTimelinePage(
        this,
        key: _timelineKey,
      ),
      GalleryPage(
        key: _galleryKey,
      )
    ];
    _firebaseMessaging.requestNotificationPermissions();
    _tabController = TabController(length: 2, vsync: this);
    _children = [
      HomeContainerPage(_tabController, _homeControllers, this),
      NotificationPage(
        key: _notificationKey,
      ),
      PlaceholderWidget(Colors.green),
      MessageConatiner(),
      myProfile,
    ];

    if (PushHelper.instance.notifcationType != null) {
      loadNotification();
    }
  }

  loadNotification() {
    print("Loading notification ${PushHelper.instance.notifcationType}");

    _currentIndex = 1;
    PushHelper.instance.notifcationType = null;
    setState(() {});
  }

  // MediaStream currentStream;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var currentURL = "${CurrentInstance.instance.currentClient.baseURL}"
        .replaceAll("https://", "@");
    var client = "${CurrentInstance.instance.currentAccount.acct}$currentURL";

    PushHelper.instance.swapAccount = swapAccount;
    PushHelper.instance.register();
    _appBar = [
      null,
      // AppBar(
      //   title: Text('Your Timeline'),
      // ),
      // Notifications Tab is handled by that page
      null,
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
              AutoSizeText(
                  client,
                  minFontSize:12,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Colors.white,
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
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(refresh),
                    settings: RouteSettings(name: "/MyProfile"),
                  ));
            },
          )
        ],
      ),
    ];

    return Scaffold(
      appBar: _appBar[_currentIndex],
      body: _children[_currentIndex], // new
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideBottomRoute(page: CaptureController()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),

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
              backgroundColor: Colors.green, icon: Icon(null), title: Text('')),
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

  void onTabTapped(int index) {
    tabTaps[index] += 1;
    int taps = tabTaps[index];
    if (taps > 1 && index == 0) {
      if (_timelineKey.currentState != null) {
        _timelineKey.currentState.refreshEverything();
      }

      if (_galleryKey.currentState != null) {
        _galleryKey.currentState.refreshEverything();
      }
    } else if (taps > 1 && index == 1) {
      if (_notificationKey.currentState != null) {
        // _notificationKey.currentState.refreshEverything();
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
      logout: logout,
    );
    showModalBottomSheet(
        builder: (BuildContext context) {
          return bottomSheet;
        },
        context: context);
  }

  logout() {
    bottomSheet.hide();
    widget.logout();
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

  refresh(BuildContext viewContext) {
    Navigator.pop(viewContext);
    // profileKey.currentState.refresh();
  }

  @override
  bool get wantKeepAlive => true;
}

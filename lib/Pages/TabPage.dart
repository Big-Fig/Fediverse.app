import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Post/QuickPostPage.dart';
import 'package:fedi/Pages/Statuses/emoji_reaction_bloc.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/app/emoji/emoji_bottom_picker.dart';
import 'package:fedi/app/emoji/emoji_bottom_sheet_bloc.dart';
import 'package:fedi/app/emoji/emoji_bottom_sheet_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fedi/Pages/Profile/EditProfile.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pages/Gallery/GalleryPage.dart';
import 'package:fedi/Pages/Timeline/MyTimelinePage.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Transitions/SlideBottomRoute.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import './Placeholder.dart';
import 'Messages/MessageContainer.dart';
import 'Notifications/NotificationPage.dart';
import 'Profile/AccountsBottomSheet.dart';
import 'Profile/MyProfilePage.dart';
import 'package:web_socket_channel/io.dart';

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


// StreamSubscription _intentDataStreamSubscription;
//   List<SharedMediaFile> _sharedFiles;
//   String _sharedText;

  final GlobalKey<MyTimelinePageState> _timelineKey = GlobalKey();
  final GlobalKey<GalleryPageState> _galleryKey = GlobalKey();
  final GlobalKey<NotificationPageState> _notificationKey = GlobalKey();
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
      
  // WebRTCManager manager = WebRTCManager.instance;

  // Should be refactored to enums
  String currentTimeline = "Home";
  List<String> statuses = [''];
  AccountsBottomSheet bottomSheet;
  EmojiBottomPicker emojiPicker;

  int _currentIndex = 0;
  List<Widget> _children;

  List<AppBar> _appBar;
  TabController _tabController;
  MyProfilePage myProfile = MyProfilePage();
  var emojiPickerShown = false;
  rebuildWithSelectedTimelien(String timeline) {
    _timelineKey.currentState.selectTimeline(timeline);
  }

  @override
  initState() {
    super.initState();
    updateBadges();
    _firebaseMessaging.requestNotificationPermissions();
    _tabController = TabController(length: 2, vsync: this);
    _children = [
      MyTimelinePage(
        this,
        key: _timelineKey,
      ),
      NotificationPage(
        key: _notificationKey,
      ),
      PlaceholderWidget(Colors.blue),
      MessageConatiner(),
      myProfile,
    ];

    PushHelper pushHelper = PushHelper.instance;
    pushHelper.swapAccount = swapAccount;
    if (pushHelper.notifcationType != null) {
      loadNotification(context);
    }

     emojiBloc.getStatus.listen((status) {
      if (status == null) {
        return;
      }
      if (emojiPickerShown) {
        return;
      }
      showEmoji(context, status);
      print(status);
    });

    // _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
    //     .listen((List<SharedMediaFile> value) {
    //   setState(() {
    //     _sharedFiles = value;
    //     print("Shared:" + (_sharedFiles?.map((f) => f.path)?.join(",") ?? ""));
    //       // var post = QuickPostPage();
    //       // post.
    //       // Navigator.push(
    //       //     context,
    //       //     SlideBottomRoute(page: ),
    //       //   );
    //   });
    // }, onError: (err) {
    //   print("getIntentDataStream error: $err");
    // });

    // // For sharing images coming from outside the app while the app is closed
    // ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
    //   setState(() {
    //     _sharedFiles = value;
    //     print("Shared:" + (_sharedFiles?.map((f) => f.path)?.join(",") ?? ""));
    //   });
    // });

    // // For sharing or opening urls/text coming from outside the app while the app is in the memory
    // _intentDataStreamSubscription =
    //     ReceiveSharingIntent.getTextStream().listen((String value) {
    //   setState(() {
    //     _sharedText = value;
    //     print("Shared: $_sharedText");
    //   });
    // }, onError: (err) {
    //   print("getLinkStream error: $err");
    // });

    // // For sharing or opening urls/text coming from outside the app while the app is closed
    // ReceiveSharingIntent.getInitialText().then((String value) {
    //   setState(() {
    //     _sharedText = value;
    //     print("Shared: $_sharedText");
    //   });
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  loadNotification(BuildContext context) {
    PushHelper pushHelper = PushHelper.instance;
    print("Loading notification ${pushHelper.notifcationType}");

    _currentIndex = 1;
    pushHelper.notifcationType = null;
    setState(() {});
  }

  // MediaStream currentStream;
  PageController pageController;

  returnTotab() {
    print("return to tab");
    pageController.animateToPage(1,
        curve: Curves.easeIn, duration: Duration(milliseconds: 300));
  }

  ScrollPhysics currentPhysics;

  updateBadges() {
    checkAlerts();
  }

  final channel = IOWebSocketChannel.connect(
      '${CurrentInstance.instance.currentClient.baseURL.replaceAll("https://", "ws://")}/api/v1/streaming/user',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer ${CurrentInstance.instance.currentClient.accessToken}",
      });

  setUpWebSockets() {
    print("BASEURL");
    String url = CurrentInstance.instance.currentClient.baseURL
        .replaceAll("https://", "ws://");
    print(CurrentInstance.instance.currentClient.baseURL);

    StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        print("WEBSOCKET");
        print(snapshot.data);
        return Container();
      },
    );
  }

  checkAlerts() async {
    String account =
        "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";
    int alert = 0;
    alert += await InstanceStorage.getAccountAlert(account, "mention") ?? 0;
    alert += await InstanceStorage.getAccountAlert(account, "favourite") ?? 0;
    alert += await InstanceStorage.getAccountAlert(account, "reblog") ?? 0;
    alert += await InstanceStorage.getAccountAlert(account, "follow") ?? 0;

    setState(() {
      if (alert > 0) {
        notificaitonIcon = Badge(
          shape: BadgeShape.circle,
          borderRadius: 100,
          //Text(''),
          child: Icon(Icons.notifications),
          badgeContent: Container(
            height: 5,
            width: 5,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
        );
      } else {
        notificaitonIcon = Icon(Icons.notifications);
      }
    });
  }

  EmojiBottomSheetBloc emojiBloc = EmojiBottomSheetBloc();
  Widget notificaitonIcon = Icon(Icons.notifications);

  @override
  Widget build(BuildContext context) {
   
    super.build(context);
    checkNotifications();
    pageController = PageController(
      initialPage: 1,
      keepPage: true,
    );
    var currentURL = "${CurrentInstance.instance.currentClient.baseURL}"
        .replaceAll("https://", "@");
    var client = "${CurrentInstance.instance.currentAccount.acct}$currentURL";

    _appBar = [
      null,
      null,
      AppBar(
        title: Text(AppLocalizations.of(context).tr("tab_page.title")),
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
                minFontSize: 12,
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

    return MultiProvider(
      providers: [
        Provider<EmojiBottomSheetProvider>(
          create: (context) => EmojiBottomSheetProvider(
            emojiBloc,
          ),
        ),
      ],
      child: Scaffold(
        appBar: _appBar[_currentIndex],
        body: _children[_currentIndex], // new
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              SlideBottomRoute(page: QuickPostPage("", [])),
            );
          },
          tooltip:
              AppLocalizations.of(context).tr("tab_page.tooltip.increment"),
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
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            new BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: notificaitonIcon,
              title: Text(''),
            ),
            new BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(null),
                title: Text('')),
            new BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.mail),
              title: Text(''),
            ),
            new BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: GestureDetector(
                onLongPress: () {
                  showAccountSheet(context);
                },
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: CurrentInstance.instance.currentAccount.avatar,
                    placeholder: (context, url) => Container(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              title: Text(''),
            ),
          ],
        ),
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
        Navigator.push(
          context,
          SlideBottomRoute(page: QuickPostPage("", [])),
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

  showEmoji(BuildContext context, Status status) {
    print("SHOWING");
    showModalBottomSheet(
            builder: (BuildContext context) {
              return EmojiBottomPicker(emojiBloc: emojiBloc,);
            },
            context: context,
            elevation:1
            )
        .whenComplete(() {
      emojiPickerShown = false;
    });
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

  checkNotifications() {
    String account =
        "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";
    InstanceStorage.getAccountSubscribedToNotifications(account).then((subbed) {
      if (subbed == false) {
        PushHelper.instance.register();
      }
    });
  }

  @override
  bool get wantKeepAlive => false;
}

import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Notifications/Follows.dart';
import 'package:fedi/Pages/Notifications/Mentions.dart';
import 'package:fedi/Pages/Notifications/all_notifications.dart';
import 'package:fedi/Pages/Notifications/likes_page.dart';
import 'package:fedi/Pages/Notifications/reposts_page.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Notification.dart'
    as NotificationRequest;
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Notification.dart' as NotificationModel;
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/push/pleroma_push_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NotificationPageState();
  }
}

class NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  List<Widget> _tabPages = [];

  viewAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  viewStatusDetail(Status status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    print("HELP");
    _tabPages = [
      AllNotifications(),
      Mentions(viewAccount, viewStatusDetail),
      RepostsPage(viewAccount, viewStatusDetail),
      LikesPage(viewAccount, viewStatusDetail),
      Follows(viewAccount, viewStatusDetail)
    ];
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PushHelper pushHelper = PushHelper.of(context, listen: false);
    if (pushHelper.notificationId != null) {
      loadPushNotification(context, pushHelper.notificationId);
    }
  }

  loadPushNotification(BuildContext context, String notificationId) {
    String getnotificationByid =
        NotificationRequest.Notification.getNotificationById(notificationId);
    CurrentInstance.instance.currentClient
        .run(path: getnotificationByid, method: HTTPMethod.GET)
        .then((response) {
      NotificationModel.Notification notification =
          NotificationModel.Notification.fromJson(json.decode(response.body));

      if (notification.type == "follow") {
        viewAccount(notification.account);
      } else if (notification.type == "mention") {
        viewStatusDetail(notification.status);
      }
    }).catchError((onError) {
      print("$onError");
    });

    PushHelper pushHelper = PushHelper.of(context, listen: false);
    pushHelper.notificationId = null;
    pushHelper.notifcationType = null;
  }

  void onTabTapped(int index) {
    setState(() {});
  }

  Widget allTab = Tab(
    icon: Icon(Icons.notifications_none),
    text: null,
  );

  Widget mentionTab = Tab(
    icon: Image(
      height: 20,
      width: 20,
      color: Colors.white,
      image: AssetImage("assets/images/comment.png"),
    ),
    text: null,
  );
  Widget likeTab = Tab(
    icon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          height: 20,
          width: 20,
          color: Colors.white,
          image: AssetImage("assets/images/favorites.png"),
        ),
      ],
    ),
    text: null,
  );
  Widget repostTab = Tab(
    icon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          height: 20,
          width: 20,
          color: Colors.white,
          image: AssetImage("assets/images/repost.png"),
        ),
      ],
    ),
    text: null,
  );
  Widget followTab = Tab(
    icon: Icon(Icons.person_add),
    text: null,
  );

  checkAlerts() async {
    String account =
        "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";

    int mentionAlert =
        await InstanceStorage.getAccountAlert(account, "mention") ?? 0;
    int favAlert =
        await InstanceStorage.getAccountAlert(account, "favourite") ?? 0;
    favAlert += await InstanceStorage.getAccountAlert(account, "reblog") ?? 0;
    int followAlert =
        await InstanceStorage.getAccountAlert(account, "follow") ?? 0;

    setState(() {
      if (mentionAlert > 0) {
        mentionTab = Tab(
          icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: 100,
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
            child: Image(
              height: 15,
              width: 15,
              color: Colors.grey,
              image: AssetImage("assets/images/comment.png"),
            ),
          ),
          text: null,
        );
      } else {
        mentionTab = Tab(
          icon: Image(
            height: 15,
            width: 15,
            color: Colors.grey,
            image: AssetImage("assets/images/comment.png"),
          ),
          text: null,
        );
      }

      if (followAlert > 0) {
        followTab = Tab(
          icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: 100,
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
            child: Icon(Icons.person_add),
          ),
          text: null,
        );
      } else {
        followTab = Tab(
          icon: Icon(Icons.person_add),
          text: null,
        );
      }

      if (favAlert > 0) {
        likeTab = Tab(
          icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: 100,
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
            //Text(''),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 20,
                  width: 20,
                  color: Colors.grey,
                  image: AssetImage("assets/images/favorites.png"),
                ),
                Text(" / "),
                Image(
                  height: 20,
                  width: 20,
                  color: Colors.grey,
                  image: AssetImage("assets/images/favorites.png"),
                ),
              ],
            ),
          ),
          text: null,
        );
      } else {
        likeTab = Tab(
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: 20,
                width: 20,
                color: Colors.grey,
                image: AssetImage("assets/images/favorites.png"),
              ),
              Text(" / "),
              Image(
                height: 20,
                width: 20,
                color: Colors.grey,
                image: AssetImage("assets/images/favorites.png"),
              ),
            ],
          ),
          text: null,
        );
      }
    });
  }

  TabController _tabController;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: NotificationsPagePushSettingsDrawer(),
      body: _tabPages[_tabController.index],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _drawerKey.currentState.openEndDrawer();
              })
        ],
        title: TabBar(
          onTap: onTabTapped,
          controller: _tabController,
          tabs: <Widget>[
            allTab,
            mentionTab,
            repostTab,
            likeTab,
            followTab,
          ],
        ),
      ),
    );
  }
}

class NotificationsPagePushSettingsDrawer extends StatefulWidget {
  @override
  _NotificationsPagePushSettingsDrawerState createState() =>
      _NotificationsPagePushSettingsDrawerState();
}

class _NotificationsPagePushSettingsDrawerState
    extends State<NotificationsPagePushSettingsDrawer> {
  PleromaPushSubscribeData settings;

  String get account =>
      "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";
  @override
  void initState() {
    super.initState();

    InstanceStorage.getAccountNotificationsSettings(account)
        .then((loadedSettings) {
      setState(() {
        this.settings = loadedSettings ??
            PleromaPushSubscribeData(
                alerts: PleromaPushSettingsDataAlerts.defaultAllEnabled());
      });
    });
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(child: buildDrawerBody(context)),
      );

  Widget buildDrawerBody(BuildContext context) {
    if (settings == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
          height: 110,
          width: 50,
          child: DrawerHeader(
            child: Text(
              AppLocalizations.of(context).tr("home.drawer"
                  ".notifications_settings.header"),
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .tr("home.drawer.notifications_settings.favourite"),
              ),
              Spacer(),
              Switch(
                value: settings.alerts.favourite,
                onChanged: (value) async {
                  settings.alerts.favourite = value;
                  await InstanceStorage.setAccountNotificationsSettings(
                      account, settings);
                  PushHelper.of(context, listen: false).register();
                  setState(() {});
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .tr("home.drawer.notifications_settings.follow"),
              ),
              Spacer(),
              Switch(
                value: settings.alerts.follow,
                onChanged: (value) async {
                  settings.alerts.follow = value;
                  await InstanceStorage.setAccountNotificationsSettings(
                      account, settings);
                  PushHelper.of(context, listen: false).register();
                  setState(() {});
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .tr("home.drawer.notifications_settings.mention"),
              ),
              Spacer(),
              Switch(
                value: settings.alerts.mention,
                onChanged: (value) async {
                  settings.alerts.mention = value;
                  await InstanceStorage.setAccountNotificationsSettings(
                      account, settings);
                  PushHelper.of(context, listen: false).register();
                  setState(() {});
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .tr("home.drawer.notifications_settings.reblog"),
              ),
              Spacer(),
              Switch(
                value: settings.alerts.reblog,
                onChanged: (value) async {
                  settings.alerts.reblog = value;
                  await InstanceStorage.setAccountNotificationsSettings(
                      account, settings);
                  PushHelper.of(context, listen: false).register();
                  setState(() {});
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .tr("home.drawer.notifications_settings.poll"),
              ),
              Spacer(),
              Switch(
                value: settings.alerts.poll,
                onChanged: (value) async {
                  settings.alerts.poll = value;
                  await InstanceStorage.setAccountNotificationsSettings(
                      account, settings);
                  PushHelper.of(context, listen: false).register();
                  setState(() {});
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ],
          ),
        )
      ]);
    }
  }
}

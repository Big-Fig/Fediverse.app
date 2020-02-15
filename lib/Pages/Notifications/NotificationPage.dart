import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Notifications/Follows.dart';
import 'package:fedi/Pages/Notifications/LikesReposts.dart';
import 'package:fedi/Pages/Notifications/Mentions.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Notification.dart'
    as NotificationRequest;
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/Models/Notification.dart' as NotificationModel;
import 'package:fedi/Pleroma/Models/Status.dart';

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
    checkAlerts();
    print("HELP");
    _tabPages = [
      Mentions(viewAccount, viewStatusDetail),
      LikesReposts(viewAccount, viewStatusDetail),
      Follows(viewAccount, viewStatusDetail)
    ];
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);

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
    checkAlerts();
  }

  Widget mentionTab = Tab(
    icon: Icon(Icons.reply),
    text: null,
  );
  Widget likeTab = Tab(
    icon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(Icons.cached), Text(" / "), Icon(Icons.thumb_up)],
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
            child: Icon(Icons.reply),
          ),
          text: null,
        );
      } else {
        mentionTab = Tab(
          icon: Icon(Icons.reply),
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
            ), //Text(''),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.cached),
                Text(" / "),
                Icon(Icons.favorite_border)
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
              Icon(Icons.cached),
              Text(" / "),
              Icon(Icons.favorite_border)
            ],
          ),
          text: null,
        );
      }
    });
  }

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_tabController.index],
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("notifications.page.title")),
        bottom: TabBar(
          onTap: onTabTapped,
          controller: _tabController,
          tabs: <Widget>[
            mentionTab,
            likeTab,
            followTab,
          ],
        ),
      ),
    );
  }
}

import 'package:fedi/Pages/Notifications/Follows.dart';
import 'package:fedi/Pages/Notifications/LikesReposts.dart';
import 'package:fedi/Pages/Notifications/Mentions.dart';
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
import 'package:fedi/Pleroma/Models/Account.dart';
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
    print("HELP");
    _tabPages = [
      Mentions(viewAccount, viewStatusDetail),
      LikesReposts(viewAccount, viewStatusDetail),
      Follows(viewAccount, viewStatusDetail)
    ];
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    if (PushHelper.instance.notificationId != null) {
      loadPushNotification(PushHelper.instance.notificationId);
    }
  }

  loadPushNotification(String notificationId) {
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

    PushHelper.instance.notificationId = null;
    PushHelper.instance.notifcationType = null;
  }

  void onTabTapped(int index) {
    setState(() {});
  }

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_tabController.index],
      appBar: AppBar(
        title: Text("Notifications"),
        bottom: TabBar(
          onTap: onTabTapped,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.reply),
              text: null,
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.cached),
                  Text(" / "),
                  Icon(Icons.thumb_up)
                ],
              ),
              text: null,
            ),
            Tab(
              icon: Icon(Icons.person_add),
            ),
          ],
        ),
      ),
    );
  }
}

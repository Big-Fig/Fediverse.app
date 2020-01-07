import 'dart:convert';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Notification.dart'
    as NotificationRequest;
import 'package:fedi/Pleroma/Models/Notification.dart';
import 'package:fedi/Pleroma/Models/Notification.dart' as NotificationModel;
import 'NotificationCell.dart';


class Mentions extends StatefulWidget {
  final Function(Account) viewAccount;
  final Function(Status) viewStatusDetail;
  final List<NotificationModel.Notification> notifications = [];
  Mentions(this.viewAccount, this.viewStatusDetail, {Key key}) : super(key: key);

  @override
  _Mentions createState() => _Mentions();
}

class _Mentions extends State<Mentions> {

   RefreshController _refreshController =
      RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    return getSmartRefresher();
  }


  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }

    if (PushHelper.instance.notificationId != null) {
      loadPushNotification(PushHelper.instance.notificationId);
    }
  }

  void fetchStatuses(BuildContext context) {
    if (widget.notifications.length == 0) {
      _refreshController.requestRefresh();
    }
  }


  void _onRefresh() {
    print("ONREFRESH");
    // monitor network fetch
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: NotificationRequest.Notification.getMentionsNotifications(
                minId: "", maxId: "", sinceId: "", limit: "20"),
            method: HTTPMethod.GET)
        .then((response) {
      List<NotificationModel.Notification> newNotifications =
          notificationFromJson(response.body);

      if (mounted)
        setState(() {
          widget.notifications.clear();
          widget.notifications.addAll(newNotifications);
          _refreshController.refreshCompleted();
        });
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() {
    print("ONLOAD");
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    var lastId = "";
    NotificationModel.Notification lastNotification = widget.notifications.last;
    if (lastNotification != null) {
      lastId = lastNotification.id;
    }

    CurrentInstance.instance.currentClient
        .run(
            path: NotificationRequest.Notification.getMentionsNotifications(
                minId: "", maxId: lastId, sinceId: "", limit: "400"),
            method: HTTPMethod.GET)
        .then((response) {
      List<NotificationModel.Notification> newNotifications =
          notificationFromJson(response.body);
      widget.notifications.addAll(newNotifications);
      if (mounted)
        setState(() {
          _refreshController.loadComplete();
        });
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
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
        widget.viewAccount(notification.account);
      } else if (notification.type == "mention") {
        widget.viewStatusDetail(notification.status);
      }
    }).catchError((onError) {
      print("$onError");
    });

    PushHelper.instance.notificationId = null;
    PushHelper.instance.notifcationType = null;
  }

  Widget getSmartRefresher() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(
          complete: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.done,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                "Everything up to date",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          failed: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text("Unable to fetch data", style: TextStyle(color: Colors.grey))
            ],
          )),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed! Click retry!");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemBuilder: (c, i) => NotificationCell(
          widget.notifications[i],
          viewAccount: widget.viewAccount,
          viewStatusContext: widget.viewStatusDetail,
        ),
        itemCount: widget.notifications.length,
      ),
    );
  }

}
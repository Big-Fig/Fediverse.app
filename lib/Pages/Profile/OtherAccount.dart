import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fedi/Pages/Profile/ProfileHeader.dart';
import 'package:fedi/Pages/Timeline/TimelineCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OtherAccount extends StatefulWidget {
  final Account account;

  OtherAccount(this.account);

  @override
  State<StatefulWidget> createState() {
    return _OtherAccount();
  }
}

class _OtherAccount extends State<OtherAccount> {
  List<Status> statuses = <Status>[];
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }
  }

  void fetchStatuses(BuildContext context) {
    if (statuses.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    print("ONREFRESH");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: Accounts.getAccountStatuses(
                userId: widget.account.id,
                minId: "",
                maxId: "",
                sinceId: "",
                limit: "20"),
            method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = statusFromJson(response.body);
      statuses.clear();
      statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() async {
    print("ONLOAD");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    var lastId = "";
    Status lastStatus = statuses.last;
    if (lastStatus != null) {
      lastId = lastStatus.id;
    }

    CurrentInstance.instance.currentClient
        .run(
            path: Accounts.getAccountStatuses(
                userId: widget.account.id,
                minId: "",
                maxId: lastId,
                sinceId: "",
                limit: "20"),
            method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = statusFromJson(response.body);
      statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.loadComplete();
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.account.username),
      ),
      body: SmartRefresher(
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
                Text("Unable to fetch data",
                    style: TextStyle(color: Colors.grey))
              ],
            )),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
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
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ProfileHeader(
                profileAccount: widget.account,
              );
            } else {
              return TimelineCell(statuses[index - 1]);
            }
          },
          itemCount: (statuses.length + 1),
        ),
      ),
    );
  }
}

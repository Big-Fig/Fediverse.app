import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pages/Timeline/TimelineCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/Models/Status.dart' as StatusModel;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../Pleroma/Foundation/Requests/Timeline.dart';
import 'package:flutter/scheduler.dart';

import '../TabPage.dart';

class MyTimelinePage extends StatefulWidget {
  final TabPageState tabPage;

  MyTimelinePage(this.tabPage, {Key key}) : super(key: key);
  final List<Status> statuses = [];
  @override
  State<StatefulWidget> createState() {
    return MyTimelinePageState();
  }
}

class MyTimelinePageState extends State<MyTimelinePage> {
  String path;

  viewAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  selectTimeline(String timeline) {
    print("selectTimeline");
    if (timeline == widget.tabPage.currentTimeline) {
      return;
    }
    widget.tabPage.currentTimeline = timeline;
    if (widget.tabPage.currentTimeline == "Home") {
      path = Timeline.getHomeTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    } else if (widget.tabPage.currentTimeline == "Local") {
      path = Timeline.getLocalTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    } else {
      path = Timeline.getPublicTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    }
    if (mounted) {
      setState(() {});
    }
    refreshEverything();
  }

  refresh(){

  }

  viewStatusDetail(Status status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
        settings: RouteSettings(name: "/StatusDetail"),
      ),
    );
  }

  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }
    if (widget.tabPage.currentTimeline == "Home") {
      path = Timeline.getHomeTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    } else if (widget.tabPage.currentTimeline == "Local") {
      path = Timeline.getLocalTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    } else {
      path = Timeline.getPublicTimeline(
          minId: "", maxId: "", sinceId: "", limit: "20");
    }
  }

  refreshEverything() {
    _refreshController.requestRefresh();
  }

  void fetchStatuses(BuildContext context) {
    if (widget.statuses.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    print("ONREFRESH");
    // monitor network fetch
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = Status.listFromJsonString(response.body);
      newStatuses.removeWhere((status){
          return status.visibility == StatusModel.Visibility.DIRECT;
        });

      widget.statuses.clear();
      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
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
    Status lastStatus = widget.statuses.last;
    if (lastStatus != null) {
      lastId = lastStatus.id;
    }

    String loadMorePath;
    if (widget.tabPage.currentTimeline == "Home") {
      loadMorePath = Timeline.getHomeTimeline(
          minId: "", maxId: lastId, sinceId: "", limit: "20");
    } else if (widget.tabPage.currentTimeline == "Local") {
      loadMorePath = Timeline.getLocalTimeline(
          minId: "", maxId: lastId, sinceId: "", limit: "20");
    } else {
      loadMorePath = Timeline.getPublicTimeline(
          minId: "", maxId: lastId, sinceId: "", limit: "20");
    }

    CurrentInstance.instance.currentClient
        .run(path: loadMorePath, method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = Status.listFromJsonString(response.body);
      newStatuses.removeWhere((status){
          return status.visibility == StatusModel.Visibility.DIRECT;
        });
      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.loadComplete();
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("MyTimelinePage"),
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
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else {
            body = Text("");
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
        itemBuilder: (c, i) => TimelineCell(
          widget.statuses[i],
          viewAccount: viewAccount,
          viewStatusContext: viewStatusDetail,
        ),
        itemCount: widget.statuses.length,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phaze/Pages/Messages/MessagesCell.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Timeline.dart';
import 'package:phaze/Pleroma/Models/Conversation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagesPage extends StatefulWidget {
  final List<Conversation> conversations = [];

  @override
  State<StatefulWidget> createState() {
    return _MessagesPage();
  }
}

class _MessagesPage extends State<MessagesPage> {
  void initState() {
    super.initState();




    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }
  }

  void fetchStatuses(BuildContext context) {
    if (widget.conversations.length == 0) {
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
            path: Timeline.getConvverstations(
                minId: "", maxId: "", sinceId: "", limit: "20"),
            method: HTTPMethod.GET)
        .then((response) {
      List<Conversation> newConversations = conversationFromJson(response.body);
      widget.conversations.clear();
      widget.conversations.addAll(newConversations);
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
    Conversation lastConverstation = widget.conversations.last;
    if (lastConverstation != null) {
      lastId = lastConverstation.id;
    }

    CurrentInstance.instance.currentClient
        .run(
            path: Timeline.getConvverstations(
                minId: "", maxId: lastId, sinceId: "", limit: "20"),
            method: HTTPMethod.GET)
        .then((response) {
      List<Conversation> newConversations = conversationFromJson(response.body);
      widget.conversations.addAll(newConversations);
      if (mounted) setState(() {});
      _refreshController.loadComplete();
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  cellTapped(Conversation conversation) {}

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("messages"),
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
            Text(
              "Unable to fetch data",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("No more Messages");
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
        itemBuilder: (c, i) => MessagesCell(
          conversation: widget.conversations[i],
          cellTapped: cellTapped,
        ),
        itemCount: widget.conversations.length,
      ),
    );
  }
}

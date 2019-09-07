import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phaze/Pages/Messages/MessagesCell.dart';
import 'package:phaze/Pages/Timeline/TimelineCell.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:phaze/Pleroma/Models/Context.dart';
import 'package:phaze/Pleroma/Models/Conversation.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ChatCell.dart';

class ChatPage extends StatefulWidget {
  final Conversation conversation;

  ChatPage({this.conversation});

  @override
  State<StatefulWidget> createState() {
    return _ChatPage();
  }
}

class _ChatPage extends State<ChatPage> {
  List<Status> statuses = <Status>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DM"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: getMessageList(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 80),
              child: Padding(
                padding: EdgeInsets.all(
                    10), // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Message',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.image,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  OutlineButton(
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.green),
                    ),
                    color: Colors.green,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }

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
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: StatusRequest.Status.getStatusContext(widget.conversation.lastStatus.id),
            method: HTTPMethod.GET)
        .then((response) {
      Context context = contextFromJson(response.body);
      statuses.clear();
      List<Status> templist = [];
      templist.addAll(context.ancestors);
      templist.add(widget.conversation.lastStatus);
      templist.addAll(context.descendants);
      statuses.addAll(templist.reversed);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  Widget getMessageList() {
    return SmartRefresher(
      key: PageStorageKey<String>("messages"),
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.thumb_down,
              color: Colors.grey,
            ),
            Container(
              width: 15.0,
            ),
            Text(
              "",
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
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
       
        itemCount: statuses.length, itemBuilder: (BuildContext context, int index) {


          Status status = statuses[index];
          return ChatCell(status);

        },
      ),
    );
  }

  sendMessage(){
    
  }


  
}

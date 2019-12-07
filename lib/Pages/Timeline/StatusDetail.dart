import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phaze/Pages/Messages/Media/CaptureDMMedia.dart';
import 'package:phaze/Pages/Profile/OtherAccount.dart';
import 'package:phaze/Pages/Timeline/TimelineCell.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Context.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:phaze/Views/Alert.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatusDetail extends StatefulWidget {
  final Status status;

  StatusDetail({this.status});

  @override
  State<StatefulWidget> createState() {
    return _StatusDetail();
  }
}

class _StatusDetail extends State<StatusDetail> {
  var txtController = TextEditingController();
  List<Status> statuses = <Status>[];

  void initState() {
    super.initState();

    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) => _onRefresh());
    }
  }

  viewAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Status Details"),
          actions: <Widget>[],
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
                  controller: txtController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Reply',
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
                      Icons.videocam,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMedia(0, mediaUploaded)));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMedia(1, mediaUploaded)));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.image,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMedia(2, mediaUploaded)));
                    },
                  ),
                  Spacer(),
                  OutlineButton(
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.green),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      print("sending");
                      sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  mediaUploaded(String id) {
    print("MY ID!!! $id");

    Navigator.of(context)
        .popUntil((route) => route.settings.name == "/StatusDetail");

    sendMessageWithAttachment(id);
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ScrollController _controller = ScrollController();

  void _onRefresh() async {
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: StatusRequest.Status.getStatusContext(widget.status.id),
            method: HTTPMethod.GET)
        .then((response) {
      Context context = contextFromJson(response.body);
      statuses.clear();
      List<Status> templist = [];
      
      templist.addAll(context.ancestors);
      templist.add(widget.status);
      templist.addAll(context.descendants);
      // templist.addAll();
      // statuses.addAll(templist.reversed);
      statuses.addAll(templist.reversed);
      if (mounted)
        setState(() {
          _refreshController.refreshCompleted();
        });

    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }


  jumpToStatus() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  Widget getMessageList() {
    return SmartRefresher(
      //key: PageStorageKey<String>("StatusDeatilPage"),
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.thumb_up,
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
        controller: _controller,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemCount: statuses.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          Status status = statuses[index];
          
          return TimelineCell(status, viewAccount: viewAccount);
        },
      ),
    );
  }

  sendMessageWithAttachment(String id) {
    print("sending attachment! $id");
    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "",
      "visibility": widget.status.visibility,
      "in_reply_to_id": widget.status.id,
      "media_ids": [id]
    };

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      txtController.clear();
      var status = Status.fromJson(jsonDecode(statusResponse.body));
      statuses.insert(0, status);
      setState(() {});
    }).catchError((e) {
      print(e);
      var alert = Alert(
          context,
          "Opps",
          "Unable to post status at this time. Please try again later.",
          () => {});
      alert.showAlert();
    });
  }

  sendMessage() {
    if (txtController.text.length == 0) {
      print("too short");
      return;
    }

    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "${txtController.text}",
      "visibility": widget.status.visibility.toString(),
      "in_reply_to_id": widget.status.id
    };

    print(params);
    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      txtController.clear();
      var status = Status.fromJson(jsonDecode(statusResponse.body));
      statuses.insert(0, status);
      setState(() {});
    }).catchError((e) {
      print(e);
      var alert = Alert(
          context,
          "Opps",
          "Unable to post status at this time. Please try again later.",
          () => {});
      alert.showAlert();
    });
  }

  postMediaId(String id) {}
}

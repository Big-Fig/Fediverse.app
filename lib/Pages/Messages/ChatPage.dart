import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phaze/Pages/Push/PushHelper.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Context.dart';
import 'package:phaze/Pleroma/Models/Conversation.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:phaze/Views/Alert.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ChatCell.dart';
import 'Media/CaptureDMMedia.dart';

class ChatPage extends StatefulWidget {
  final Conversation conversation;
  final Account account;
  final Function refreshMasterList;
  ChatPage({this.conversation, this.account, this.refreshMasterList});

  @override
  State<StatefulWidget> createState() {
    return _ChatPage();
  }
}

class _ChatPage extends State<ChatPage> {



  
  var txtController = TextEditingController();
  List<Status> statuses = <Status>[];
  String title = "DM";

  
  

  update(){
    print("UPDATING FROM PUSH!!!!!!");
    widget.refreshMasterList();
    backgroundCheck();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.phone),
            //   onPressed: () {
            //     if (widget.account != null) {
            //       print(widget.account.url);
            //       String currentURL = "${widget.account.url}".split("/")[2];

            //       String client = "${widget.account.acct}@$currentURL";
            //       var peer;
            //       var peers = WebRTCManager.instance.peers;
            //       for (var i = 0; i < peers.length; i++) {
            //         print(peers[i]['name']);
            //         String name = peers[i]['name'];
            //         if (name.toLowerCase() == client.toLowerCase()) {
            //           peer = peers[i];
            //         }
            //       }

            //       WebRTCManager.instance.invitePeer(context, peer['id'], false);
            //     } else {
            //       var account = getOtherAccount(widget.conversation.accounts);

            //       String client = "${account.acct}";
            //       print(client);
            //       var peer;
            //       var peers = WebRTCManager.instance.peers;
            //       for (var i = 0; i < peers.length; i++) {
            //         String name = peers[i]['name'];
            //         if (name.toLowerCase() == client.toLowerCase()) {
            //           peer = peers[i];
            //           print(peer);
            //         }
            //       }

            //       WebRTCManager.instance.invitePeer(context, peer['id'], false);
            //     }
            //     WebRTCManager.instance.inCalling = true;

            //   },
            // ),
          ],
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
                      if (statuses.length == 0) {
                        startNewConvo();
                      } else {
                        sendMessage();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      backgroundCheck();
    });
    if (widget.account != null) {
      title = "DM ${widget.account.acct}";
    }
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }

    PushHelper.instance.notificationUpdater = update;
  }

  mediaUploaded(String id) {
    print("MY ID!!! $id");

    Navigator.of(context)
        .popUntil((route) => route.settings.name == "/ChatPage");

    if (statuses.length == 0) {
      startNewConvoWithAccatment(id);
    } else {
      sendMessageWithAttachment(id);
    }
  }

  void fetchStatuses(BuildContext context) {
    if (statuses.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  backgroundCheck() {
    if (statuses.length == 0) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        backgroundCheck();
      });
      return;
    }

    CurrentInstance.instance.currentClient
        .run(
            path: StatusRequest.Status.getStatusContext(statuses.first.id),
            method: HTTPMethod.GET)
        .then((response) {
      Context context = contextFromJson(response.body);

      List<Status> templist = [];
      templist.addAll(context.ancestors);
      templist.add(widget.conversation.lastStatus);
      templist.addAll(context.descendants);
      if (statuses.length < templist.length) {
        statuses.clear();
        statuses.addAll(templist.reversed);
        if (mounted) setState(() {});
      }
      Future.delayed(const Duration(milliseconds: 5000), () {
        backgroundCheck();
      });
    }).catchError((error) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        backgroundCheck();
      });
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  void _onRefresh() async {
    if (widget.conversation == null) {
      _refreshController.refreshCompleted();
      return;
    }
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: StatusRequest.Status.getStatusContext(
                widget.conversation.lastStatus.id),
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
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          Status status = statuses[index];
          return ChatCell(status);
        },
      ),
    );
  }

  startNewConvoWithAccatment(String id) {
    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "@${widget.account.acct}",
      "visibility": "direct",
      "media_ids": [id]
    };
    print("Starting convo!");
    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
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

  startNewConvo() {
    if (txtController.text.length == 0) {
      print("too short");
      return;
    }

    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "@${widget.account.acct} ${txtController.text}",
      "visibility": "direct",
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

  sendMessageWithAttachment(String id) {
    Account atAccount = statuses.first.account;
    if (widget.conversation.accounts.length > 0) {
      atAccount = getOtherAccount(widget.conversation.accounts);
    }

    print("sending attachment! $id");
    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "@${atAccount.acct}",
      "visibility": "direct",
      "in_reply_to_id": statuses.first.id,
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
    Account atAccount = statuses.first.account;
    if (widget.conversation.accounts.length > 0) {
      atAccount = getOtherAccount(widget.conversation.accounts);
    }
    
    if (txtController.text.length == 0) {
      print("too short");
      return;
    }

    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "@${atAccount.acct} ${txtController.text}",
      "visibility": "direct",
      "in_reply_to_id": statuses.first.id
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

  Account getOtherAccount(List<Account> accounts) {
    for (var i = 0; i < accounts.length; i++) {
      var currentAccount = CurrentInstance.instance.currentAccount;
      var account = accounts[i];
      if (currentAccount != account) {
        return account;
      }
    }

    return accounts.first;
  }

  postMediaId(String id) {}
}

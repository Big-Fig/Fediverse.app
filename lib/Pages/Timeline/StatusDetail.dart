import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/TimelineCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/Models/Context.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/MentionPage.dart';
import 'package:fedi/app/dm/media/dm_media_capture_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/visibility.dart' as Vis;
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatusDetail extends StatefulWidget {
  final IPleromaStatus status;

  StatusDetail({this.status});

  @override
  State<StatefulWidget> createState() {
    return _StatusDetail();
  }
}

class _StatusDetail extends State<StatusDetail> {
  List<String> mentionedAccts = [];

  double mentionHeight = 0.0;

  var txtController = TextEditingController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
  ItemPositionsListener.create();
  List<IPleromaStatus> statuses = <IPleromaStatus>[];

  void initState() {
    super.initState();

    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => refreshEverything());
    }
  }

  refreshEverything() {
    if (statuses.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  viewAccount(IPleromaAccount account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  accountMentioned(IPleromaAccount acct) {
    print("$acct");
    if (txtController.text.length > 0) {
      String lastChar =
      txtController.text.substring(txtController.text.length - 1);
      if (lastChar == "@") {
        txtController.text =
            txtController.text.substring(0, txtController.text.length - 1);
      }
    }
    setState(() {
      if (!mentionedAccts.contains(acct.acct)) {
        mentionedAccts.add(acct.acct);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String mentionDesc = "1 Mention";
    if (mentionedAccts.length > 1) {
      mentionDesc = "${mentionedAccts.length} Mentions";
    }
    if (mentionedAccts.length == 0) {
      mentionHeight = 0;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)
              .tr("timeline.status.details.title")),
          actions: <Widget>[],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: getMessageList(),
            ),
            Vis.Visibility(
              visible: mentionedAccts.length > 0 ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: OutlineButton(
                        color: Colors.blue,
                        child: Text(
                          '@ $mentionDesc',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          if (mentionHeight == 0) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              mentionHeight = 130;
                            });
                          } else {
                            setState(() {
                              mentionHeight = 0;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 275),
              height: mentionHeight,
              curve: Curves.bounceInOut,
              child: ListView.builder(
                itemCount: mentionedAccts.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == mentionedAccts.length) {
                    return Card(
                      child: FlatButton(
                        child: Text(
                          " + @ ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MentionPage(accountMentioned)));
                        },
                      ),
                    );
                  } else {
                    String acct = mentionedAccts[index];
                    return Container(
                      height: 55,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                mentionedAccts.removeAt(index);
                              });
                            },
                          ),
                          Text("@$acct"),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 80),
              child: Padding(
                padding: EdgeInsets.all(10),
                // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: txtController,
                  maxLines: null,
                  onTap: () {
                    if (mentionHeight != 0) {
                      setState(() {
                        mentionHeight = 0;
                      });
                    }
                  },
                  onChanged: (value) {
                    if (mentionHeight != 0) {
                      setState(() {
                        mentionHeight = 0;
                      });
                    }
                    String lastChar = value.substring(value.length - 1);
                    if (lastChar == "@") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MentionPage(accountMentioned)));
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: AppLocalizations.of(context)
                        .tr("timeline.status.details.action.reply"),
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
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMediaWidget(
                                    mediaUploaded: mediaUploaded,
                                    selectedTab: FilePickerTab
                                        .captureVideo,)));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMediaWidget(
                                    mediaUploaded: mediaUploaded,
                                    selectedTab: FilePickerTab
                                        .captureImage,)));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CaptureDMMediaWidget(
                                    mediaUploaded: mediaUploaded,
                                    selectedTab: FilePickerTab
                                        .gallery,)));
                    },
                  ),
                  IconButton(
                    icon: Text(
                      "@",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MentionPage(accountMentioned)));
                    },
                  ),
                  Spacer(),
                  OutlineButton(
                    child: Text(
                      AppLocalizations.of(context)
                          .tr("timeline.status.details.action.send"),
                      style: TextStyle(color: Colors.blue),
                    ),
                    color: Colors.blue,
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

  mediaUploaded(BuildContext context, String id) {
    print("MY ID!!! $id");


    // should be refactored
    Navigator.pop(context);
    Navigator.pop(context);
    // below strings throw strange exceptions

//    Navigator.of(context)
//        .popUntil((route) => route.settings.name == "/StatusDetail");

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
      Context context = Context.fromJsonString(response.body);
      statuses.clear();
      List<IPleromaStatus> templist = [];

      templist.addAll(context.ancestors);
      templist.add(widget.status);
      templist.addAll(context.descendants);

      if (widget.status.account != null &&
          widget.status.account.acct !=
              CurrentInstance.instance.currentAccount.acct) {
        mentionedAccts.add(widget.status.account.acct);
        //txtController.text =
        //"${txtController.text} @${widget.status.account.acct}";
      }
      for (int i = 0; i < widget.status.mentions.length; i++) {
        IPleromaMention mention = widget.status.mentions[i];
        if (!mentionedAccts.contains(mention.acct) &&
            mention.acct != CurrentInstance.instance.currentAccount.acct) {
          mentionedAccts.add(mention.acct);
        }
        // txtController.text = "${txtController.text} @${mention.acct}";
      }
      statuses.addAll(templist);
      if (mounted)
        setState(() {
          _refreshController.refreshCompleted();
          itemScrollController.jumpTo(index: context.ancestors.length);
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
              AppLocalizations.of(context)
                  .tr("timeline.status.details.update.unable_to_fetch"),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionListener,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          if (statuses.length == 0) {
            return Container();
          }
          IPleromaStatus status = statuses[index];
          return TimelineCell(
            status,
            viewAccount: viewAccount,
            showCommentBtn: false,
          );
        },
      ),
    );
  }

  sendMessageWithAttachment(String id) {
    print("sending attachment! $id");
    var statusPath = StatusRequest.Status.postNewStatus;

    String mentionListString = "";
    for (int i = 0; i < mentionedAccts.length; i++) {
      String acct = mentionedAccts[i];
      mentionListString = "$mentionListString @$acct";
    }

    String status = "$mentionListString ${txtController.text}";

    Map<String, dynamic> params = {
      "status": "$status",
      "to": mentionedAccts,
      "in_reply_to_id": widget.status.id,
      "media_ids": [id]
    };

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      txtController.clear();
      var status = PleromaStatus.fromJson(jsonDecode(statusResponse.body));
      statuses.add(status);
      setState(() {});
    }).catchError((e) {
      print(e);
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("timeline.status.details.update.error.alert.title"),
          AppLocalizations.of(context)
              .tr("timeline.status.details.update.error.alert.content"),
              () => {});
      alert.showAlert();
    });
  }

  sendMessage() {
    if (txtController.text.length == 0) {
      print("too short");
      return;
    }

    String mentionListString = "";
    for (int i = 0; i < mentionedAccts.length; i++) {
      String acct = mentionedAccts[i];
      mentionListString = "$mentionListString @$acct";
    }

    String status = "$mentionListString ${txtController.text}";

    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": "$status",
      "to": mentionedAccts,
      "in_reply_to_id": widget.status.id
    };

    print(params);
    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      txtController.clear();
      var status = PleromaStatus.fromJson(jsonDecode(statusResponse.body));
      statuses.add(status);
      setState(() {});
    }).catchError((e) {
      print(e);
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("timeline.status.details.update.error.alert.title"),
          AppLocalizations.of(context)
              .tr("timeline.status.details.update.error.alert.content"),
              () => {});
      alert.showAlert();
    });
  }

  postMediaId(String id) {}
}

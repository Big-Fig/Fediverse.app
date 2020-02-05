import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fedi/Pages/Messages/ChatPage.dart';
import 'package:fedi/Pages/Messages/MessagesCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Timeline.dart';
import 'package:fedi/Pleroma/Models/Conversation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagesPage extends StatefulWidget {
  final List<Conversation> conversations = [];
  MessagesPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {

    return MessagesPageState();
  }
}

class MessagesPageState extends State<MessagesPage> {
  void initState() {
    super.initState();

    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses());
    }
  }

  void fetchStatuses() {
    _refreshController.requestRefresh();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  refreshMessagesList() {
    _onRefresh();
  }

  void _onRefresh() async {
    print("ONREFRESH");
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

  cellTapped(Conversation conversation) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            conversation: conversation,
            refreshMasterList: refreshMessagesList,
            refreshMesagePage: refreshMessagesList,
          ),
          settings: RouteSettings(name: "/ChatPage"),
        ));
  }

  @override
  Widget build(BuildContext context) {
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
          Text( AppLocalizations.of(context)
              .tr("messages.page.update.up_to_date"),
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
                .tr("messages.page.update.unable_to_fetch"),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text( AppLocalizations.of(context)
                .tr("messages.page.update.no_more_messages"));
          } else if (mode == LoadStatus.loading) {
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text( AppLocalizations.of(context)
                .tr("messages.page.update.failed"));
          } else {
            body = Text( AppLocalizations.of(context)
                .tr("messages.page.update.no_more_data"));
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

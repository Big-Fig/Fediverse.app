import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:phaze/Views/VideoPlayer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_alert/flutter_alert.dart';

class TimelineCell extends StatefulWidget {
  final Status status;
  final Function(Account) viewAccount;
  final Function(Status) viewStatusContext;
  final GlobalKey selectedStatusKey;

  TimelineCell(this.status,
      {this.viewAccount, this.viewStatusContext, this.selectedStatusKey});

  @override
  State<StatefulWidget> createState() {
    return _TimelineCell();
  }
}

class _TimelineCell extends State<TimelineCell> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return GestureDetector(
      onTap: () {
        print("view status");
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("view account");
                      if (widget.viewAccount != null) {
                        widget.viewAccount(widget.status.account);
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(20.0),
                          child: FadeInImage.assetNetwork(
                            placeholder:
                                'assets/images/double_ring_loading_io.gif',
                            image: widget.status.account.avatar,
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: getUserName(widget.status),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    tooltip: 'More',
                    onPressed: () {
                      showMoreOptions(context);
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("view account");
                if (widget.viewAccount != null) {
                  widget.viewStatusContext(widget.status);
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8.0,
                  ),
                  if (widget.status.mediaAttachments.length > 0)
                    Container(
                      height: targetWidth,
                      width: targetWidth,
                      color: Colors.white,
                      child: getMeidaWidget(widget.status),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 0, top: 8, left: 12.0, right: 12),
                    child: Html(
                      data: widget.status.content,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: widget.status.favourited
                              ? Colors.green
                              : Colors.grey,
                          icon: Icon(Icons.thumb_up),
                          tooltip: 'Like',
                          onPressed: () {
                            like();
                          },
                        ),
                        if (widget.status.favouritesCount != 0)
                          Text(widget.status.favouritesCount.toString()),
                        IconButton(
                          color: Colors.grey,
                          icon: Icon(Icons.add_comment),
                          tooltip: 'comment',
                          onPressed: () {
                            widget.viewStatusContext(widget.status);
                          },
                        ),
                        IconButton(
                          color: widget.status.reblogged
                              ? Colors.green
                              : Colors.grey,
                          icon: Icon(Icons.cached),
                          tooltip: 'repost',
                          onPressed: () {
                            repost();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  like() {
    String path = StatusRequest.Status.favouriteStatus(widget.status.id);
    if (widget.status.favourited == true) {
      path = StatusRequest.Status.unfavouriteStatus(widget.status.id);
      widget.status.favouritesCount = widget.status.favouritesCount - 1;
    } else {
      widget.status.favouritesCount = widget.status.favouritesCount + 1;
    }
    widget.status.favourited = !widget.status.favourited;
    
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.POST)
        .then((response) {
      print(response.body);
    }).catchError((error) {
      print(error);
    });
    if (mounted) setState(() {});
  }

  repost() {
    String path = StatusRequest.Status.reblogStatus(widget.status.id);
    if (widget.status.favourited == true) {
      path = StatusRequest.Status.reblogStatus(widget.status.id);
      widget.status.reblogsCount = widget.status.reblogsCount - 1;
    } else {
       widget.status.reblogsCount = widget.status.reblogsCount + 1;
    }
    widget.status.reblogged = !widget.status.favourited;
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.POST)
        .then((response) {
      print(response.body);
    }).catchError((error) {
      print(error);
    });
    if (mounted) setState(() {});
  }

  showMoreOptions(BuildContext context) {
    showAlert(
      context: context,
      title: "More actions for:",
      body: "${widget.status.account.acct}",
      actions: [
        AlertAction(
          text: "Mute",
          onPressed: () {
            CurrentInstance.instance.currentClient
                .run(
                    path: Accounts.muteAccount(widget.status.account.id),
                    method: HTTPMethod.POST)
                .then((response) {
              print(response.body);
            }).catchError((error) {
              print(error);
            });
          },
        ),
        AlertAction(
          text: "Block",
          onPressed: () {
            CurrentInstance.instance.currentClient
                .run(
                    path: Accounts.blockAccount(widget.status.account.id),
                    method: HTTPMethod.POST)
                .then((response) {
              print(response.body);
            }).catchError((error) {
              print(error);
            });
          },
        ),
        AlertAction(
          text: "Report",
          onPressed: () {
            var params = {"account_id": widget.status.account.id};
            CurrentInstance.instance.currentClient
                .run(
                    path: Accounts.reportAccount(),
                    params: params,
                    method: HTTPMethod.POST)
                .then((response) {
              print(response.body);
            }).catchError((error) {
              print(error);
            });
          },
        ),
      ],
      cancelable: true,
    );
  }

  Widget getMeidaWidget(Status status) {
    List<Widget> items = <Widget>[];

    for (var i = 0; i < status.mediaAttachments.length; i++) {
      MediaAttachment attachment = status.mediaAttachments[i];
      if (attachment.type == "image") {
        var image = FadeInImage.assetNetwork(
          placeholder: 'assets/images/double_ring_loading_io.gif',
          image: attachment.url,
        );
        items.add(image);
      } else if (attachment.type == "video") {
        items.add(
          CellVideoPlayer(
            attachment.url,
          ),
        );
      } else {
        items.add(
          WebView(initialUrl: attachment.url),
        );
      }
    }

    return Carousel(
      overlayShadowColors: Colors.transparent,
      overlayShadowSize: 0.0,
      images: items,
      dotIncreasedColor: Colors.green,
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.green.withOpacity(0.5),
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.transparent,
      borderRadius: true,
      autoplay: false,
    );
  }

  List<Widget> getUserName(Status status) {
    var username = status.account.displayName;
    var emojis = status.account.emojis;
    emojis.addAll(status.emojis);
    List<Widget> usernameWidget = [];
    var emojiUsername = username.split(":");

    if (emojiUsername.length == 0) {
      usernameWidget.add(Text(
        username,
        style: TextStyle(fontSize: 17.0),
      ));
      return usernameWidget;
    }

    for (var i = 0; i < emojiUsername.length; i++) {
      var emojiOrText = emojiUsername[i];
      var foundEmoji = false;
      for (var j = 0; j < emojis.length; j++) {
        var emoji = emojis[j];
        String shortcode = emoji["shortcode"];
        String url = emoji["url"];
        if (shortcode == emojiOrText) {
          var image = Image.network(
            url,
            height: 15.0,
            width: 15.0,
          );
          usernameWidget.add(image);
          foundEmoji = true;
        }
      }

      if (foundEmoji == false) {
        var text = Text(
          emojiOrText,
          style: TextStyle(fontSize: 17.0),
        );
        usernameWidget.add(text);
      }
    }

    return usernameWidget;
  }
}

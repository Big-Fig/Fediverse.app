import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Notification.dart' as NotificationObject;
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:phaze/Views/VideoPlayer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationCell extends StatefulWidget {
  final NotificationObject.Notification notification;

  final Function(Account) viewAccount;
  final Function(Status) viewStatusContext;

  NotificationCell(this.notification,
      {this.viewAccount, this.viewStatusContext});

  @override
  State<StatefulWidget> createState() {
    return _NotificationCell();
  }
}

double deviceWidth;
double targetWidth;

class _NotificationCell extends State<NotificationCell> {
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("view account");
                    if (widget.viewAccount != null) {
                      widget.viewAccount(widget.notification.account);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child:
                   Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(20.0),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/double_ring_loading_io.gif',
                          image: widget.notification.account.avatar,
                          height: 40.0,
                          width: 40.0,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(widget.notification.account.acct)
                    ],
                  ),
                ),
                Spacer(),
                // NO MORE BUTTON
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),
                getActionWiget(widget.notification.type),
              ],
            ),
            GestureDetector(onTap: (){
               if (widget.notification.status != null){
                 widget.viewStatusContext(widget.notification.status);
               }
            },
            child: getStatus(),
            )
           
          ],
        ),
      ),
    );
  }

  Widget getStatus() {
    if (widget.notification.status != null) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          if (widget.notification.status.mediaAttachments.length > 0)
            Container(
              height: targetWidth,
              width: targetWidth,
              color: Colors.white,
              child: getMeidaWidget(widget.notification.status),
            ),
          Padding(
            padding: EdgeInsets.only(bottom: 0, top: 8, left: 12.0, right: 12),
            child: Html(
              data: widget.notification.status.content,
            ),
          ),
        ],
      );
    }
    return Container();
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

  Widget getActionWiget(String type) {
    print("type $type");
    if (type == "follow") {
      return Row(
        children: <Widget>[
          Icon(Icons.person_add),
          SizedBox(
            width: 8,
          ),
          Text("Followed You!")
        ],
      );
    } else if (type == "mention") {
      return Row(
        children: <Widget>[
          Icon(Icons.reply),
          SizedBox(
            width: 8,
          ),
          Text("Mentioned You")
        ],
      );
    } else if (type == "reblog") {
      return Row(
        children: <Widget>[
          Icon(Icons.cached),
          SizedBox(
            width: 8,
          ),
          Text("Reposted Your Status")
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Icon(Icons.thumb_up),
          SizedBox(
            width: 8,
          ),
          Text("Liked Your Status")
        ],
      );
    }
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

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:phaze/Views/VideoPlayer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:html/dom.dart' as dom;

class ChatCell extends StatefulWidget {
  final Account otherAccount;
  final Status status;
  final String timePosted;
  ChatCell(this.status, this.otherAccount, this.timePosted);

  @override
  State<StatefulWidget> createState() {
    return _ChatCell();
  }
}

class _ChatCell extends State<ChatCell> {
  double deviceWidth;
  double targetWidth;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    print("${widget.status.content}");
    if (widget.status.account.acct == widget.otherAccount.acct) {
      return getOtherAccountCell();
    } else {
      return getMyCell();
    }
  }

  Widget getMyCell() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            if (widget.timePosted != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.timePosted,
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ClipRRect(
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Container(
                    color: Color(0xffececec),
                    constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            if (widget.status.mediaAttachments.length > 0)
                              Container(
                                height: targetWidth,
                                width: targetWidth,
                                color: Colors.white,
                                child: getMeidaWidget(widget.status),
                              ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 0, top: 0, left: 0, right: 0),
                              child: Html(
                                data: removeAccountFromHTML(
                                    widget.status.content,
                                    widget.status.account.url),
                                customTextStyle:
                                    (dom.Node node, TextStyle baseStyle) {
                                  if (node is dom.Element) {
                                    switch (node.localName) {
                                      case "p":
                                        return baseStyle
                                            .merge(TextStyle(fontSize: 18));
                                    }
                                  }
                                  return baseStyle
                                      .merge(TextStyle(fontSize: 18));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget getOtherAccountCell() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          if (widget.timePosted != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.timePosted,
                ),
              ],
            ),
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(15.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/double_ring_loading_io.gif',
                  image: widget.status.account.avatar,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxWidth: deviceWidth * 0.80),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                if (widget.status.mediaAttachments.length > 0)
                                  Container(
                                    height: targetWidth,
                                    width: targetWidth,
                                    color: Colors.white,
                                    child: getMeidaWidget(widget.status),
                                  ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 0, top: 0, left: 0, right: 0),
                                  child: Html(
                                    data: removeAccountFromHTML(
                                        widget.status.content,
                                        widget.status.account.url),
                                    customTextStyle:
                                        (dom.Node node, TextStyle baseStyle) {
                                      if (node is dom.Element) {
                                        switch (node.localName) {
                                          case "p":
                                            return baseStyle
                                                .merge(TextStyle(fontSize: 18));
                                        }
                                      }
                                      return baseStyle
                                          .merge(TextStyle(fontSize: 18));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: widget.status.favourited
                          ? Colors.redAccent
                          : Colors.grey,
                      tooltip: 'More',
                      onPressed: () {
                        like();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    // Row(
    //   children: getUserName(widget.status),
    // ),
    // Spacer(),
    // IconButton(
    //   icon: Icon(Icons.favorite_border),
    //   color:
    //       widget.status.favourited ? Colors.redAccent : Colors.grey,
    //   tooltip: 'More',
    //   onPressed: () {
    //     like();
    //   },
    // ),R
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

  String removeAccountFromHTML(String html, String accountURL) {
    print("ACCOUNT URL $accountURL");
    String newHTML =
        html.replaceAll(RegExp('<\s*a[^>]*>(?=@).*<\s*\/\s*a>'), "");
    print(newHTML);
    return newHTML;
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

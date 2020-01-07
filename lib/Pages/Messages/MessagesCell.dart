import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Conversation.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fedi/Views/VideoPlayer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MessagesCell extends StatefulWidget {
  final Conversation conversation;
  final Function(Conversation conversation) cellTapped;
  MessagesCell({this.conversation, this.cellTapped});

  @override
  State<StatefulWidget> createState() {
    return _MessagesCell();
  }
}

class _MessagesCell extends State<MessagesCell> {
  Account messageUser;

  @override
  void initState() {
    super.initState();

    if (widget.conversation.accounts.length > 0) {
      messageUser = getOtherAccount(widget.conversation.accounts);
    } else {
      messageUser = widget.conversation.lastStatus.account;
    }
  }

  cellTapped() {
    widget.cellTapped(widget.conversation);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cellTapped,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 85,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(25.0),
                      child: CachedNetworkImage(
                        imageUrl: messageUser.avatar,
                        placeholder: (context, url) => Center(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  messageUser.username,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Text(
                              getStatusText(widget.conversation.lastStatus),
                              maxLines: 2,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    // Row(
                    //   children: getUserName(widget.conversation.lastStatus),
                    // ),
                    // Spacer(),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      tooltip: 'More',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getStatusText(Status status) {
    var document = parse(status.content);

    String parsedString = parse(document.body.text).documentElement.text;
    parsedString = parsedString.replaceAll(RegExp("(\w*@\w+)"), "");
    return parsedString;
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
          var image = CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 15,
            height: 15,
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
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';

class UserCell extends StatefulWidget {
  final Account account;
  final Function(Account account) cellTapped;
  UserCell({this.account, this.cellTapped});

  @override
  State<StatefulWidget> createState() {
    return _UserCell();
  }
}

class _UserCell extends State<UserCell> {
  @override
  void initState() {
    super.initState();
  }

  cellTapped() {
    print("cell tapped");
    print("${widget.account.acct}");
    widget.cellTapped(widget.account);

  }

  String getUserDomainName(Account account) {
    var domain = "${account.url}".replaceAll("https://", "@");
    var url = domain.split("/");
    print(url);
    return "${account.acct}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cellTapped,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(25.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.account.avatar,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(getUserDomainName(widget.account)),
                    ),
                    Container(
                      width: 10,
                    ),
                    Icon(Icons.chevron_right),
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
        String shortcode = emoji.shortcode;
        String url = emoji.url;
        if (shortcode == emojiOrText) {
          var image = CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Image(
              image: imageProvider,
            ),
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

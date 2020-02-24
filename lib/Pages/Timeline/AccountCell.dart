import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:flutter/material.dart';

class AccountCell extends StatelessWidget {
  final Account account;
  final Function(Account) viewAccount;

  AccountCell(this.viewAccount, this.account);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (viewAccount != null) {
                      viewAccount(account);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          imageUrl: account.avatar,
                          placeholder: (context, url) => Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(account.acct)
                    ],
                  ),
                ),
                Spacer(),
                // NO MORE BUTTON
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getActionWiget(BuildContext context, String type) {
    print("type $type");
    if (type == "follow") {
      return Row(
        children: <Widget>[
          Icon(Icons.person_add),
          SizedBox(
            width: 8,
          ),
          Text(AppLocalizations.of(context)
              .tr("timeline.follow.followed_you"))
        ],
      );
    } else if (type == "mention") {
      return Row(
        children: <Widget>[
          Image(
                                height: 15,
                                width: 15,
                                color: Colors.grey,
                                image: AssetImage("assets/images/comment.png"),
                              ),
          SizedBox(
            width: 8,
          ),
          Text(AppLocalizations.of(context)
              .tr("timeline.mention.mentioned_you"))
        ],
      );
    } else if (type == "reblog") {
      return Row(
        children: <Widget>[
          Image(
                                  height: 20,
                                  width: 20,
                                  color: Colors.grey,
                                  image: AssetImage(
                                      "assets/images/repost.png"),
                                ),
          SizedBox(
            width: 8,
          ),
          Text(AppLocalizations.of(context)
              .tr("timeline.reblog.reposted_your_status"))
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Icon(Icons.thumb_up),
          SizedBox(
            width: 8,
          ),
          Text(AppLocalizations.of(context)
              .tr("timeline.like.liked_your_status"))
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
        String shortcode = emoji.shortcode;
        String url = emoji.url;
        if (shortcode == emojiOrText) {
          var image = CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
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
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/Pages/Web/InAppWebPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fedi/Pages/Messages/ChatPage.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

import '../../Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Field.dart';

class ProfileHeader extends StatefulWidget {
  final Account profileAccount;

  final Function(String) accountAction;
  final Function editAccount;

  ProfileHeader({this.profileAccount, this.editAccount, this.accountAction});

  @override
  State<StatefulWidget> createState() {
    return _ProfileHeader();
  }
}

class _ProfileHeader extends State<ProfileHeader> {
  Relationship relationship;
  bool firstBuildRefresh;

  @override
  void initState() {
    super.initState();
    firstBuildRefresh = true;
    if (widget.editAccount == null) {
      String path = Accounts.getRelationshipById(widget.profileAccount.id);
      CurrentInstance.instance.currentClient
          .run(path: path, method: HTTPMethod.GET)
          .then((response) {
        Relationship relationship = Relationship.listFromJsonString(response.body).first;
        if (mounted)
          setState(() {
            this.relationship = relationship;
          });
      }).catchError((onError) {
        print("$onError");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.none,
                  child: CachedNetworkImage(
                    imageUrl: widget.profileAccount.header,
                    placeholder: (context, url) => Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.profileAccount.avatar,
                              placeholder: (context, url) => Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                          Container(
                            color: Colors.black38,
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "Statuses\n${widget.profileAccount.statusesCount}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black38,
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "Following\n${widget.profileAccount.followingCount}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black38,
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "Followers\n${widget.profileAccount.followersCount}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue[100],
            child: getButtons(context),
          ),
          Container(
            color: Colors.blue[100],
            child: Row(
              children: <Widget>[
                Html(
                  padding: EdgeInsets.all(10),
                  data: widget.profileAccount.note,
                  customTextStyle: (dom.Node node, TextStyle baseStyle) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "p":
                          return baseStyle.merge(TextStyle(fontSize: 18));
                      }
                    }
                    return baseStyle.merge(TextStyle(fontSize: 18));
                  },
                )
              ],
            ),
          ),
          getLinks(context)
        ],
      ),
    );
  }

  Widget getLinks(BuildContext context) {
    return Column(
      children: <Widget>[
        if (widget.profileAccount.fields.length > 0)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (widget.profileAccount.fields.length > 0)
                getLinkButton(widget.profileAccount.fields[0]),
              if (widget.profileAccount.fields.length > 1)
                getLinkButton(widget.profileAccount.fields[1]),
            ],
          ),
        if (widget.profileAccount.fields.length > 2)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (widget.profileAccount.fields.length > 2)
                getLinkButton(widget.profileAccount.fields[2]),
              if (widget.profileAccount.fields.length > 3)
                getLinkButton(widget.profileAccount.fields[3]),
            ],
          ),
      ],
    );
  }

  String getURL(String value) {
    String string = value.replaceAll(RegExp("</a>"), "");
    return string.replaceAll(RegExp("<a[^>]*>"), "");
  }

  Widget getLinkButton(Field field) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: RaisedButton(
          child: Text(field.name),
          onPressed: () {
            String link = getURL(field.value);
            print(link);
            canLaunch(link).then((result) {
              launch(link);
            });
          },
        ),
      ),
    );
  }

  Widget getButtons(BuildContext context) {
    if (widget.editAccount == null) {
      if (relationship == null) {
        return Container(
          child: Center(
            child: Text("Loading..."),
          ),
        );
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            child: Row(
              children: <Widget>[
                Text(relationship.following ? "Unfollow" : "Follow"),
              ],
            ),
            onPressed: () {
              String path = Accounts.followAccount(widget.profileAccount.id);

              if (relationship.following) {
                path = Accounts.unfollowAccount(widget.profileAccount.id);
                relationship.following = true;
              }
              CurrentInstance.instance.currentClient
                  .run(path: path, method: HTTPMethod.POST)
                  .then((response) {});
              relationship.following = true;
              if (mounted) setState(() {});
            },
          ),
          OutlineButton(
            child: Row(
              children: <Widget>[Text("Message")],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      account: widget.profileAccount,
                    ),
                  ));
            },
          ),
          OutlineButton(
            child: Row(
              children: <Widget>[
                Text("More"),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                )
              ],
            ),
            onPressed: () {
              showMoreOptions(context);
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  showMoreOptions(BuildContext context) {
    showAlert(
      context: context,
      title: "More actions for:",
      body: "${widget.profileAccount.acct}",
      actions: [
        AlertAction(
          text: relationship.muting ? "Unmute" : "Mute",
          onPressed: () {
            String path = Accounts.muteAccount(widget.profileAccount.id);
            if (relationship.muting) {
              path = Accounts.unmuteAccount(widget.profileAccount.id);
            }
            relationship.muting = !relationship.muting;
            CurrentInstance.instance.currentClient
                .run(path: path, method: HTTPMethod.POST)
                .then((response) {
              print(response.body);
            }).catchError((error) {
              print(error);
            });
          },
        ),
        AlertAction(
          text: relationship.blocking ? "Unblock" : "Block",
          onPressed: () {
            String path = Accounts.blockAccount(widget.profileAccount.id);
            if (relationship.blocking) {
              path = Accounts.unblockAccount(widget.profileAccount.id);
            }
            relationship.blocking = !relationship.blocking;
            CurrentInstance.instance.currentClient
                .run(path: path, method: HTTPMethod.POST)
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
            var params = {"account_id": widget.profileAccount.id};
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
}

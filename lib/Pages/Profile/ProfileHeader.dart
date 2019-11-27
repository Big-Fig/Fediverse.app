import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pages/Messages/ChatPage.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Relationship.dart';
import 'package:html/dom.dart' as dom;

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

  @override
  void initState() {
    super.initState();

    if (widget.editAccount == null) {
      String path = Accounts.getRelationshipById(widget.profileAccount.id);
      CurrentInstance.instance.currentClient
          .run(path: path, method: HTTPMethod.GET)
          .then((response) {
        Relationship relationship = relationshipFromJson(response.body).first;
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
                  child: FadeInImage.assetNetwork(
                    image: widget.profileAccount.header,
                    placeholder: "assets/images/double_ring_loading_io.gif",
                  ),
                  fit: BoxFit.none,
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
                            child: FadeInImage.assetNetwork(
                              placeholder:
                                  'assets/images/double_ring_loading_io.gif',
                              image: widget.profileAccount.avatar,
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
          Row(
            children: <Widget>[
              Html(
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
          getButtons(context),
        ],
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
                  .run(path: path, method: HTTPMethod.GET)
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

      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: <Widget>[
      //     Expanded(
      //       child: Padding(
      //         padding: EdgeInsets.all(10),
      //         child: OutlineButton(
      //           child: Row(
      //             children: <Widget>[
      //               Spacer(),
      //               Text("Edit Profile"),
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 10),
      //               ),
      //               Icon(
      //                 Icons.edit,
      //                 size: 15,
      //               ),
      //               Spacer(),
      //             ],
      //           ),
      //           onPressed: () {
      //             editAccount();

      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // );
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

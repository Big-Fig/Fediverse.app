import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Statuses/ImageViewPage.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart'
    as AccountRequests;
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Views/VideoPlayer.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/dom.dart' as dom;
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class StatusListItemSimpleWidget extends StatusWidget {
  final Function(IPleromaAccount) viewAccount;
  final Function(IPleromaStatus) viewStatusContext;
  final bool showCommentBtn;

  StatusListItemSimpleWidget(
      {@required IStatus initialStatusData,
      this.viewAccount,
      this.viewStatusContext,
      this.showCommentBtn})
      : super(initialStatusData: initialStatusData);

  @override
  Widget buildStatusWidget(BuildContext context, IStatus status) {
    var replyAccount = getReply(status);
    var deviceWidth = MediaQuery.of(context).size.width;

    var targetHeight = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    status = status.reblog != null ? status.reblog : status;

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            if (replyAccount != null)
              GestureDetector(
                onTap: () {
                  // todo: fix
//                  if (viewAccount != null) {
//                    viewAccount(mapLocalAccountToRemoteAccount(localAccount));
//                  }
                },
                behavior: HitTestBehavior.translucent,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.reply),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .tr("timeline.status.cell.reply_to"),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
// todo: fix
//                      ClipRRect(
//                        borderRadius: new BorderRadius.circular(12.0),
//                        child: CachedNetworkImage(
//                          imageUrl: replyAccount.avatar,
//                          placeholder: (context, url) =>
//                              CircularProgressIndicator(),
//                          errorWidget: (context, url, error) =>
//                              Icon(Icons.error),
//                          height: 24,
//                          width: 24,
//                        ),
//                      ),
                      SizedBox(
                        width: 8,
                      ),
// todo: fix
//                      Text(
//                        replyAccount.acct,
//                        style: TextStyle(fontSize: 12),
//                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),

            // reposted status
            if (status.reblog != null)
              GestureDetector(
                // todo: fix
//                onTap: () {
//                  print("view account");
//                  if (viewAccount != null) {
//                    viewAccount(status.account);
//                  }
//                },
                behavior: HitTestBehavior.translucent,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          imageUrl: status.account.avatar,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        status.account.acct,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.cached),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .tr("timeline.status.cell.repeated"),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    // todo: fix
//                    onTap: () {
//                      print("view account");
//                      if (viewAccount != null) {
//                        viewAccount(status.account);
//                      }
//                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: status.account.avatar,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start, // todo: fix
                              children: getUserName(
                                  mapLocalStatusToRemoteStatus(status)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("${status.account.acct}")
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 19),
                        child: Text(
                          timeago.format(status.createdAt, locale: 'en_short'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                print("view status context");
                if (viewStatusContext != null) {
                  // todo: fix
                  viewStatusContext(mapLocalStatusToRemoteStatus(status));
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
                    child: Html(
                      onImageTap: (String source) {
                        print("source $source");
                      },
                      customTextStyle: (dom.Node node, TextStyle baseStyle) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case "p":
                              return baseStyle.merge(TextStyle(fontSize: 18));
                          }
                        }
                        return baseStyle.merge(TextStyle(fontSize: 18));
                      },
                      onImageError: (dynamic exception, StackTrace stackTrace) {
                        print("Image error!!!");
                        print(exception);
                        print(stackTrace);
                      },
                      data: getHTMLWithCustomEmoji(status),
                      onLinkTap: (String link) {
                        for (int i = 0; i < status.mentions.length; i++) {
                          IPleromaMention mention = status.mentions[i];
                          print("MENTIONS: ${mention.url} == $link");
                          if (mention.url == link) {
                            CurrentInstance.instance.currentClient
                                .run(
                                    path: AccountRequests.Accounts.account(
                                        id: mention.id),
                                    method: HTTPMethod.GET)
                                .then((response) {
                              IPleromaAccount account =
                                  PleromaAccount.fromJsonString(response.body);
                              viewAccount(account);
                            }).catchError((error) {
                              print(error.toString());
                            });

                            return;
                          }
                        }
                        print("link $link");
                        canLaunch(link).then((result) {
                          launch(link);
                        });
                      },
                    ),
                  ),
                  if (status.mediaAttachments.length > 0)
                    getMeidaWidget(context, status, deviceWidth, targetHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            if (showCommentBtn == true ||
                                showCommentBtn == null)
                              IconButton(
                                color: Colors.grey,
                                icon: Icon(Icons.mode_comment),
                                tooltip: AppLocalizations.of(context)
                                    .tr("timeline.status.cell.tooltip.comment"),
                                onPressed: () {
                                  // todo: fix
                                  viewStatusContext(
                                      mapLocalStatusToRemoteStatus(status));
                                },
                              ),
                            if (status.repliesCount != 0 &&
                                (showCommentBtn == true ||
                                    showCommentBtn == null))
                              Text(status.repliesCount.toString()),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              color:
                                  status.favourited ? Colors.blue : Colors.grey,
                              icon: Icon(Icons.favorite_border),
                              tooltip: AppLocalizations.of(context)
                                  .tr("timeline.status.cell.tooltip.like"),
                              onPressed: () {
                                like(status);
                              },
                            ),
                            Text(getLikeCounts(status)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              color:
                                  status.reblogged ? Colors.blue : Colors.grey,
                              icon: Icon(Icons.cached),
                              tooltip: AppLocalizations.of(context)
                                  .tr("timeline.status.cell.tooltip.repost"),
                              onPressed: () {
                                repost(status);
                              },
                            ),
                            Text(getRepostCounts(status)),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          tooltip: AppLocalizations.of(context)
                              .tr("timeline.status.cell.tooltip.more"),
                          onPressed: () {
                            showMoreOptions(context, status);
                          },
                        ),
                      ],
                    ),
                  ),
                  if (status.favouritesCount > 0 ||
                      status.reblogsCount > 0 ||
                      status.reblog != null && showCommentBtn != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: <Widget>[
                          if (status.favouritesCount > 0)
                            getFavoritesButton(context, status),
                          if (status.reblogsCount > 0)
                            getRepostsButton(context, status)
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

  Future<IAccount> getReply(IStatus status) {
    return null;
//    if (status.inReplyToAccountId != null && replyAccount == null) {
//      CurrentInstance.instance.currentClient
//          .run(
//          path: Accounts.account(id: status.inReplyToAccountId),
//          method: HTTPMethod.GET)
//          .then((response) {
//        IPleromaAccount account = PleromaAccount.fromJsonString(response.body);
//        setState(() {
//          replyAccount = account;
//        });
//      }).catchError((error) {
//        print(error);
//      });
//    }
  }

  String getLikeCounts(IStatus status) {
    var count = 0;
    count += status.favouritesCount;

    if (status.reblog != null) {
      count += status.reblog.favouritesCount;
    }

    if (count == 0) {
      return "";
    } else {
      return "$count";
    }
  }

  getRepostCounts(IStatus status) {
    var count = 0;
    count += status.reblogsCount;

    if (status.reblog != null) {
      count += status.reblog.reblogsCount;
    }

    if (count == 0) {
      return "";
    } else {
      return "$count";
    }
  }

  Widget getFavoritesButton(BuildContext context, IStatus status) {
    int count = 0;
    if (status.reblog != null) {
      count += status.reblog.favouritesCount ?? 0;
    }
    count += status.favouritesCount ?? 0;

    String favs;
    if (count == 1) {
      favs = AppLocalizations.of(context)
          .tr("timeline.status.cell.favorites.one", args: [count.toString()]);
    } else {
      favs = AppLocalizations.of(context)
          .tr("timeline.status.cell.favorites.many", args: [count.toString()]);
    }
    return FlatButton(
      child: Text(favs),
      onPressed: () {
        // TODO: fix
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => StatusFavoritePage(status)),
//        );
      },
    );
  }

  Widget getRepostsButton(BuildContext context, IStatus status) {
    int count = 0;
    count += status.reblogsCount ?? 0;
    if (status.reblog != null) {
      count += status.reblog.reblogsCount ?? 0;
    }

    String reposts;
    if (count == 1) {
      reposts = AppLocalizations.of(context)
          .tr("timeline.status.cell.reposts.one", args: [count.toString()]);
    } else {
      reposts = AppLocalizations.of(context)
          .tr("timeline.status.cell.reposts.many", args: [count.toString()]);
    }

    return FlatButton(
      child: Text(reposts),
      onPressed: () {
        // todo: fix
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => StatusRepostPage(status)),
//        );
      },
    );
  }

  like(IStatus status) {
    // TODO: fix
//    String path = StatusRequest.Status.favouriteStatus(status.id);
//    if (status.favourited == true) {
//      path = StatusRequest.Status.unfavouriteStatus(status.id);
//      status.favouritesCount = status.favouritesCount - 1;
//    } else {
//      status.favouritesCount = status.favouritesCount + 1;
//    }
//    status.favourited = !status.favourited;
//
//    CurrentInstance.instance.currentClient
//        .run(path: path, method: HTTPMethod.POST)
//        .then((response) {
//      print(response.body);
//    }).catchError((error) {
//      print(error);
//    });
//    if (mounted) setState(() {});
  }

  repost(IStatus status) {
    // TODO: fix
//    String path = StatusRequest.Status.reblogStatus(status.id);
//    if (status.reblogged == true) {
//      path = StatusRequest.Status.unreblogStatus(status.id);
//      status.reblogsCount = status.reblogsCount - 1;
//    } else {
//      status.reblogsCount = status.reblogsCount + 1;
//    }
//    status.reblogged = !status.reblogged;
//    CurrentInstance.instance.currentClient
//        .run(path: path, method: HTTPMethod.POST)
//        .then((response) {
//      print(response.body);
//    }).catchError((error) {
//      print(error);
//    });
//    if (mounted) setState(() {});
  }

  showMoreOptions(BuildContext context, IStatus status) {
    // TODO: fix
//    IPleromaStatus status = status;
//    if (status.reblog != null) {
//      status = status.reblog;
//    }

    showModalBottomSheet(
        builder: (BuildContext context) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)
                          .tr("timeline.status.cell.status_actions.title"),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).tr(
                                    "timeline.status.cell.status_actions.action"
                                    ".copy_status_link"),
                              )
                            ],
                          ),
                          onPressed: () {
                            print(status.uri);
                            Clipboard.setData(ClipboardData(text: status.uri));
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                                msg: AppLocalizations.of(context).tr(
                                    "timeline.status.cell.status_actions.toast"
                                    ".copied"),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr(
                                  "timeline.status.cell.status_actions.action"
                                  ".open_in_browser"))
                            ],
                          ),
                          onPressed: () {
                            canLaunch(status.uri).then((result) {
                              launch(status.uri);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).tr(
                          "timeline.status.cell.status_actions.more_actions_for"),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      "${status.account.acct}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                // public button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr(
                                  "timeline.status.cell.status_actions.action.follow"))
                            ],
                          ),
                          onPressed: () {
                            CurrentInstance.instance.currentClient
                                .run(
                                    path: Accounts.account(
                                        id: status.account.remoteId),
                                    method: HTTPMethod.GET)
                                .then((response) {
                              IPleromaAccount account =
                                  PleromaAccount.fromJsonString(response.body);
                              CurrentInstance.instance.currentClient
                                  .run(
                                      path: Accounts.followAccount(account.id),
                                      method: HTTPMethod.POST)
                                  .then((response) {
                                print("following response");
                                print("following ${response.statusCode}");
                                print(response.body);
                              }).catchError((error) {
                                print(error);
                              });
                            }).catchError((error) {
                              print(error);
                            });

                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // public button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr(
                                  "timeline.status.cell.status_actions.action"
                                  ".mute"))
                            ],
                          ),
                          onPressed: () {
                            CurrentInstance.instance.currentClient
                                .run(
                                    path: Accounts.muteAccount(
                                        status.account.remoteId),
                                    method: HTTPMethod.POST)
                                .then((response) {
                              print(response.body);
                            }).catchError((error) {
                              print(error);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Unlisted
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr(
                                  "timeline.status.cell.status_actions.action"
                                  ".block"))
                            ],
                          ),
                          onPressed: () {
                            CurrentInstance.instance.currentClient
                                .run(
                                    path: Accounts.blockAccount(
                                        status.account.remoteId),
                                    method: HTTPMethod.POST)
                                .then((response) {
                              print(response.body);
                            }).catchError((error) {
                              print(error);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Private
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).tr(
                                  "timeline.status.cell.status_actions.action"
                                  ".report"))
                            ],
                          ),
                          onPressed: () {
                            var params = {
                              "account_id": status.account.remoteId
                            };
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
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
                // Cancel
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).tr(
                                    "timeline.status.cell.status_actions.action"
                                    ".cancel"),
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        context: context);
  }

  Widget getMeidaWidget(BuildContext context, IStatus status,
      double deviceWidth, double targetHeight) {
    List<Widget> items = <Widget>[];

    for (var i = 0; i < status.mediaAttachments.length; i++) {
      PleromaMediaAttachment attachment = status.mediaAttachments[i];
      if (attachment.type == "image") {
        var image = CachedNetworkImage(
          imageUrl: attachment.url,
          placeholder: (context, url) => Center(
            child: Container(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );

        var imageprovider = Image.network(
          attachment.url,
          height: 15.0,
          width: 15.0,
        );
        var container = GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageViewPage(imageprovider.image)),
              );
            },
            child: image);
        items.add(container);
      } else if (attachment.type == "video" || attachment.type == "audio") {
        items.add(
          CellVideoPlayer(
            attachment.url,
          ),
        );
      } else {
        if (status.mediaAttachments.length == 1) {
          return Container();
        }
      }
    }

    return LimitedBox(
      maxWidth: deviceWidth,
      maxHeight: targetHeight,
      child: Carousel(
        animationDuration: Duration(seconds: 0),
        overlayShadowColors: Colors.transparent,
        overlayShadowSize: 0.0,
        images: items,
        dotIncreasedColor: items.length == 1 ? Colors.transparent : Colors.blue,
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: items.length == 1
            ? Colors.transparent
            : Colors.blue.withOpacity(0.5),
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
        borderRadius: true,
        autoplay: false,
      ),
    );
  }

  String getHTMLWithCustomEmoji(IStatus status) {
    List<IPleromaEmoji> customEmoji = status.emojis;
    String html = status.content;
    for (int i = 0; i < customEmoji.length; i++) {
      var emoji = customEmoji[i];
      String shortcode = emoji.shortcode;
      String url = emoji.url;

      html = html.replaceAll(":$shortcode:", '<img src="$url" width="20">');
    }
    html = "<html> <body>$html</body></html>";
    return html;
  }

  List<Widget> getUserName(IPleromaStatus status) {
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
            placeholder: (context, url) => CircularProgressIndicator(),
            height: 15,
            width: 15,
            errorWidget: (context, url, error) => Icon(Icons.error),
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

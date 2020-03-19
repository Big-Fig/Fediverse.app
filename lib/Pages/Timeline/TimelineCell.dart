import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker/emoji_picker.dart' as EmojiWidget;
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Statuses/ImageViewPage.dart';
import 'package:fedi/Pages/Statuses/card_widget.dart';
import 'package:fedi/Pages/Statuses/emoji_reaction_bloc.dart';
import 'package:fedi/Pages/Statuses/emoji_reaction_widget.dart';
import 'package:fedi/Pages/Statuses/emoji_readtion_provider.dart';
import 'package:fedi/Pages/Timeline/StatusFavoritePage.dart';
import 'package:fedi/Pages/Timeline/StatusRepostPage.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart'
    as AccountRequests;
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Views/VideoPlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';

class TimelineCell extends StatefulWidget {
  final Status status;
  final Function(Account) viewAccount;
  final Function(Status) viewStatusContext;
  final Function(Status) mentionOtherStatusContext;
  final bool showCommentBtn;

  TimelineCell(this.status,
      {this.viewAccount,
      this.viewStatusContext,
      this.showCommentBtn,
      this.mentionOtherStatusContext});

  @override
  State<StatefulWidget> createState() {
    return _TimelineCell();
  }
}

class _TimelineCell extends State<TimelineCell> {
  double deviceWidth;
  double targetHeight;
  double imageHeight;
  Account replyAccount;
  bool showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    emojiBloc = EmojiReactionBloc(
      status: widget.status,
    );
    getReply();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  getReply() {
    if (widget.status.inReplyToAccountId != null && replyAccount == null) {
      CurrentInstance.instance.currentClient
          .run(
              path: Accounts.account(id: widget.status.inReplyToAccountId),
              method: HTTPMethod.GET)
          .then((response) {
        Account account = Account.fromJsonString(response.body);
        if (mounted) {
          setState(() {
            replyAccount = account;
          });
        }
      }).catchError((error) {
        print(error);
      });
    }
  }

  String getLikeCounts() {
    var count = 0;
    count += widget.status.favouritesCount;

    if (widget.status.reblog != null) {
      count += widget.status.reblog.favouritesCount;
    }

    if (count == 0) {
      return "";
    } else {
      return "$count";
    }
  }

  getRepostCounts() {
    var count = 0;
    count += widget.status.reblogsCount;

    if (widget.status.reblog != null) {
      count += widget.status.reblog.reblogsCount;
    }

    if (count == 0) {
      return "";
    } else {
      return "$count";
    }
  }

  var emojiBloc;

  @override
  Widget build(BuildContext context) {
    
    deviceWidth = MediaQuery.of(context).size.width;
    if (targetHeight == null) {
      targetHeight = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    }

    Status status =
        widget.status.reblog != null ? widget.status.reblog : widget.status;

    return MultiProvider(
      providers: [
        Provider<EmojiReactionProvider>(
            create: (context) => EmojiReactionProvider(
                  emojiBloc,
                )),
      ],
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              // reposted status
              if (widget.status.reblog != null)
                GestureDetector(
                  onTap: () {
                    print("view account");
                    if (widget.viewAccount != null) {
                      widget.viewAccount(widget.status.account);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.status.account.avatar,
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
                          widget.status.account.acct,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Image(
                              height: 20,
                              width: 20,
                              color: Colors.grey,
                              image: AssetImage("assets/images/repost.png"),
                            ),
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
                      onTap: () {
                        print("view account");
                        if (widget.viewAccount != null) {
                          widget.viewAccount(status.account);
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: deviceWidth * 0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: getUserName(status),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${status.account.acct}")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("view status context");
                        if (widget.viewStatusContext != null) {
                          widget.viewStatusContext(status);
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 19),
                            child: Text(
                              timeago.format(status.createdAt,
                                  locale: 'en_short'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              if (replyAccount != null)
                GestureDetector(
                  onTap: () {
                    if (widget.viewAccount != null) {
                      widget.viewAccount(replyAccount);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
                        Row(
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
                            Text(
                              AppLocalizations.of(context)
                                  .tr("timeline.status.cell.reply_to"),
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          replyAccount.acct,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),

              GestureDetector(
                onTap: () {
                  print("view status context");
                  if (widget.viewStatusContext != null) {
                    widget.viewStatusContext(status);
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
                        onImageError:
                            (dynamic exception, StackTrace stackTrace) {
                          print("Image error!!!");
                          print(exception);
                          print(stackTrace);
                        },
                        data: getHTMLWithCustomEmoji(widget.status),
                        onLinkTap: (String link) {
                          for (int i = 0;
                              i < widget.status.mentions.length;
                              i++) {
                            Mention mention = widget.status.mentions[i];
                            String id = mention.id;
                            print("MENTIONS: ${mention.url} == $link");
                            if (mention.url == link) {
                              CurrentInstance.instance.currentClient
                                  .run(
                                      path: AccountRequests.Accounts.account(
                                          id: id),
                                      method: HTTPMethod.GET)
                                  .then((response) {
                                Account account =
                                    Account.fromJsonString(response.body);
                                if (widget.viewAccount == null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OtherAccount(account)),
                                  );
                                  return;
                                }
                                widget.viewAccount(account);
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
                    // image carousel
                    if (widget.status.mediaAttachments.length > 0)
                      getMeidaWidget(widget.status),
                    // card widget
                    if (widget.status.card != null)
                      CardWidget(widget.status.card)
                    else if (widget.status.reblog != null)
                      if (widget.status.reblog.card != null)
                        CardWidget(widget.status.reblog.card),

                    // emoji reactions
                    if (widget.status.statusPleroma != null)
                      if (widget.status.statusPleroma.emojiReactions != null)
                        EmojiReactionWidget(),
                    // counts favs and other goodies
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                color: Colors.grey,
                                icon: Image(
                                  height: 20,
                                  width: 20,
                                  color: Colors.grey,
                                  image:
                                      AssetImage("assets/images/comment.png"),
                                ),
                                tooltip: AppLocalizations.of(context)
                                    .tr("timeline.status.cell.tooltip.comment"),
                                onPressed: () {
                                  if (widget.showCommentBtn == null) {
                                    widget.mentionOtherStatusContext(
                                        widget.status);
                                  } else {
                                    widget.viewStatusContext(widget.status);
                                  }
                                },
                              ),
                              if (widget.status.repliesCount != 0 &&
                                  (widget.showCommentBtn == true ||
                                      widget.showCommentBtn == null))
                                Text(widget.status.repliesCount.toString()),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                color: widget.status.favourited
                                    ? Colors.blue
                                    : Colors.grey,
                                icon: Image(
                                  height: 20,
                                  width: 20,
                                  color: widget.status.favourited
                                      ? Colors.blue
                                      : Colors.grey,
                                  image:
                                      AssetImage("assets/images/favorites.png"),
                                ),
                                tooltip: AppLocalizations.of(context)
                                    .tr("timeline.status.cell.tooltip.like"),
                                onPressed: () {
                                  like();
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  // go to likes page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StatusFavoritePage(widget.status)),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    getLikeCounts(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            color: Colors.grey,
                            icon: Image(
                              height: 20,
                              width: 20,
                              color: widget.status.reblogged
                                  ? Colors.blue
                                  : Colors.grey,
                              image: AssetImage("assets/images/happy.png"),
                            ),
                            tooltip: AppLocalizations.of(context)
                                .tr("timeline.status.cell.tooltip.repost"),
                            onPressed: () {
                              setState(() {
                                showEmojiPicker = !showEmojiPicker;
                              });
                            },
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                color: widget.status.reblogged
                                    ? Colors.blue
                                    : Colors.grey,
                                icon: Image(
                                  height: 20,
                                  width: 20,
                                  color: widget.status.reblogged
                                      ? Colors.blue
                                      : Colors.grey,
                                  image: AssetImage("assets/images/repost.png"),
                                ),
                                tooltip: AppLocalizations.of(context)
                                    .tr("timeline.status.cell.tooltip.repost"),
                                onPressed: () {
                                  repost();
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  // go to reposts
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StatusRepostPage(widget.status)),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    getRepostCounts(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Image(
                              height: 20,
                              width: 20,
                              color: Colors.grey,
                              image: AssetImage("assets/images/share.png"),
                            ),
                            tooltip: AppLocalizations.of(context)
                                .tr("timeline.status.cell.tooltip.more"),
                            onPressed: () {
                              showMoreOptions(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    if (showEmojiPicker)
                      Container(
                        width: deviceWidth * 0.9,
                        child: new EmojiWidget.EmojiPicker(
                          bgColor: Colors.transparent,
                          rows: 3,
                          columns: 7,
                          numRecommended: 0,
                          selectedCategory: EmojiWidget.Category.RECENT,
                          recommendKeywords: null,
                          buttonMode: EmojiWidget.ButtonMode.MATERIAL,
                          onEmojiSelected: (emoji, category) {
                            print(emoji.emoji);
                            emojiBloc.addRemoveReaction(emoji.emoji);
                            SharedPreferences.getInstance().then((prefs) {
                              final key = "recents";
                              var recentEmojis =
                                  prefs.getStringList(key) ?? new List();
                              recentEmojis.insert(0, emoji.name);
                              prefs.setStringList(key, recentEmojis);
                            });

                            setState(() {
                              showEmojiPicker = !showEmojiPicker;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFavoritesButton(BuildContext context) {
    int count = 0;
    if (widget.status.reblog != null) {
      count += widget.status.reblog.favouritesCount ?? 0;
    }
    count += widget.status.favouritesCount ?? 0;

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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StatusFavoritePage(widget.status)),
        );
      },
    );
  }

  Widget getRepostsButton() {
    int count = 0;
    count += widget.status.reblogsCount ?? 0;
    if (widget.status.reblog != null) {
      count += widget.status.reblog.reblogsCount ?? 0;
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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StatusRepostPage(widget.status)),
        );
      },
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
    if (widget.status.reblogged == true) {
      path = StatusRequest.Status.unreblogStatus(widget.status.id);
      widget.status.reblogsCount = widget.status.reblogsCount - 1;
    } else {
      widget.status.reblogsCount = widget.status.reblogsCount + 1;
    }
    widget.status.reblogged = !widget.status.reblogged;
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
    Status status = widget.status;
    if (widget.status.reblog != null) {
      status = widget.status.reblog;
    }

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
                                    path:
                                        Accounts.account(id: status.account.id),
                                    method: HTTPMethod.GET)
                                .then((response) {
                              Account account =
                                  Account.fromJsonString(response.body);
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
                                    path:
                                        Accounts.muteAccount(status.account.id),
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
                                        status.account.id),
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
                            var params = {"account_id": status.account.id};
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

  Widget getMeidaWidget(Status status) {
    List<Widget> items = <Widget>[];

    for (var i = 0; i < status.mediaAttachments.length; i++) {
      MediaAttachment attachment = status.mediaAttachments[i];
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

  String getHTMLWithCustomEmoji(Status status) {
    List<Emoji> customEmoji = status.emojis;
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

  @override
  void dispose() {
    super.dispose();
    replyAccount = null;
  }
}

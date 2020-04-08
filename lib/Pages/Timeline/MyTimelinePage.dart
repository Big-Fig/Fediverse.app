import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Search/SearchPage.dart';
import 'package:fedi/Settings/AppSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pages/Timeline/TimelineCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/Models/Status.dart' as StatusModel;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../Pleroma/Foundation/Requests/Timeline.dart';
import 'package:flutter/scheduler.dart';

import '../TabPage.dart';

class MyTimelinePage extends StatefulWidget {
  final TabPageState tabPage;

  MyTimelinePage(this.tabPage, {Key key}) : super(key: key);
  final List<Status> statuses = [];
  @override
  State<StatefulWidget> createState() {
    return MyTimelinePageState();
  }
}

class MyTimelinePageState extends State<MyTimelinePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String path;
  TabController _homeTabController;
  DrawerController drawerController;
  bool hideReplies = false;
  bool mediaOnly = false;
  bool hideNSFW = false;

  viewAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  selectTimeline(String timeline) async {
    hideReplies = await AppSettings.getTimelineRepliesSetting();
    hideNSFW = await AppSettings.getTimelineHideNSFWSetting();
    mediaOnly = await AppSettings.getTimelineMediaGridSetting();
    print("selectTimeline");

    widget.tabPage.currentTimeline = timeline;
    if (widget.tabPage.currentTimeline == "Home") {
      path = Timeline.getHomeTimeline(
          minId: "", maxId: "", sinceId: "", limit: "50", mediaOnly: mediaOnly);
    } else if (widget.tabPage.currentTimeline == "Local") {
      path = Timeline.getLocalTimeline(
          minId: "", maxId: "", sinceId: "", limit: "50", mediaOnly: mediaOnly);
    } else {
      path = Timeline.getPublicTimeline(
          minId: "", maxId: "", sinceId: "", limit: "50", mediaOnly: mediaOnly);
    }
    if (mounted) {
      setState(() {});
    }
    refreshEverything();
  }

  refresh() {}

  viewStatusDetail(Status status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
        settings: RouteSettings(name: "/StatusDetail"),
      ),
    );
  }

  void initState() {
    super.initState();

    _homeTabController = TabController(
      vsync: this,
      length: 4,
    );
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => selectTimeline("Home"));
    }
  }

  refreshEverything() {
    _refreshController.requestRefresh();
  }

  void fetchStatuses(BuildContext context) {
    if (widget.statuses.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _onRefresh() {
    print("ONREFRESH");
    // monitor network fetch
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = Status.listFromJsonString(response.body);
      newStatuses.removeWhere((status) {
        return status.visibility == StatusModel.Visibility.DIRECT;
      });

      if (hideReplies) {
        newStatuses.removeWhere((status) {
          return status.inReplyToId != null;
        });
        return;
      }

      if (hideNSFW) {
        newStatuses.removeWhere((status) {
          return status.sensitive;
        });
      }
      if (mounted)
        setState(() {
          widget.statuses.clear();
        });

      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() {
    print("ONLOAD");
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    var lastId = "";
    Status lastStatus = widget.statuses.last;
    if (lastStatus != null) {
      lastId = lastStatus.id;
    }

    String loadMorePath;
    if (widget.tabPage.currentTimeline == "Home") {
      loadMorePath = Timeline.getHomeTimeline(
          minId: "",
          maxId: lastId,
          sinceId: "",
          limit: "50",
          mediaOnly: mediaOnly);
    } else if (widget.tabPage.currentTimeline == "Local") {
      loadMorePath = Timeline.getLocalTimeline(
          minId: "",
          maxId: lastId,
          sinceId: "",
          limit: "50",
          mediaOnly: mediaOnly);
    } else {
      loadMorePath = Timeline.getPublicTimeline(
          minId: "",
          maxId: lastId,
          sinceId: "",
          limit: "50",
          mediaOnly: mediaOnly);
    }

    CurrentInstance.instance.currentClient
        .run(path: loadMorePath, method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = Status.listFromJsonString(response.body);
      newStatuses.removeWhere((status) {
        return status.visibility == StatusModel.Visibility.DIRECT;
      });

      if (hideReplies) {
        newStatuses.removeWhere((status) {
          return status.inReplyToId != null;
        });
      }

      if (hideNSFW) {
        newStatuses.removeWhere((status) {
          return status.sensitive;
        });
      }

      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.loadComplete();
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  int previousIndex = 0;

  tabChanged(int index) {
    if (index == 0) {
      selectTimeline("Home");
    } else if (index == 1) {
      selectTimeline("Local");
    } else if (index == 2) {
      selectTimeline("All");
    } else if (index == 3) {
      // go to search
      _homeTabController.index = previousIndex;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SerachPage(),
        ),
      );
      return;
    } else if (index == 4) {
      // go to settings
      _homeTabController.index = previousIndex;
      return;
    }
    _homeTabController.index = index;
    previousIndex = index;
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      key: _drawerKey,
      endDrawer: getDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _drawerKey.currentState.openEndDrawer();
            },
          ),
        ],
        title: TabBar(
          labelStyle: TextStyle(fontSize: 14),
          onTap: tabChanged,
          controller: _homeTabController,
          tabs: [
            Tab(
              text: AppLocalizations.of(context).tr("home.timeline.tabs.home"),
              icon: null,
            ),
            Tab(
              text: AppLocalizations.of(context).tr("home.timeline.tabs.local"),
              icon: null,
            ),
            Tab(
              text: AppLocalizations.of(context).tr("home.timeline.tabs.all"),
              icon: null,
            ),
            Tab(icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: getCurrentTimeline(context),
    );
  }

  Widget getDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 110,
            width: 50,
            child: DrawerHeader(
              child: Text(
                AppLocalizations.of(context).tr("home.drawer.settings.header"),
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .tr("home.drawer.settings.media_only"),
                ),
                Spacer(),
                Switch(
                  value: mediaOnly,
                  onChanged: (value) {
                    setState(() {
                      mediaOnly = value;
                      if (mediaOnly == true) {
                        widget.statuses.clear();
                      }
                      AppSettings.setTimelineMediaGridSetting(mediaOnly)
                          .then((_) {
                        selectTimeline(widget.tabPage.currentTimeline);
                      });
                    });
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .tr("home.drawer.settings.hide_replies"),
                ),
                Spacer(),
                Switch(
                  value: hideReplies,
                  onChanged: (value) {
                    setState(() {
                      hideReplies = value;
                      AppSettings.setTimelineRepliesSetting(hideReplies)
                          .then((_) {
                        selectTimeline(widget.tabPage.currentTimeline);
                      });
                    });
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .tr("home.drawer.settings.hide_nsfw"),
                ),
                Spacer(),
                Switch(
                  value: hideNSFW,
                  onChanged: (value) {
                    setState(() {
                      hideNSFW = value;
                      AppSettings.setTimelineHideNSFWSetting(hideNSFW)
                          .then((_) {
                        selectTimeline(widget.tabPage.currentTimeline);
                      });
                    });
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  Widget getCurrentTimeline(BuildContext context) {
    if (mediaOnly) {
      return getMediaTime(context);
    } else {
      return getTimeline(context);
    }
  }

  Widget getTimeline(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("MyTimelinePage"),
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(
          complete: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.done,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                AppLocalizations.of(context)
                    .tr("timeline.my.update.up_to_date"),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          failed: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                  AppLocalizations.of(context)
                      .tr("timeline.my.update.unable_to_fetch"),
                  style: TextStyle(color: Colors.grey))
            ],
          )),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("");
          } else if (mode == LoadStatus.loading) {
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(
                AppLocalizations.of(context).tr("timeline.my.update.failed"));
          } else {
            body = Text("");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        addAutomaticKeepAlives:false,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemBuilder: (c, i){
          return  TimelineCell(
          widget.statuses[i],
          viewAccount: viewAccount,
          viewStatusContext: viewStatusDetail,
          showCommentBtn: true,
        );
        },
        itemCount: widget.statuses.length,
      ),
    );
  }

  Widget getMediaTime(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("mediaTimeline"),
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(
          complete: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.done,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                AppLocalizations.of(context).tr("gallery.update.up_to_date"),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          failed: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                  AppLocalizations.of(context)
                      .tr("gallery.update.unable_to_fetch"),
                  style: TextStyle(color: Colors.grey))
            ],
          )),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("");
          } else if (mode == LoadStatus.loading) {
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(AppLocalizations.of(context)
                .tr("gallery.update.unable_to_fetch"));
          } else {
            body = Text(
                AppLocalizations.of(context).tr("gallery.update.no_more_data"));
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: widget.statuses.length,
        itemBuilder: (BuildContext context, int index) => new GestureDetector(
          onTap: () {
            var status = widget.statuses[index];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StatusDetail(
                  status: status,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.black.withOpacity(0.2),
            child: SizedBox.expand(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.statuses[index].mediaAttachments[0].previewUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                width: MediaQuery.of(context).size.width,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

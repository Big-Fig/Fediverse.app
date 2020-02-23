import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class TimelinePaginationListBase extends StatelessWidget {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    ITimelinePaginationListBloc timelinePaginationListBloc =
        ITimelinePaginationListBloc.of(context, listen: false);

    return SmartRefresher(
      key: PageStorageKey<String>("mediaTimeline"),
      enablePullDown: true,
      enablePullUp: true,
      header: buildWaterDropHeader(context),
      footer: buildCustomFooter(),
      controller: refreshController,
      onRefresh: () => onRefresh(context),
      onLoading: () => onLoading(context),
      child: StreamBuilder<List<IStatus>>(
          stream: timelinePaginationListBloc.itemsStream,
          initialData: timelinePaginationListBloc.items,
          builder: (context, snapshot) {
            var statuses = snapshot.data;
            if(statuses?.isNotEmpty == true) {
            return buildChildCollectionView(statuses);

            } else {
              return Center(child: Text("Empty list"));
            }
          }),
    );
  }

  CustomFooter buildCustomFooter() {
    return CustomFooter(
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
    );
  }

  WaterDropHeader buildWaterDropHeader(BuildContext context) {
    return WaterDropHeader(
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
        ));
  }

  onRefresh(BuildContext context) async {
    var timelinePaginationBloc =
        ITimelinePaginationListBloc.of(context, listen: true);
    var newFirstPage = await timelinePaginationBloc.refresh();

//    print("ONREFRESH");
//
//    IPleromaTimelineService pleromaTimelineService = IPleromaTimelineService.of
//      (context, listen: false);
//    Future<List<IPleromaStatus>> future;
//    if (widget.tabPage.currentTimeline == "Home") {
//      future = pleromaTimelineService.getHomeTimeline(onlyMedia: mediaOnly,
//          limit: 50);
//    } else if (widget.tabPage.currentTimeline == "Local") {
//      future = pleromaTimelineService.getPublicTimeline(onlyMedia: mediaOnly,
//          onlyLocal: true,
//          limit: 50);
//    } else {
//      future = pleromaTimelineService.getPublicTimeline(onlyMedia: mediaOnly,
//          limit: 50);
//    }
//
//    // monitor network fetch
//    // if failed,use refreshFailed()
//    future
//        .then((newStatuses) {
//      newStatuses.removeWhere((status) {
//        return status.visibilityPleroma == PleromaVisibility.DIRECT;
//      });
//
//      if (hideReplies) {
//        newStatuses.removeWhere((status) {
//          return status.inReplyToId != null;
//        });
//      }
//
//      if (hideNSFW) {
//        newStatuses.removeWhere((status) {
//          return status.sensitive;
//        });
//      }
//
//      widget.statuses.clear();
//      widget.statuses.addAll(newStatuses);
//      if (mounted) setState(() {});
//      refreshController.refreshCompleted();
//    }).catchError((error) {
//      print(error.toString());
//      if (mounted) setState(() {});
//      refreshController.refreshFailed();
//    });
  }

  void onLoading(BuildContext context) async {
    var timelinePaginationBloc =
        ITimelinePaginationListBloc.of(context, listen: true);
    var newFirstPage = await timelinePaginationBloc.loadMore();

//    print("ONLOAD");
//    // monitor network fetch
//    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    var lastId = "";
//    IPleromaStatus lastStatus = widget.statuses.last;
//    if (lastStatus != null) {
//      lastId = lastStatus.id;
//    }
//    IPleromaTimelineService pleromaTimelineService = IPleromaTimelineService.of
//      (context, listen: false);
//    Future<List<IPleromaStatus>> future;
//    if (widget.tabPage.currentTimeline == "Home") {
//      future = pleromaTimelineService.getHomeTimeline(onlyMedia: mediaOnly,
//          maxId: lastId,
//          limit: 50);
//    } else if (widget.tabPage.currentTimeline == "Local") {
//      future = pleromaTimelineService.getPublicTimeline(onlyMedia: mediaOnly,
//          maxId: lastId,
//          onlyLocal: true,
//          limit: 50);
//    } else {
//      future = pleromaTimelineService.getPublicTimeline(onlyMedia: mediaOnly,
//          maxId: lastId,
//          limit: 50);
//    }
//
//    future
//        .then((newStatuses) {
//      newStatuses.removeWhere((status) {
//        return status.visibilityPleroma == PleromaVisibility.DIRECT;
//      });
//
//      if (hideReplies) {
//        newStatuses.removeWhere((status) {
//          return status.inReplyToId != null;
//        });
//      }
//
//      if (hideNSFW) {
//        newStatuses.removeWhere((status) {
//          return status.sensitive;
//        });
//      }
//
//      widget.statuses.addAll(newStatuses);
//      if (mounted) setState(() {});
//      refreshController.loadComplete();
//    }).catchError((error) {
//      if (mounted) setState(() {});
//      refreshController.loadFailed();
//    });
  }

  viewAccount(BuildContext context, IPleromaAccount account) {
    // todo: fix
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

//  selectTimeline(String timeline) async {
//    hideReplies = await AppSettings.getTimelineRepliesSetting();
//    hideNSFW = await AppSettings.getTimelineHideNSFWSetting();
//    mediaOnly = await AppSettings.getTimelineMediaGridSetting();
//    print("selectTimeline");
//
//    widget.tabPage.currentTimeline = timeline;
//
//    if (mounted) {
//      setState(() {});
//    }
//    refreshEverything();
//  }

  refresh() {}

  viewStatusDetail(BuildContext context, IPleromaStatus status) {
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

  Widget buildChildCollectionView(List<IStatus> statuses);
}

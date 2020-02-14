import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Timeline.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  final List<Status> statuses = <Status>[];
  @override
  State<StatefulWidget> createState() {
    return GalleryPageState();
  }
}

class GalleryPageState extends State<GalleryPage> {
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
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

  void _onRefresh() async {
    print("ONREFRESH");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    IPleromaTimelineService pleromaTimelineService = IPleromaTimelineService.of
      (context, listen: false);
    pleromaTimelineService.getPublicTimeline(onlyMedia: true).then(
        (newStatuses) {
      widget.statuses.clear();
      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
    // if failed,use refreshFailed()
  }

  void _onLoading() async {
    print("ONLOAD");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    var lastId = "";
    Status lastStatus = widget.statuses.last;
    if (lastStatus != null) {
      lastId = lastStatus.id;
    }

    IPleromaTimelineService pleromaTimelineService = IPleromaTimelineService.of
      (context, listen: false);
    pleromaTimelineService.getPublicTimeline(onlyMedia: true).then(
            (newStatuses) {
              widget.statuses.addAll(newStatuses);
              if (mounted) setState(() {});
              _refreshController.loadComplete();
        }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("SearchPage"),
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
              Text(AppLocalizations.of(context)
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
            body = Text(AppLocalizations.of(context)
                .tr("gallery.update.no_more_data"));
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
}

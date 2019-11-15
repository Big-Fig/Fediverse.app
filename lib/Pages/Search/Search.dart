import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:phaze/Pages/Timeline/StatusDetail.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Timeline.dart';
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  final List<Status> statuses = <Status>[];
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }
  }
  

  refreshEverything(){
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
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(path: Timeline.getPublicMediaTimeline(""), method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = statusFromJson(response.body);
      widget.statuses.clear();
      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
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

    CurrentInstance.instance.currentClient
        .run(
            path: Timeline.getPublicMediaTimeline(lastId),
            method: HTTPMethod.GET)
        .then((response) {
      List<Status> newStatuses = statusFromJson(response.body);
      widget.statuses.addAll(newStatuses);
      if (mounted) setState(() {});
      _refreshController.loadComplete();
    }).catchError((error) {
      if (mounted) setState(() {});
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("MAINTABSEARCH"),
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
                "Everything up to date",
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
              Text("Unable to fetch data", style: TextStyle(color: Colors.grey))
            ],
          )),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else {
            body = Text("No more Data");
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
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/images/double_ring_loading_io.gif',
                image: widget.statuses[index].mediaAttachments[0].previewUrl,
                width: MediaQuery.of(context).size.width,
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

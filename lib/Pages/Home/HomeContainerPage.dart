import 'package:flutter/material.dart';
import 'package:fedi/Pages/Timeline/MyTimelinePage.dart';

import '../TabPage.dart';

class HomeContainerPage extends StatefulWidget {
  final TabPageState tabPage;
  final TabController tabController;
  final List<Widget> children;
  final GlobalKey<MyTimelinePageState> timelineKey;

  HomeContainerPage(this.tabController, this.children, this.timelineKey, this.tabPage,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeContainerPageState();
  }
}

class HomeContainerPageState extends State<HomeContainerPage>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<HomeContainerPage> {
  TabController _tabController;

  bool showTimelineOptions = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex:timelines.indexOf( widget.tabPage.currentTimeline));
  }


  List<String> timelines = ["Home", "Local", "All"];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          bottom: showTimelineOptions == false
              ? null
              : TabBar(
                  labelPadding: EdgeInsets.only(bottom: 5),
                  indicatorPadding: EdgeInsets.only(bottom: 5),
                  controller: _tabController,
                  tabs: <Widget>[
                    Text(
                      timelines[0],
                    ),
                    Text(
                      timelines[1],
                    ),
                    Text(timelines[2]),
                  ],
                  onTap: (index) {
                    widget.timelineKey.currentState
                        .selectTimeline(timelines[index]);
                    showTimelineOptions = false;
                    setState(() {});
                  },
                ),
          title: TabBar(
            tabs: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.tabPage.currentTimeline,
                    style: TextStyle(fontSize: 17),
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      if (widget.tabController.index == 1) {
                        return;
                      }

                      showTimelineOptions = !showTimelineOptions;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Text(
                "Gallery",
                style: TextStyle(fontSize: 17),
              ),
            ],
            controller: widget.tabController,
            onTap: (index) {
              setState(() {});
            },
          )),
      body: widget.children[widget.tabController.index],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

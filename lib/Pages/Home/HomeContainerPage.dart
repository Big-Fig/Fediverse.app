import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Post/QuickPostPage.dart';
import 'package:fedi/Pages/Search/SearchPage.dart';
import 'package:fedi/Pages/Search/SearchResults.dart';
import 'package:flutter/material.dart';

import '../TabPage.dart';

class HomeContainerPage extends StatefulWidget {
  final TabPageState tabPage;
  final TabController tabController;
  final List<Widget> children;

  HomeContainerPage(this.tabController, this.children, this.tabPage, {Key key})
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
  double width;
  TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  bool showTimelineOptions = false;

  @override
  void initState() {
    super.initState();

  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // similar to initState but have valid Context
    List<String> timelines = _createTimelinesLabels(context);
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: timelines.indexOf(widget.tabPage.currentTimeline));
  }

  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<String> timelines = _createTimelinesLabels(context);
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: PageStorageKey<String>("HomeContainerPage"),
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
                      setState(() {
                        widget.tabPage.rebuildWithSelectedTimelien(timelines[index]);
                        widget.tabPage.currentTimeline = timelines[index];
                        showTimelineOptions = false;
                        showSearch = false;
                        
                      });
                    },
                  ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // push search view
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SerachPage(),
                    ),
                  );
                },
              ),
             
            ],
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
                        showSearch = false;
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
                setState(() {
                  showSearch = false;
                });
              },
            )),
        body: homeContainer(context));
  }

  List<String> _createTimelinesLabels(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context);

    List<String> timelines = [
      appLocalizations.tr("home.timeline.tabs.home"),
      appLocalizations.tr("home.timeline.tabs.local"),
      appLocalizations.tr("home.timeline.tabs.all"),
    ];
    return timelines;
  }

  Widget homeContainer(BuildContext context) {
    if (showSearch)
      return getSearchContainer(context);
    else
      return widget.children[widget.tabController.index];
  }

  Widget getSearchContainer(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          height: 50,
          width: width,
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      showSearch = false;
                    });
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)
                        .tr("home.search.input.hint"),
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SearchResults(_searchController),
        ),
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

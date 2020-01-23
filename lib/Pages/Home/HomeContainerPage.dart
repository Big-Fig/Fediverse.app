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
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: timelines.indexOf(widget.tabPage.currentTimeline));
  }

  List<String> timelines = ["Home", "Local", "All"];
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            leading:  IconButton(
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
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add,),
                onPressed: () {
                  // push search view
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuickPostPage(),
                    ),
                  );
                },
              )
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
        body: homeContainer());
  }

  Widget homeContainer() {
    if (showSearch)
      return getSearchContainer();
    else
      return widget.children[widget.tabController.index];
  }

  Widget getSearchContainer() {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          height: 50,
          width: width,
          color: Colors.green,
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
                    hintText: 'Search...',
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

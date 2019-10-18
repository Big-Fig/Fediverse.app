import 'package:flutter/material.dart';

class HomeContainerPage extends StatefulWidget {

  final TabController tabController;
  final List<Widget> children;

  HomeContainerPage(this.tabController, this.children);

  @override
  State<StatefulWidget> createState() {
    return _HomeContainerPage();
  }
}

class _HomeContainerPage extends State<HomeContainerPage>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<HomeContainerPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: PageStorageKey<String>("home"),
      appBar: AppBar(
          title: TabBar(
        key: PageStorageKey<String>("hometabs"),
        tabs: <Widget>[
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Home"),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Gallery"),
          ),
        ],
        controller: widget.tabController,
        onTap: (index) {
          setState(() {
          });
        },
      )),
      body: widget.children[widget.tabController.index],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

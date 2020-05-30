import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediHomeSliverPage extends StatelessWidget {
  
  final Widget appBar;
  final Widget body;


  FediHomeSliverPage({
    @required this.appBar,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {

          return [appBar];

//          // These are the slivers that show up in the "outer" scroll view.
//          var timelineHeaderHeight = 96;
//
//          return <Widget>[
//            SliverAppBar(
//              floating: true,
//              pinned: true,
//              snap: true,
////                snap: false,
//              leading: FlexibleSpaceBarVisibilityContainer(
//                child: GestureDetector(
//                  onTap: () {
//                    goToNewPostStatusPage(context);
//                  },
//                  child: MyAccountAvatarWidget(
//                    imageSize: 40,
//                    progressSize: 24,
//                  ),
//                ),
//              ),
//              title: FlexibleSpaceBarVisibilityContainer(
//                child: GestureDetector(
//                  onTap: () {
//                    goToNewPostStatusPage(context);
//                  },
//                  child: Text(
//                    AppLocalizations.of(context)
//                        .tr("app.status.post.field.message.hint"),
//                    style: TextStyle(
//                        fontSize: 18.0,
//                        color: FediColors.lightGrey,
//                        height: 1.5,
//                        fontWeight: FontWeight.w300),
//                  ),
//                ),
//              ),
//              brightness: Brightness.light,
//              expandedHeight: FediSizes.headerImageSingleRowSafeAreaHeight +
//                  timelineHeaderHeight +
//                  kToolbarHeight,
//              backgroundColor: Colors.white,
//              actions: [Container()],
//
//              flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.pin,
//                  background: FediLightStatusBarStyleArea(child: FediHomeTabContainer(
//                      topHeaderHeightInSafeArea:
//                      FediSizes.headerImageSingleRowSafeAreaHeight,
//                      topBar:
//                      buildTabBar(context, tabs, timelinesTabsBloc),
//                      body: FediListTile(
//                        isFirstInList: true,
//                        child: TimelineHeaderWidget(),
//                      )),)),
//            )
//          ];
        },
        body: body);
  }

}

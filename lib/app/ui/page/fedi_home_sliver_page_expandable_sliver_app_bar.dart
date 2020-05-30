import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/ui/flexible_space_bar_visibility_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediHomeSliverPageExpandableSliverAppBar extends StatelessWidget {
  final Widget collapsedAppBarBody;
  final Widget expandedAppBarTopBar;
  final Widget expandedAppBarBody;
  final double expandedAppBarBodyHeight;
  final double expandedAppBarTopBarHeightInSafeArea;

  FediHomeSliverPageExpandableSliverAppBar({
    @required this.collapsedAppBarBody,
    @required this.expandedAppBarBodyHeight,
    this.expandedAppBarTopBarHeightInSafeArea =
        FediSizes.headerImageSingleRowSafeAreaHeight,
    @required this.expandedAppBarTopBar,
    @required this.expandedAppBarBody,
  });

  @override
  Widget build(BuildContext context) => SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
//                snap: false,
        titleSpacing: 0.0,
        centerTitle: true,
        title: FlexibleSpaceBarVisibilityContainer(child: collapsedAppBarBody),
        brightness: Brightness.light,
        expandedHeight: expandedAppBarTopBarHeightInSafeArea +
            expandedAppBarBodyHeight +
            kToolbarHeight,
        backgroundColor: Colors.white,
        // don't show default buttons
//        leading: Container(),
        actions: [Container()],

        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: FediLightStatusBarStyleArea(
            child: FediHomeTabContainer(
                topHeaderHeightInSafeArea: expandedAppBarTopBarHeightInSafeArea,
                topBar: expandedAppBarTopBar,
                body: expandedAppBarBody),
          ),
        ),
      );
}

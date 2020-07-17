import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<TimelineTab> timelineTabs;
  final TabController tabController;

  TimelineTabTextTabIndicatorItemWidget({
    @required this.timelineTabs,
    @required this.tabController,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;
          return FediFadeShaderMask(
            fadingPercent: fadingPercent,
            fadingColor: FediColors.darkGrey,
            child: FediTextTabIndicatorWidget(
              tabController: tabController,
              isTransparent: true,
              tabs: timelineTabs,
              tabToTextMapper: (BuildContext context, TimelineTab tab) =>
                  mapTabToTitle(context, tab),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, TimelineTab tab) {
    switch (tab) {
      case TimelineTab.public:
        return tr("app.home.tab.timelines.tab.public");
        break;
      case TimelineTab.home:
        return tr("app.home.tab.timelines.tab.home");

        break;
      case TimelineTab.local:
        return tr("app.home.tab.timelines.tab.local");
        break;
    }

    throw "Invalid tab $tab";
  }
}

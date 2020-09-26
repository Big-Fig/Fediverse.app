import 'package:fedi/app/pagination/cached/cached_pagination_list_with_new_items_unread_badge_widget.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<ITimelineTabBloc> timelineTabBlocs;
  final TabController tabController;

  TimelineTabTextTabIndicatorItemWidget({
    @required this.timelineTabBlocs,
    @required this.tabController,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;
          return FediFadeShaderMask(
            fadingPercent: fadingPercent,
            fadingColor: FediColors.darkGrey,
            child: FediTextTabIndicatorWidget<ITimelineTabBloc>(
              customTabBuilder: (BuildContext context, Widget child,
                  ITimelineTabBloc timelineTabBloc) {
                var widget = CachedPaginationListWithNewItemsUnreadBadgeWidget(
                    child: child);

                var tabPaginationListBloc =
                    timelineTabBloc.paginationListWithNewItemsBloc;

                return Provider<ICachedPaginationListWithNewItemsBloc>.value(
                  value: tabPaginationListBloc,
                  child: widget,
                );
              },
              tabController: tabController,
              isTransparent: true,
              tabs: timelineTabBlocs,
              tabToTextMapper: (
                BuildContext context,
                ITimelineTabBloc timelineTabBloc,
              ) =>
                  mapTabToTitle(
                context,
                timelineTabBloc.timeline,
              ),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, Timeline tab) => tab.label;
}

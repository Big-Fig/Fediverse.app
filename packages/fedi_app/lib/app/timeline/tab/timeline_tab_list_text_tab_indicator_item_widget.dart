import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/pagination/cached/cached_pagination_list_with_new_items_unread_badge_bloc_impl.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_list_tab_controller_bloc.dart';
import 'package:fedi_app/app/timeline/timeline_label_extension.dart';
import 'package:fedi_app/app/timeline/timeline_model.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc_impl.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi_app/app/ui/tab/indicator/text/fedi_text_tab_indicator_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineTabListTextTabIndicatorItemWidget extends StatelessWidget {
  const TimelineTabListTextTabIndicatorItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;

          return FediFadeShaderMask(
            fadingPercent: fadingPercent,
            fadingColor: IFediUiColorTheme.of(context).darkGrey,
            child: DisposableProxyProvider<ITimelineListTabControllerBloc,
                IFediTabIndicatorBloc<ITimelineTabBloc>>(
              update:
                  (context, ITimelineListTabControllerBloc value, previous) =>
                      FediTabIndicatorBloc<ITimelineTabBloc>(
                items: value.timelineTabListBloc.timelineTabBlocs,
                tabController: value.tabController,
              ),
              child: FediTextTabIndicatorWidget<ITimelineTabBloc>(
                style: FediTabStyle.bubble,
                customTabBuilder: (
                  BuildContext context,
                  Widget child,
                  ITimelineTabBloc timelineTabBloc,
                ) {
                  var tabPaginationListBloc =
                      timelineTabBloc.paginationListWithNewItemsBloc;

                  return Provider<ICachedPaginationListWithNewItemsBloc>.value(
                    value: tabPaginationListBloc,
                    child: DisposableProxyProvider<
                        ICachedPaginationListWithNewItemsBloc,
                        IFediBoolBadgeBloc>(
                      update:
                          (context, cachedPaginationListWithNewItemsBloc, _) =>
                              CachedPaginationListWithNewItemsUnreadBadgeBloc(
                        cachedPaginationListWithNewItemsBloc:
                            cachedPaginationListWithNewItemsBloc,
                      ),
                      child: FediBoolBadgeWidget(
                        child: child,
                      ),
                    ),
                  );
                },
                isTransparent: true,
                tabToTextMapper: (
                  BuildContext context,
                  ITimelineTabBloc? timelineTabBloc,
                ) =>
                    mapTabToTitle(
                  context,
                  timelineTabBloc!.timeline,
                ),
              ),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, Timeline tab) =>
      tab.calculateLabel(context);
}

import 'dart:math';

import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/chart/fedi_chart_line_graph_painter.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/statistic/fedi_statistic_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final _logger = Logger('instance_activity_widget.dart');

class InstanceActivityWidget extends StatelessWidget {
  const InstanceActivityWidget();

  @override
  Widget build(BuildContext context) {
    var instanceActivityBloc = IInstanceActivityBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: instanceActivityBloc,
      loadingFinishedBuilder: (context) => FediListSmartRefresherWidget(
        isNeedToAddPaddingForUiTests: false,
        controller: instanceActivityBloc.refreshController,
        onRefresh: () async {
          try {
            await instanceActivityBloc.refresh();

            return FediListSmartRefresherLoadingState.loaded;
          } catch (e, stackTrace) {
            _logger.warning(
              () => 'instanceActivityBloc.refresh',
              e,
              stackTrace,
            );

            return FediListSmartRefresherLoadingState.failed;
          }
        },
        onLoading: null,
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const _InstanceActivityHeaderWidget(),
              const FediBigVerticalSpacer(),
              const _InstanceActivityGraphWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstanceActivityGraphWidget extends StatelessWidget {
  const _InstanceActivityGraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceActivityBloc = IInstanceActivityBloc.of(context);

    return StreamBuilder<List<IUnifediApiInstanceActivityItem>?>(
      stream: instanceActivityBloc.activityStream,
      initialData: instanceActivityBloc.activity,
      builder: (context, snapshot) {
        var activity = snapshot.data;
        if (activity?.isNotEmpty != true) {
          return SizedBox.shrink();
        }

        var first = activity!.first;

        var maxStatuses = first.statuses;
        var maxLogins = first.logins;
        var maxRegistrations = first.registrations;

        for (var item in activity) {
          maxStatuses = max(item.statuses, maxStatuses);
          maxLogins = max(item.logins, maxLogins);
          maxRegistrations = max(item.registrations, maxRegistrations);
        }

        var featureStatuses = FediChartLineGraphPainterFeature(
          color: IFediUiColorTheme.of(context).primary,
          data: activity.reversed
              .map((item) => item.statuses.toDouble() / maxStatuses)
              .toList(),
        );

        var featureLogins = FediChartLineGraphPainterFeature(
          color: IFediUiColorTheme.of(context).darkGrey,
          data: activity.reversed
              .map((item) => item.logins.toDouble() / maxLogins)
              .toList(),
        );

        var featureRegistrations = FediChartLineGraphPainterFeature(
          color: IFediUiColorTheme.of(context).grey,
          data: activity.reversed
              .map((item) => item.registrations.toDouble() / maxRegistrations)
              .toList(),
        );

        var labels = featureStatuses.data.map((d) => '').toList();

        var mediaQueryData = MediaQuery.of(context);

        var width = mediaQueryData.size.width;

        return CustomPaint(
          // ignore: no-magic-number
          size: Size(
            width,
            // ignore: no-equal-arguments
            width,
          ),
          painter: FediChartLineGraphPainter(
            features: [
              featureStatuses,
              featureLogins,
              featureRegistrations,
            ],
            labelY: labels,
            // ignore: no-equal-arguments
            labelX: labels,
            fontFamily: null,
            graphColor: IFediUiColorTheme.of(context).white,
            // ignore: no-magic-number
            graphOpacity: 0.2,
          ),
        );
      },
    );
  }
}

class _InstanceActivityHeaderWidget extends StatelessWidget {
  const _InstanceActivityHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceActivityBloc = IInstanceActivityBloc.of(context);

    return StreamBuilder<List<IUnifediApiInstanceActivityItem>?>(
      stream: instanceActivityBloc.activityStream,
      initialData: instanceActivityBloc.activity,
      builder: (context, snapshot) {
        var activity = snapshot.data;

        if (activity?.isNotEmpty == true) {
          var first = activity!.first;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FediStatisticItemWidget(
                valueString: first.statuses.toString(),
                label: S.of(context).app_instance_activity_statuses,
                color: IFediUiColorTheme.of(context).primary,
              ),
              FediStatisticItemWidget(
                valueString: first.logins.toString(),
                label: S.of(context).app_instance_activity_logins,
                color: IFediUiColorTheme.of(context).darkGrey,
              ),
              FediStatisticItemWidget(
                valueString: first.registrations.toString(),
                label: S.of(context).app_instance_activity_registrations,
                color: IFediUiColorTheme.of(context).grey,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

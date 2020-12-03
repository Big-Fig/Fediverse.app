import 'package:fedi/app/status/scheduled/list/scheduled_status_list_item_widget.dart';
import 'package:fedi/app/status/scheduled/pagination/list/scheduled_status_pagination_list_base_widget.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduledStatusPaginationListTimelineWidget
    extends ScheduledStatusPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;
  final VoidCallback successCallback;

  ScheduledStatusPaginationListTimelineWidget({
    @required Key key,
    @required this.needWatchLocalRepositoryForUpdates,
    @required this.successCallback,
    Widget customEmptyWidget,
    Widget customLoadingWidget,
  }) : super(
          key: key,
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
        );

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IScheduledStatus> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IScheduledStatus>.value(
                value: items[index],
                child: DisposableProxyProvider<IScheduledStatus,
                        IScheduledStatusBloc>(
                    update: (context, scheduledStatus, oldValue) =>
                        ScheduledStatusBloc.createFromContext(
                            context, scheduledStatus,
                            isNeedWatchLocalRepositoryForUpdates:
                                needWatchLocalRepositoryForUpdates),
                    child: FediListTile(
                      isFirstInList: index == 0,
                      child: ScheduledStatusListItemWidget(
                        successCallback: successCallback,
                      ),
                    )),
              ));
}

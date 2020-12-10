import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_base_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusCachedPaginationListTimelineWidget
    extends StatusCachedPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;
  final bool forceFirstItemPadding;

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var timelinePaginationListBloc = Provider.of<
            IPaginationListBloc<CachedPaginationPage<IStatus>, IStatus>>(
        context,
        listen: listen);
    return timelinePaginationListBloc;
  }

  const StatusCachedPaginationListTimelineWidget({
    Key key,
    Widget header,
    this.forceFirstItemPadding = false,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    Widget customLoadingWidget,
    Widget customEmptyWidget,
    @required this.needWatchLocalRepositoryForUpdates,
    ScrollController scrollController,
  }) : super(
          key: key,
          scrollController: scrollController,
          header: header,
          footer: footer,
          alwaysShowFooter: alwaysShowFooter,
          alwaysShowHeader: alwaysShowHeader,
          customLoadingWidget: customLoadingWidget,
          customEmptyWidget: customEmptyWidget,
        );

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IStatus> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) {
          var status = items[index];
          return Provider<IStatus>.value(
            value: status,
            child: FediListTile(
              isFirstInList:
                  index == 0 && header == null && !forceFirstItemPadding,
//                isFirstInList: false,
              child:
                  DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
                update: (context, status, _) => StatusListItemTimelineBloc.list(
                  status: status,
                  collapsible: true,
                  statusCallback: _onStatusClick,
                  initialMediaAttachment: null,
                ),
                child: const StatusListItemTimelineWidget(),
              ),
            ),
          );
        },
      );
}

void _onStatusClick(BuildContext context, IStatus status) {
  goToStatusThreadPage(context, status: status, initialMediaAttachment: null);
}

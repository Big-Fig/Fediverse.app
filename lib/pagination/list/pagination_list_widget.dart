import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("pagination_list_widget.dart");

abstract class PaginationListWidget<T> extends StatelessWidget {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        retrievePaginationListBloc(context, listen: true);
    _logger.fine(() => "build");

    return StreamBuilder<PaginationRefreshState>(
        stream: paginationListBloc.refreshStateStream,
        initialData: paginationListBloc.refreshState,
        builder: (context, snapshot) {
//          var refreshState = snapshot.data;
          // hack to avoid rebuild on disposing. Sometimes stream not updated
          // yet but actually refreshState is new
          var refreshState = paginationListBloc.refreshState;

          _logger.fine(() => "refreshState $refreshState");

          switch (refreshState) {
            case PaginationRefreshState.notRefreshed:
              return Center(
                  child: Text(AppLocalizations.of(context)
                      .tr("pagination.list.refresh.not_refreshed")));
              break;
            case PaginationRefreshState.refreshing:
              return Center(child: CircularProgressIndicator());
              break;
            case PaginationRefreshState.refreshed:
              return StreamBuilder<List<T>>(
                  stream: paginationListBloc.itemsStream.distinct(),
                  // initialData is null to avoid twice redraw on init
                  initialData: null,
                  builder: (context, snapshot) {
                    var items = snapshot.data;

                    _logger.fine(() => "items ${items?.length}");
                    if (items == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (items?.isNotEmpty == true) {
                      return SmartRefresher(
                        key: PageStorageKey<String>("PaginationListWidget"),
                        enablePullDown: true,
                        enablePullUp: true,
                        header: buildWaterDropHeader(context),
                        footer: buildCustomFooter(),
                        controller: refreshController,
                        onRefresh: () => onRefresh(context),
                        onLoading: () => onLoading(context),
                        child: buildChildCollectionView(context, items),
                      );
                    } else {
                      return Center(
                          child: Text(AppLocalizations.of(context)
                              .tr("pagination.list.empty")));
                    }
                  });
              break;
          }

          throw "Invalid refreshState $refreshState";
        });
  }

  CustomFooter buildCustomFooter() => CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;

          switch (mode) {
            case LoadStatus.idle:
              body = SizedBox.shrink();
              break;
            case LoadStatus.canLoading:
              body = Text(AppLocalizations.of(context)
                  .tr("pagination.list.footer.can_loading"));
              break;
            case LoadStatus.loading:
              body = CircularProgressIndicator();
              break;
            case LoadStatus.noMore:
              body = Text(AppLocalizations.of(context)
                  .tr("pagination.list.footer.no_more"));
              break;
            case LoadStatus.failed:
              body = Text(AppLocalizations.of(context)
                  .tr("pagination.list.footer.failed"));
              break;
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      );

  WaterDropHeader buildWaterDropHeader(BuildContext context) {
    return WaterDropHeader(
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.done,
              color: Colors.grey,
            ),
            Container(
              width: 15.0,
            ),
            Text(
              AppLocalizations.of(context)
                  .tr("pagination.list.header.complete"),
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        failed: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.close,
              color: Colors.grey,
            ),
            Container(
              width: 15.0,
            ),
            Text(
                AppLocalizations.of(context)
                    .tr("pagination.list.header.failed"),
                style: TextStyle(color: Colors.grey))
          ],
        ));
  }

  onRefresh(BuildContext context) async {
    _logger.fine(() => "onRefresh");

    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        retrievePaginationListBloc(context, listen: false);

    paginationListBloc.refresh().then((page) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((error) {
      _logger.shout(() => "Error during onRefresh", error);
      refreshController.refreshFailed();
    });
  }

  void onLoading(BuildContext context) async {
    _logger.fine(() => "onLoading");

    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        retrievePaginationListBloc(context, listen: false);

    paginationListBloc.loadMore().then((page) {
      if (page.items?.isNotEmpty == true) {
        refreshController.loadComplete();
      } else {
        refreshController.loadNoData();
      }
    }).catchError((error) {
      _logger.shout(() => "Error during onLoading", error);
      refreshController.loadFailed();
    });
  }

  ScrollView buildChildCollectionView(BuildContext context, List<T> statuses);

  IPaginationListBloc<PaginationPage<T>, T> retrievePaginationListBloc(
      BuildContext context, {@required bool
      listen});
}

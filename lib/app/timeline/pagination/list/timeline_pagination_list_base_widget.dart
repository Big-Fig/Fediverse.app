import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("timeline_pagination_list_base_widget.dart");

abstract class TimelinePaginationListBase extends StatelessWidget {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    ITimelinePaginationListBloc timelinePaginationListBloc =
        ITimelinePaginationListBloc.of(context, listen: true);

    return SmartRefresher(
      key: PageStorageKey<String>("TimelinePaginationListBase"),
      enablePullDown: true,
      enablePullUp: true,
      header: buildWaterDropHeader(context),
      footer: buildCustomFooter(),
      controller: refreshController,
      onRefresh: () => onRefresh(context),
      onLoading: () => onLoading(context),
      child: StreamBuilder<PaginationRefreshState>(
          stream: timelinePaginationListBloc.refreshStateStream,
          initialData: timelinePaginationListBloc.refreshState,
          builder: (context, snapshot) {
            var refreshState = snapshot.data;

            _logger.fine(() => "refreshState $refreshState");

            switch (refreshState) {
              case PaginationRefreshState.notRefreshed:
                return Center(child: Text("Don't forget to call refresh()"));
                break;
              case PaginationRefreshState.refreshing:
                return Center(child: CircularProgressIndicator());
                break;
              case PaginationRefreshState.refreshed:
                return StreamBuilder<List<IStatus>>(
                    stream: timelinePaginationListBloc.itemsStream.distinct(),
                    initialData: timelinePaginationListBloc.items,
                    builder: (context, snapshot) {
                      var statuses = snapshot.data;
                      _logger.fine(() => "statuses ${statuses?.length}");
                      if (statuses?.isNotEmpty == true) {
                        return buildChildCollectionView(statuses);
                      } else {
                        return Center(child: Text("Empty list"));
                      }
                    });
                break;
            }

            throw "Invalid refreshState $refreshState";
          }),
    );
  }

  CustomFooter buildCustomFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("");
        } else if (mode == LoadStatus.loading) {
          body = CircularProgressIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text(AppLocalizations.of(context)
              .tr("gallery.update.unable_to_fetch"));
        } else {
          body = Text(
              AppLocalizations.of(context).tr("gallery.update.no_more_data"));
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }

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
              AppLocalizations.of(context).tr("gallery.update.up_to_date"),
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
                    .tr("gallery.update.unable_to_fetch"),
                style: TextStyle(color: Colors.grey))
          ],
        ));
  }

  onRefresh(BuildContext context) async {
    _logger.fine(() => "onRefresh");
    var timelinePaginationBloc =
        ITimelinePaginationListBloc.of(context, listen: false);
    timelinePaginationBloc.refresh().then((page) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((error) {
      _logger.shout(() => "Error during onRefresh", error);
      refreshController.refreshFailed();
    });
  }

  void onLoading(BuildContext context) async {
    _logger.fine(() => "onLoading");
    var timelinePaginationBloc =
        ITimelinePaginationListBloc.of(context, listen: false);
    timelinePaginationBloc.refresh().then((page) {
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

  viewAccount(BuildContext context, IPleromaAccount account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  viewStatusDetail(BuildContext context, IPleromaStatus status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
        settings: RouteSettings(name: "/StatusDetail"),
      ),
    );
  }

  Widget buildChildCollectionView(List<IStatus> statuses);
}

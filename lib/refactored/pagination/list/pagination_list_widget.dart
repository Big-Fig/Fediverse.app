import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/refactored/app/list/list_loading_footer_widget.dart';
import 'package:fedi/refactored/app/list/list_refresh_header_widget.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("pagination_list_widget.dart");

typedef Future<bool> RefreshAction();

abstract class PaginationListWidget<T> extends StatefulWidget {
  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;
  final RefreshAction additionalRefreshAction;

  PaginationListWidget({
    Key key,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
    this.additionalRefreshAction,
  }) : super(key: key) {
    if (alwaysShowHeader == true) {
      assert(header != null);
    }
    if (alwaysShowFooter == true) {
      assert(footer != null);
    }
  }

  SmartRefresher buildSmartRefresher(
      IPaginationListBloc paginationListBloc,
      BuildContext context,
      List<T> items,
      RefreshController refreshController,
      Widget Function(BuildContext context) smartRefresherBodyBuilder) {
    _logger.finest(() => "buildSmartRefresher items ${items?.length}");

    return SmartRefresher(
      key: key,
      enablePullDown: true,
      enablePullUp: true,
      header: ListRefreshHeaderWidget(),
      footer: ListLoadingFooterWidget(),
      controller: refreshController,
      onRefresh: () {
        _logger.finest(() => "refresh");
        return AsyncSmartRefresherHelper.doAsyncRefresh(
            controller: refreshController,
            action: () async {
              bool success;
              if (additionalRefreshAction != null) {
                success = await additionalRefreshAction();
              } else {
                success = true;
              }
              success &= await paginationListBloc.refresh();
              if (success) {
                _logger.finest(() => "onRefresh success=$success");
              } else {
                _logger.severe(() => "onRefresh success=$success");
              }
              return success;
            });
      },
      onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
          controller: refreshController, action: paginationListBloc.loadMore),
      child: smartRefresherBodyBuilder(context),
    );
  }

  ScrollView buildItemsCollectionView(
      {@required BuildContext context,
      @required List<T> items,
      @required Widget header,
      @required Widget footer});

  IPaginationListBloc<PaginationPage<T>, T> retrievePaginationListBloc(
      BuildContext context,
      {@required bool listen});

  @override
  _PaginationListWidgetState createState() => _PaginationListWidgetState();

  static ListView buildItemsListView<T>(
      {@required BuildContext context,
      @required List<T> items,
      @required Widget header,
      @required Widget footer,
      @required IndexedWidgetBuilder itemBuilder}) {
    _logger.finest(() => "buildItemsListView items ${items?.length}");

    var length = items.length;
    return ListView.builder(
      itemBuilder: (context, index) {
        if (header != null && index == 0) {
          return header;
        } else if (footer != null && index == length - 1) {
          return footer;
        }
        var itemIndex = index;
        if (header != null) {
          itemIndex -= 1;
        }

        _logger.finest(() => "buildItemsListView itemIndex=$itemIndex");
        return itemBuilder(context, itemIndex);
      },
      itemCount: items.length,
    );
  }
}

class _PaginationListWidgetState<T> extends State<PaginationListWidget<T>> {
  @override
  void initState() {
    super.initState();

    _logger.finest(() => "initState");
  }

  @override
  Widget build(BuildContext context) {
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        widget.retrievePaginationListBloc(context, listen: true);
    _logger.finest(() => "build "
        "paginationListBloc.isRefreshedAtLeastOnce=${paginationListBloc.isRefreshedAtLeastOnce}");

    if (!paginationListBloc.isRefreshedAtLeastOnce) {
      // 500 delay required to be sure that widget will be built during initial
      // refresh
      askToRefresh(context);
    }

    return AsyncInitLoadingWidget(
      asyncInitLoadingBloc: paginationListBloc,
      loadingFinishedBuilder: (BuildContext context) {
        _logger.finest(() => "build AsyncInitLoadingWidget stream");
        // Stream builder outside SmartRefresher because
        // SmartRefresher require ScrollView as child
        // If child is StreamBuilder SmartRefresher builds all items widget
        // instead visible only
        return StreamBuilder<List<T>>(
            stream: paginationListBloc.itemsStream,
            initialData: paginationListBloc.items,
            builder: (context, snapshot) {
              var items = snapshot.data;

              _logger.finest(() => "build paginationListBloc.itemsStream items "
                  "${items?.length}");

              return widget.buildSmartRefresher(
                  paginationListBloc,
                  context,
                  items,
                  paginationListBloc.refreshController,
                  (context) => buildSmartRefresherBody(
                      context, items, paginationListBloc));
            });
      },
    );
  }

  void askToRefresh(BuildContext context) {
    // 500 delay required to be sure that widget will be built during initial
    // refresh
    Future.delayed(Duration(milliseconds: 500), () {
      _logger.finest(() => "initState delayed");
      try {
        IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
            widget.retrievePaginationListBloc(context, listen: false);

        var isRefreshedAtLeastOnce = paginationListBloc.isRefreshedAtLeastOnce;
        _logger.finest(
            () => "initState isRefreshedAtLeastOnce = $isRefreshedAtLeastOnce");
        if (!isRefreshedAtLeastOnce) {
          var refreshController = paginationListBloc.refreshController;
          var position = refreshController.position;

          _logger.finest(() => "initState position = $position");
          if (position != null) {
            refreshController.requestRefresh();
          }
        }
      } catch (e, stackTrace) {
        _logger.warning(() => "error during refreshing", e, stackTrace);
      }
    });
  }

  Widget buildNotListBody(Widget child) {
    _logger.finest(() => "buildNotListBody "
        "alwaysShowHeader=${widget.alwaysShowHeader} "
        "alwaysShowFooter=${widget.alwaysShowFooter} ");
    if (widget.alwaysShowHeader != true && widget.alwaysShowFooter != true) {
      return child;
    } else {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.alwaysShowHeader == true) widget.header,
            Expanded(child: child),
            if (widget.alwaysShowFooter == true) widget.footer,
          ]);
    }
  }

  Widget buildSmartRefresherBody(BuildContext context, List<T> items,
      IPaginationListBloc<PaginationPage<T>, T> paginationListBloc) {
    if (items == null) {
      _logger.finest(() => "build loading");
      return buildNotListBody(Center(child: CircularProgressIndicator()));
    }

    if (items?.isNotEmpty == true) {
      return widget.buildItemsCollectionView(
          context: context,
          items: items,
          header: widget.header,
          footer: widget.footer);
    } else {
      _logger.finest(() => "build empty");
      return buildNotListBody(Center(
          child:
              Text(AppLocalizations.of(context).tr("pagination.list.empty"))));
    }
  }
}

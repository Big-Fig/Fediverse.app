import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/list/list_refresh_header_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("pagination_list_dart");

abstract class PaginationListWidget<T> extends StatelessWidget {
  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;
  final ScrollController scrollController;

  // nothing by default
  Future<bool> additionalRefreshAction(BuildContext context) async => true;

  const PaginationListWidget({
    Key key,
    this.scrollController,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  }) : super(key: key);

  Widget buildSmartRefresher(
      IPaginationListBloc paginationListBloc,
      BuildContext context,
      List<T> items,
      RefreshController refreshController,
      ScrollController scrollController,
      Widget Function(BuildContext context) smartRefresherBodyBuilder) {
    _logger.finest(() => "buildSmartRefresher items ${items?.length}");

    return FediListSmartRefresherWidget(
//      key: key,
      enablePullDown: true,
      enablePullUp: true,
      header: const ListRefreshHeaderWidget(),
      footer: const ListLoadingFooterWidget(),
      controller: refreshController,
      scrollController: scrollController,
      primary: scrollController != null ? false : true,
      onRefresh: () {
        _logger.finest(() => "refresh");
        return AsyncSmartRefresherHelper.doAsyncRefresh(
            controller: refreshController,
            action: () async {
              bool success = await additionalRefreshAction(context);

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

  static ListView buildItemsListView<T>(
      {@required BuildContext context,
      @required List<T> items,
      @required Widget header,
      @required Widget footer,
      @required IndexedWidgetBuilder itemBuilder}) {
    _logger.finest(() => "buildItemsListView items ${items?.length}");

    return ListView.builder(
        itemBuilder: (context, index) {
          var isFirst = index == 0;
          var isLast = index == (items.length - 1);
          if (header != null && isFirst) {
            return header;
          } else if (footer != null && isLast) {
            return footer;
          }
          var itemIndex = index;
          if (header != null) {
            itemIndex -= 1;
          }

          _logger.finest(() => "buildItemsListView itemIndex=$itemIndex");
          return itemBuilder(context, itemIndex);
        },
        itemCount:
            items.length + (header != null ? 1 : 0) + (footer != null ? 1 : 0));
  }

  @override
  Widget build(BuildContext context) {
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        retrievePaginationListBloc(context, listen: true);
    _logger.finest(() => "build "
        "paginationListBloc.isRefreshedAtLeastOnce=${paginationListBloc.isRefreshedAtLeastOnce}");

    if (!paginationListBloc.isRefreshedAtLeastOnce) {
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

              return buildSmartRefresher(
                  paginationListBloc,
                  context,
                  items,
                  paginationListBloc.refreshController,
                  scrollController,
                  (context) => buildSmartRefresherBody(
                      context, items, paginationListBloc));
            });
      },
    );
  }

  void askToRefresh(BuildContext context) {
    // delay required to be sure that widget will be built during initial
    // refresh
    Future.delayed(Duration(milliseconds: 1000), () {
      _logger.finest(() => "initState delayed");
      try {
        IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
            retrievePaginationListBloc(context, listen: false);

        var isRefreshedAtLeastOnce = paginationListBloc.isRefreshedAtLeastOnce;
        _logger.finest(
            () => "initState isRefreshedAtLeastOnce = $isRefreshedAtLeastOnce");
        if (!isRefreshedAtLeastOnce) {
          var refreshController = paginationListBloc.refreshController;
          var position = refreshController.position;

          _logger.finest(() => "initState position = $position");
          // todo: remove hack for empty refresh
          if (position != null && paginationListBloc.items?.isNotEmpty ==
              true) {
            // refresh with UI indicator
            refreshController.requestRefresh(needMove:false);
          } else {
            // refresh without UI indicator
            paginationListBloc.refresh();
          }
        }
      } catch (e, stackTrace) {
        _logger.warning(() => "error during refreshing", e, stackTrace);
      }
    });
  }

  Widget buildNotListBody(Widget child) {
    _logger.finest(() => "buildNotListBody "
        "alwaysShowHeader=${alwaysShowHeader} "
        "alwaysShowFooter=${alwaysShowFooter} ");
    if (alwaysShowHeader != true && alwaysShowFooter != true) {
      return child;
    } else {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (alwaysShowHeader == true) header,
            Expanded(child: child),
            if (alwaysShowFooter == true) footer,
          ]);
    }
  }

  Widget buildSmartRefresherBody(BuildContext context, List<T> items,
      IPaginationListBloc<PaginationPage<T>, T> paginationListBloc) {
    if (items == null) {
      _logger.finest(() => "build loading");
      return buildNotListBody(Center(child: FediCircularProgressIndicator()));
    }

    if (items?.isNotEmpty == true) {
      return buildItemsCollectionView(
          context: context, items: items, header: header, footer: footer);
    } else {
      _logger.finest(() => "build empty");
      return buildNotListBody(Center(child: Text(tr("pagination.list.empty"))));
    }
  }
}

import 'package:fedi/app/pagination/fedi_pagination_list_loading_error_notification_overlay_builder_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

var _logger = Logger("pagination_list_dart");

abstract class PaginationListWidget<T> extends StatelessWidget {
  final bool? alwaysShowHeader;
  final Widget? header;
  final bool? alwaysShowFooter;
  final Widget? footer;
  final ScrollController? scrollController;
  final bool refreshOnFirstLoad;

  // ignore: no-empty-block
  Future additionalPreRefreshAction(BuildContext context) async {
    // nothing by default
  }

  const PaginationListWidget({
    Key? key,
    this.scrollController,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
    this.refreshOnFirstLoad = true,
  }) : super(key: key);

  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<T> items,
    required Widget? header,
    required Widget? footer,
  });

  IPaginationListBloc<PaginationPage<T>, T> retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  });

  static ListView buildItemsListView<T>({
    required BuildContext? context,
    required List<T> items,
    required Widget? header,
    required Widget? footer,
    required IndexedWidgetBuilder itemBuilder,
    required ScrollViewKeyboardDismissBehavior keyboardDismissBehavior,
  }) {
    _logger.finest(() => "buildItemsListView items ${items.length}");

    var itemCount =
        items.length + (header != null ? 1 : 0) + (footer != null ? 1 : 0);
    return ListView.builder(
      keyboardDismissBehavior: keyboardDismissBehavior,
      itemBuilder: (context, index) {
        var isFirst = index == 0;
        var isLast = index == (itemCount - 1);
        if (header != null && isFirst) {
          return header;
        } else if (footer != null && isLast) {
          return footer;
        }
        var itemIndex = index;
        if (header != null) {
          itemIndex -= 1;
        }

        var widget = itemBuilder(context, itemIndex);
        _logger.finest(() => "buildItemsListView itemIndex=$itemIndex");
        if (keyboardDismissBehavior ==
            ScrollViewKeyboardDismissBehavior.onDrag) {
          return UnfocusOnScrollAreaWidget(
            child: widget,
          );
        } else {
          return widget;
        }
      },
      itemCount: itemCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
        retrievePaginationListBloc(context, listen: true);
    _logger.finest(() => "build "
        "paginationListBloc.isRefreshedAtLeastOnce=${paginationListBloc.refreshState}");

    if (paginationListBloc.refreshState !=
            FediListSmartRefresherLoadingState.loaded &&
        refreshOnFirstLoad) {
      askToRefresh(context);
    }

    return Stack(
      children: [
        Provider<IPaginationListBloc>.value(
          value: paginationListBloc,
          child:
              const FediPaginationListLoadingErrorNotificationOverlayBuilderWidget(),
        ),
        buildPaginationListBody(
          paginationListBloc,
        ),
      ],
    );
  }

  Widget buildPaginationListBody(
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc,
  ) =>
      AsyncInitLoadingWidget(
        asyncInitLoadingBloc: paginationListBloc,
        loadingFinishedBuilder: (BuildContext context) =>
            buildPaginationInitializedBody(context, paginationListBloc),
      );

  Widget buildPaginationInitializedBody(
    BuildContext context,
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc,
  ) {
    // Stream builder outside SmartRefresher because
    // SmartRefresher require ScrollView as child
    // If child is StreamBuilder SmartRefresher builds all items widget
    // instead visible only
    return StreamBuilder<List<T>>(
      stream: paginationListBloc.itemsDistinctStream,
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
            context,
            items,
            paginationListBloc,
          ),
        );
      },
    );
  }

  void askToRefresh(BuildContext context) {
    _logger.finest(() => "askToRefresh");
    // delay required to be sure that widget will be built during initial
    // refresh
    Future.delayed(
      // ignore: no-magic-number
      Duration(milliseconds: 100),
      () {
        _logger.finest(() => "askToRefresh delayed");

        IPaginationListBloc<PaginationPage<T>, T> paginationListBloc =
            retrievePaginationListBloc(context, listen: false);

        final refreshState = paginationListBloc.refreshState;
        _logger.finest(() => "askToRefresh refreshState $refreshState");
        if (refreshState != FediListSmartRefresherLoadingState.loading &&
            refreshState != FediListSmartRefresherLoadingState.loaded) {
          paginationListBloc.refreshWithController();
        }
      },
    );
  }

  Widget buildNotListBody(Widget child) {
    _logger.finest(() => "buildNotListBody "
        "alwaysShowHeader=$alwaysShowHeader "
        "alwaysShowFooter=$alwaysShowFooter ");
    if (alwaysShowHeader != true && alwaysShowFooter != true) {
      return child;
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (alwaysShowHeader == true) header!,
          Expanded(child: child),
          if (alwaysShowFooter == true) footer!,
        ],
      );
    }
  }

  Widget buildSmartRefresherBody(
    BuildContext context,
    List<T>? items,
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc,
  );

  Widget buildSmartRefresher(
    IPaginationListBloc paginationListBloc,
    BuildContext context,
    List<T>? items,
    RefreshController refreshController,
    ScrollController? scrollController,
    Widget Function(BuildContext context) smartRefresherBodyBuilder,
  );
}

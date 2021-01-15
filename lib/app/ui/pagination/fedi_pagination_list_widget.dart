import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/list/list_refresh_header_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("fedi_pagination_list_widget.dart");

abstract class FediPaginationListWidget<T> extends PaginationListWidget<T> {
  final Widget customLoadingWidget;
  final Widget customEmptyWidget;

  const FediPaginationListWidget({
    Key key,
    ScrollController scrollController,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    this.customLoadingWidget,
    this.customEmptyWidget,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          scrollController: scrollController,
          header: header,
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  Widget buildPaginationListBody(
      IPaginationListBloc<PaginationPage<T>, T> paginationListBloc) {
    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: paginationListBloc,
      loadingFinishedBuilder: (BuildContext context) {
        return buildPaginationInitializedBody(context, paginationListBloc);
      },
    );
  }

  @override
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
            var success;
            try {
              success = await additionalPreRefreshAction(context);
            } catch (e, stackTrace) {
              success = false;
              _logger.severe(
                  () => "additionalPreRefreshAction()", e, stackTrace);
            }

            _logger.finest(() => "additionalPreRefreshAction() $success");
            var state = await paginationListBloc.refreshWithoutController();
            _logger.finest(
                () => "paginationListBloc.refreshWithoutController() $state");
            return state;
          },
        );
      },
      onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
          controller: refreshController,
          action: paginationListBloc.loadMoreWithoutController),
      child: smartRefresherBodyBuilder(context),
    );
  }

  @override
  Widget buildSmartRefresherBody(BuildContext context, List<T> items,
      IPaginationListBloc<PaginationPage<T>, T> paginationListBloc) {
    _logger.finest(() => "buildSmartRefresherBody ${items?.length}");
    if (items == null) {
      _logger.finest(() => "build loading");
      return buildNotListBody(
        const Center(
          child: FediCircularProgressIndicator(),
        ),
      );
    }

    if (items?.isNotEmpty == true) {
      return buildItemsCollectionView(
          context: context, items: items, header: header, footer: footer);
    } else {
      _logger.finest(() => "build empty");
      return buildNotListBody(
        StreamBuilder<PaginationListLoadingState>(
          stream: paginationListBloc.refreshStateStream,
          initialData: paginationListBloc.refreshState,
          builder: (context, snapshot) {
            var refreshState = snapshot.data;

            switch (refreshState) {
              case PaginationListLoadingState.initialized:
              case PaginationListLoadingState.loading:
                return customLoadingWidget ??
                    const Center(
                      child: FediCircularProgressIndicator(),
                    );
              case PaginationListLoadingState.failed:
              case PaginationListLoadingState.loaded:
              default:
                return customEmptyWidget ??
                    Center(
                      child: FediEmptyWidget(
                        title: S.of(context).pagination_list_empty,
                      ),
                    );
                break;
            }
          },
        ),
      );
    }
  }
}

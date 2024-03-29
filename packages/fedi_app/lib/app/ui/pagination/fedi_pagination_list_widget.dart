import 'package:fedi_app/app/async/smart_refresher/async_smart_refresher_helper.dart';
import 'package:fedi_app/app/list/list_loading_footer_widget.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi_app/app/ui/list/fedi_list_smart_refresher_refresh_indicator.dart';
import 'package:fedi_app/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_widget.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger('fedi_pagination_list_widget.dart');

abstract class FediPaginationListWidget<T> extends PaginationListWidget<T> {
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;
  final bool isNeedToAddPaddingForUiTests;

  const FediPaginationListWidget({
    Key? key,
    ScrollController? scrollController,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    this.customLoadingWidget,
    this.customEmptyWidget,
    required this.isNeedToAddPaddingForUiTests,
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
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc,
  ) =>
      FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: paginationListBloc,
        loadingFinishedBuilder: (BuildContext context) =>
            buildPaginationInitializedBody(context, paginationListBloc),
      );

  @override
  Widget buildSmartRefresher(
    IPaginationListBloc paginationListBloc,
    BuildContext context,
    List<T>? items,
    RefreshController refreshController,
    ScrollController? scrollController,
    Widget Function(BuildContext context) smartRefresherBodyBuilder,
  ) {
    _logger.finest(() => 'buildSmartRefresher items ${items?.length}');

    return FediListSmartRefresherWidget(
      //      key: key,
      enablePullDown: true,
      enablePullUp: true,
      isNeedToAddPaddingForUiTests: isNeedToAddPaddingForUiTests,
      header: const FediListSmartRefresherRefreshIndicator(),
      footer: const ListLoadingFooterWidget(),
      controller: refreshController,
      scrollController: scrollController,
      primary: scrollController == null,
      onRefresh: () {
        _logger.finest(() => 'refresh');

        return AsyncSmartRefresherHelper.doAsyncRefresh(
          controller: refreshController,
          action: () async {
            bool success;
            try {
              await additionalPreRefreshAction(context);
              success = true;
              // ignore: avoid_catches_without_on_clauses
            } catch (e, stackTrace) {
              success = false;
              _logger.severe(
                () => 'additionalPreRefreshAction()',
                e,
                stackTrace,
              );
            }

            _logger.finest(() => 'additionalPreRefreshAction() $success');
            var state = await paginationListBloc.refreshWithoutController();
            _logger.finest(
              () => 'paginationListBloc.refreshWithoutController() $state',
            );

            return state;
          },
        );
      },
      onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
        controller: refreshController,
        action: paginationListBloc.loadMoreWithoutController,
      ),
      child: smartRefresherBodyBuilder(context),
    );
  }

  @override
  Widget buildSmartRefresherBody(
    BuildContext context,
    List<T>? items,
    IPaginationListBloc<PaginationPage<T>, T> paginationListBloc,
  ) {
    _logger.finest(() => 'buildSmartRefresherBody ${items?.length}');
    if (items == null) {
      _logger.finest(() => 'build loading');

      return buildNotListBody(
        const Center(
          child: FediCircularProgressIndicator(),
        ),
      );
    }

    if (items.isNotEmpty) {
      return buildItemsCollectionView(
        context: context,
        items: items,
        header: header,
        footer: footer,
      );
    } else {
      _logger.finest(() => 'build empty');

      return buildNotListBody(
        StreamBuilder<FediListSmartRefresherLoadingState>(
          stream: paginationListBloc.refreshStateStream,
          initialData: paginationListBloc.refreshState,
          builder: (context, snapshot) {
            var refreshState = snapshot.data;

            switch (refreshState) {
              case FediListSmartRefresherLoadingState.initialized:
              case FediListSmartRefresherLoadingState.loading:
                return customLoadingWidget ??
                    const Center(
                      child: FediCircularProgressIndicator(),
                    );
              case FediListSmartRefresherLoadingState.failed:
              case FediListSmartRefresherLoadingState.loaded:
              case FediListSmartRefresherLoadingState.noData:
              case null:
                return customEmptyWidget ??
                    Center(
                      child: FediEmptyWidget(
                        title: S.of(context).pagination_list_empty,
                      ),
                    );
            }
          },
        ),
      );
    }
  }
}

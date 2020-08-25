import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef Future<PaginationListLoadingState> AsyncAction();

var _logger = Logger("async_smart_refresher_helper.dart");

class AsyncSmartRefresherHelper {
  static Future<PaginationListLoadingState> doAsyncRefresh(
      {@required RefreshController controller,
      @required AsyncAction action}) async {
    _logger.finest(() => "doAsyncRefresh");
    PaginationListLoadingState state;
    try {
      state = await action();
    } catch (error, stackTrace) {
      _logger.severe(() => "doAsyncRefresh fail", error, stackTrace);
      state = PaginationListLoadingState.failed;
    }
    _logger.finest(() => "doAsyncRefresh state = $state");

    switch (state) {
      case PaginationListLoadingState.failed:
        controller.refreshFailed();
        break;
      case PaginationListLoadingState.loaded:
      case PaginationListLoadingState.noData:
        controller.refreshCompleted();
        // hack, because it is not possible to load more after refresh
        // if old "no data" state was saved
        controller.loadComplete();
        break;

      case PaginationListLoadingState.loading:
      case PaginationListLoadingState.initialized:
      default:
        throw "invalid state $state";
        break;
    }

    return state;
  }

  static Future<PaginationListLoadingState> doAsyncLoading(
      {@required RefreshController controller,
      @required AsyncAction action}) async {
    _logger.finest(() => "doAsyncLoading");
    PaginationListLoadingState state;
    try {
      state = await action();
    } catch (error, stackTrace) {
      _logger.severe(() => "doAsyncLoading fail", error, stackTrace);
      controller.loadFailed();
      state = PaginationListLoadingState.failed;
    }

    _logger.finest(() => "doAsyncLoading state = $state");

    switch (state) {
      case PaginationListLoadingState.failed:
        controller.loadFailed();
        break;
      case PaginationListLoadingState.loaded:
        controller.loadComplete();
        break;
      case PaginationListLoadingState.noData:
        controller.loadNoData();
        break;

      case PaginationListLoadingState.loading:
      case PaginationListLoadingState.initialized:
      default:
        throw "invalid state $state";
        break;
    }

    return state;
  }
}

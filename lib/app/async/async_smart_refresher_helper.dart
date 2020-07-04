import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef Future<bool> AsyncAction();

var _logger = Logger("async_smart_refresher_helper.dart");

class AsyncSmartRefresherHelper {
  static Future<bool> doAsyncRefresh(
      {@required RefreshController controller,
      @required AsyncAction action}) async {
    _logger.finest(() => "doAsyncRefresh");
    bool success;
    try {
      success = await action();
    } catch (error, stackTrace) {
      _logger.severe(() => "doAsyncRefresh fail", error, stackTrace);
      success = false;
    }
    _logger.finest(() => "doAsyncRefresh success = $success");

    if (success) {
      controller.refreshCompleted();
    } else {
      controller.refreshFailed();
    }

    return success;
  }

  static Future<bool> doAsyncLoading(
      {@required RefreshController controller,
      @required AsyncAction action}) async {
    _logger.finest(() => "doAsyncLoading");
    bool success;
    try {
      success = await action();
    } catch (error, stackTrace) {
      _logger.severe(() => "doAsyncLoading fail", error, stackTrace);
      controller.loadFailed();
      success = false;
    }

    _logger.finest(() => "doAsyncLoading success = $success");
    if (success) {
      controller.loadComplete();
    } else {
      controller.loadNoData();
    }

    return success;
  }
}

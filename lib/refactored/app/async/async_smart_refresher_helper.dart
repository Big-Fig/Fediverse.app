import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef Future<bool> AsyncAction();

var _logger = Logger("async_smart_refresher_helper.dart");

class AsyncSmartRefresherHelper {
  static doAsyncRefresh(
      {@required RefreshController controller, @required AsyncAction action}) {
    _logger.finest(() => "doAsyncRefresh");
    action().then((success) {
      _logger.finest(() => "doAsyncRefresh success = $success");
      if (success) {
        controller.refreshCompleted();
      } else {
        controller.refreshFailed();
      }
    }).catchError((error, stackTrace) {
      _logger.severe(() => "doAsyncRefresh fail", error, stackTrace);
      controller.refreshFailed();
    });
  }

  static doAsyncLoading(
      {@required RefreshController controller, @required AsyncAction action}) {
    _logger.finest(() => "doAsyncLoading");
    action().then((success) {
      _logger.finest(() => "doAsyncLoading success = $success");
      if (success) {
        controller.loadComplete();
      } else {
        controller.loadNoData();
      }
    }).catchError((error, stackTrace) {
      _logger.severe(() => "doAsyncLoading fail", error, stackTrace);
      controller.loadFailed();
    });
  }
}

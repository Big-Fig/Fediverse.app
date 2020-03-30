import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaCachedListService<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;
  Future<List<T>> loadLocalItems(
      {@required int limit,
      @required T newerThanAccount,
      @required T olderThanAccount});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required T newerThanAccount,
      @required T olderThanAccount});
}

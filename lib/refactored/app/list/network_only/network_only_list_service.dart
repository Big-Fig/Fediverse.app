import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaNetworkOnlyListService<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<T>> loadItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required String minId,
      @required String maxId});
}

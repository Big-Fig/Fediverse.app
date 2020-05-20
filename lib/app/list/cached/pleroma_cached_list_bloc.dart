import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaCachedListBloc<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<T>> loadLocalItems(
      {@required int limit, @required T newerThan, @required T olderThan});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit, @required T newerThan, @required T olderThan});
}

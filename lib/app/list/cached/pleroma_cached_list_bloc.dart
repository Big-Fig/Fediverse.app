import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class IPleromaCachedListBloc<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<T>> loadLocalItems({
    required int? limit,
    required T? newerThan,
    required T? olderThan,
  });

  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required T? newerThan,
    required T? olderThan,
  });
}

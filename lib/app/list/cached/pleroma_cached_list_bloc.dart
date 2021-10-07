import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ICachedListBloc<T> extends DisposableOwner {
  IUnifediApiService get unifediApi;

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

import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class INetworkOnlyListBloc<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<T>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  });
}

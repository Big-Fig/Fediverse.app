import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';

abstract class INetworkOnlyListBloc<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<T>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  });
}

import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class INetworkOnlyListBloc<T> extends DisposableOwner {
  IUnifediApiService get unifediApi;

  Future<List<T>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  });
}

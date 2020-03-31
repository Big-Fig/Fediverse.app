import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaNetworkOnlyListService<T> extends DisposableOwner {
  IPleromaApi get pleromaApi;


  Future<List<T>> loadItemsFromRemoteForPage(
      {int itemsCountPerPage, String minId, String maxId});
}

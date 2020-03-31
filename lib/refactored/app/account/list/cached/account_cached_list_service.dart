import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountCachedListService extends DisposableOwner
    implements IPleromaCachedListService<IAccount> {
  static IAccountCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountCachedListService>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<IAccount>> loadLocalItems(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan});
}

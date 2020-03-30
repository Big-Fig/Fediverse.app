import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountListService extends DisposableOwner {
  static IAccountListService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountListService>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<IAccount>> loadLocalItems(
      {@required int limit,
        @required IAccount newerThanAccount,
        @required IAccount olderThanAccount});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
        @required IAccount newerThanAccount,
        @required IAccount olderThanAccount});
}

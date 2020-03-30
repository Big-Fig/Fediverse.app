import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusListService implements DisposableOwner {
  static IStatusListService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusListService>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus});

  Future preRefreshAllAction();
}

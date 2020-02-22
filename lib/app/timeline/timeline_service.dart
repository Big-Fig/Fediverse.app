import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

abstract class ITimelineService implements DisposableOwner {
  IPleromaApi get pleromaApi;

  Future<List<IStatus>> loadLocalItems({
    @required int limit,
    @required IStatus newerThanStatus,
    @required IStatus olderThanStatus
  });

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus
      });

  Future refresh();
}

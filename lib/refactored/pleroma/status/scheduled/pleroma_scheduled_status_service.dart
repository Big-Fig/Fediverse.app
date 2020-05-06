import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaScheduledStatusService implements IPleromaApi {
  static IPleromaScheduledStatusService of(BuildContext context,
          {listen: true}) =>
      Provider.of<IPleromaScheduledStatusService>(context, listen: listen);

  Future<bool> cancelScheduledStatus(
      {@required String scheduledStatusRemoteId});

  Future<IPleromaScheduledStatus> getScheduledStatus(
      {@required String scheduledStatusRemoteId});

  Future<IPleromaScheduledStatus> reScheduleStatus(
      {@required String scheduledStatusRemoteId, @required DateTime scheduledAt});

  Future<List<IPleromaScheduledStatus>> getScheduledStatuses({
    String sinceId,
    String maxId,
    int limit = 20,
  });
}

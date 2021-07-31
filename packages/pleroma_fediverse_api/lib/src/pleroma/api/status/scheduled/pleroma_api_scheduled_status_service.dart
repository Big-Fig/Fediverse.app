import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiScheduledStatusService implements IPleromaApi {
  Future<void> cancelScheduledStatus({
    required String scheduledStatusRemoteId,
  });

  Future<IPleromaApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusRemoteId,
  });

  Future<IPleromaApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusRemoteId,
    required DateTime scheduledAt,
  });

  Future<List<IPleromaApiScheduledStatus>> getScheduledStatuses({
    IPleromaApiPaginationRequest? pagination,
  });
}

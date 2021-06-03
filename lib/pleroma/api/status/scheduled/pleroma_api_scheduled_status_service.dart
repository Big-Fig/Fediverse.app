import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiScheduledStatusService implements IPleromaApi {
  static IPleromaApiScheduledStatusService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiScheduledStatusService>(
        context,
        listen: listen,
      );

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

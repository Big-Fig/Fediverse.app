import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/context/pleroma_api_status_context_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiStatusService implements IPleromaApi {
  Future<IPleromaApiStatus> getStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatusContext> getStatusContext({
    required String statusRemoteId,
  });
}

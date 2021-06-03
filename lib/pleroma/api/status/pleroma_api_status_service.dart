import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/status/context/pleroma_api_status_context_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiStatusService implements IPleromaApi {
  static IPleromaApiStatusService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApiStatusService>(context, listen: listen);

  Future<IPleromaApiStatus> getStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatusContext> getStatusContext({
    required String statusRemoteId,
  });
}

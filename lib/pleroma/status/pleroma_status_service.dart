import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/context/pleroma_status_context_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaStatusService implements IPleromaApi {
  static IPleromaStatusService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaStatusService>(context, listen: listen);

  Future<IPleromaStatus> getStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatusContext> getStatusContext({
    required String statusRemoteId,
  });
}

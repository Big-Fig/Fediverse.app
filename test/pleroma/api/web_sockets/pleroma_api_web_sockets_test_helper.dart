import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_model.dart';

// ignore_for_file: no-magic-number
class PleromaApiWebSocketsTestHelper {
  static PleromaApiWebSocketsEvent createTestPleromaApiWebSocketsEvent({
    required String seed,
  }) =>
      PleromaApiWebSocketsEvent(
        event: seed + "event",
        payload: seed + "payload",
      );
}

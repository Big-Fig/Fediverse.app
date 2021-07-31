import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

// ignore_for_file: no-magic-number
class PleromaApiWebSocketsTestHelper {
  static PleromaApiWebSocketsEvent createTestPleromaApiWebSocketsEvent({
    required String seed,
  }) =>
      PleromaApiWebSocketsEvent(
        event: seed + 'event',
        payload: seed + 'payload',
      );
}

// ignore_for_file: no-magic-number
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

class WebSocketsSettingsModelMockHelper {
  static WebSocketsSettings createTestWebSocketsSettings({
    required String seed,
  }) =>
      WebSocketsSettings.fromEnum(
        handlingType:
            WebSocketsMode.values[seed.hashCode % WebSocketsMode.values.length],
      );
}

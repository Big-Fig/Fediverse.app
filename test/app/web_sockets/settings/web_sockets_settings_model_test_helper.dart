// ignore_for_file: no-magic-number
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';

class WebSocketsSettingsModelTestHelper {
  static WebSocketsSettings createTestWebSocketsSettings({
    required String seed,
  }) =>
      WebSocketsSettings.fromEnum(
        handlingType: WebSocketsHandlingType
            .values[seed.hashCode % WebSocketsHandlingType.values.length],
      );
}

import 'package:easy_dispose/easy_dispose.dart';
import '../web_sockets_mode_sealed.dart';

abstract class IWebSocketsModeSettingsBloc implements IDisposable {
  WebSocketsMode get mode;

  Stream<WebSocketsMode> get modeStream;

  void changeMode(WebSocketsMode mode);
}

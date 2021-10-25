import 'package:easy_dispose/easy_dispose.dart';
import 'package:rxdart/rxdart.dart';

import '../web_sockets_mode_sealed.dart';
import 'web_sockets_mode_settings_bloc.dart';

class WebSocketsModeSettingsBloc extends DisposableOwner
    implements IWebSocketsModeSettingsBloc {
  BehaviorSubject<WebSocketsMode> modeSubject = BehaviorSubject();

  @override
  WebSocketsMode get mode => modeSubject.value;

  @override
  Stream<WebSocketsMode> get modeStream => modeSubject.stream;

  WebSocketsModeSettingsBloc({
    required WebSocketsMode mode,
  }) : modeSubject = BehaviorSubject.seeded(mode) {
    modeSubject.disposeWith(this);
  }

  @override
  void changeMode(WebSocketsMode mode) => modeSubject.add(mode);
}

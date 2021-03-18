import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:mockito/mockito.dart';

class WebSocketsChannelConfigMock<T extends WebSocketsEvent> extends Mock
    implements IWebSocketsChannelConfig<T> {}

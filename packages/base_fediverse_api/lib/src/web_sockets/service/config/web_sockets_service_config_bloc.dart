import '../../handling_type/web_sockets_handling_type_model.dart';

abstract class IWebSocketsServiceConfigBloc {
  WebSocketsHandlingType get handlingType;

  Stream<WebSocketsHandlingType> get handlingTypeStream;
}

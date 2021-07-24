import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/web_sockets/service/config/web_sockets_service_config_bloc.dart';

class WebSocketsServiceConfigBloc implements IWebSocketsServiceConfigBloc {
  @override
  final WebSocketsHandlingType handlingType;

  WebSocketsServiceConfigBloc(this.handlingType);

  @override
  Stream<WebSocketsHandlingType> get handlingTypeStream =>
      Stream.value(handlingType);
}

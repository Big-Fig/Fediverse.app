import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/notifications/websockets/pleroma_notifications_websockets_service.dart';
import 'package:web_socket_channel/io.dart';

class PleromaNotificationsWebSocketsService
    extends IPleromaNotificationsWebSocketsService {

  // TODO: should be refactored as constructor argument
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;
  // TODO: should be refactored as constructor argument
  String get accessToken  => CurrentInstance.instance.currentClient.accessToken;

  IOWebSocketChannel _channel;

  createNewChannel() {
    IOWebSocketChannel.connect(url)
  }

}


import 'package:fedi/Pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
import 'package:flutter/widgets.dart';

abstract class PleromaNotificationsWebSocketsChannel implements IPleromaNotificationsWebSocketsChannel {

    final Uri uri;
    PleromaNotificationsWebSocketsChannel({@required this.uri});


}
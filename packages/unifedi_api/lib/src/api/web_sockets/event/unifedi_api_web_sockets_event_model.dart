import '../../account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model.dart';
import '../../announcement/unifedi_api_announcement_model.dart';
import '../../chat/unifedi_api_chat_model.dart';
import '../../conversation/unifedi_api_conversation_model.dart';
import '../../notification/unifedi_api_notification_model.dart';
import '../../status/unifedi_api_status_model.dart';
import '../channel/unifedi_api_web_sockets_channel_model.dart';
import 'type/unifedi_api_web_sockets_event_type_sealed.dart';

typedef UnifediApiWebSocketsEventListener = Function(
  IUnifediApiWebSocketsEvent event,
);

abstract class IUnifediApiWebSocketsEvent {
  IUnifediApiWebSocketsChannel get channel;

  String get type;

  IUnifediApiStatus? get status;

  IUnifediApiNotification? get notification;

  IUnifediApiAnnouncement? get announcement;

  IUnifediApiChat? get chat;

  IUnifediApiConversation? get conversation;

  IUnifediApiAccountRelationshipFollowUpdate? get followUpdate;

  String? get id;
}

extension IUnifediApiWebSocketsEventExtension on IUnifediApiWebSocketsEvent {
  UnifediApiWebSocketsEventType get typeAsUnifediApi =>
      UnifediApiWebSocketsEventType.fromStringValue(
        type,
      );
}

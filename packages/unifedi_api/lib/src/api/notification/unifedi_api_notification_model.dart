import '../account/report/unifedi_api_account_report_model.dart';
import '../account/unifedi_api_account_model.dart';
import '../chat/message/unifedi_api_chat_message_model.dart';
import '../status/unifedi_api_status_model.dart';
import '../unifedi_api_model.dart';
import 'type/unifedi_api_notification_type_sealed.dart';

abstract class IUnifediApiNotification implements IUnifediApiResponse {
  IUnifediApiAccount? get account;

  DateTime get createdAt;

  String get id;

  String get type;

  IUnifediApiStatus? get status;

  IUnifediApiAccount? get target;

  IUnifediApiChatMessage? get chatMessage;

  String? get emoji;

  IUnifediApiAccountReport? get report;

  bool? get isSeen;

  bool? get isMuted;
}

extension IUnifediApiNotificationTypeExtension on IUnifediApiNotification {
  UnifediApiNotificationType get typeAsUnifediApi =>
      type.toUnifediApiNotificationType();
}

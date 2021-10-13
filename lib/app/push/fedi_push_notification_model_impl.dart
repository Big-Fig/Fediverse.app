import 'package:fedi/app/push/fedi_push_notification_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'fedi_push_notification_model_impl.g.dart';

@JsonSerializable(explicitToJson: true)
class FediPushNotification implements IFediPushNotification {
  @override
  final String account;

  @override
  @JsonKey(name: 'notification_action')
  final String? notificationAction;

  @override
  @JsonKey(name: 'notification_action_input')
  final String? notificationActionInput;

  @override
  @JsonKey(name: 'notification_id')
  final String notificationId;

  @override
  @JsonKey(name: 'notification_type')
  final String notificationType;

  @override
  final String server;

  @override
  @JsonKey(name: 'notification')
  final UnifediApiNotification? unifediApiNotification;

  FediPushNotification({
    required this.account,
    required this.notificationAction,
    required this.notificationActionInput,
    required this.notificationId,
    required this.notificationType,
    required this.server,
    required this.unifediApiNotification,
  });

  @override
  String toString() => 'FediPushNotification{'
      'account: $account, '
      'notificationAction: $notificationAction, '
      'notificationActionInput: $notificationActionInput, '
      'notificationId: $notificationId, '
      'notificationType: $notificationType, '
      'server: $server, '
      'unifediApiNotification: $unifediApiNotification'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediPushNotification &&
          runtimeType == other.runtimeType &&
          account == other.account &&
          notificationAction == other.notificationAction &&
          notificationActionInput == other.notificationActionInput &&
          notificationId == other.notificationId &&
          notificationType == other.notificationType &&
          server == other.server &&
          unifediApiNotification == other.unifediApiNotification;

  @override
  int get hashCode =>
      account.hashCode ^
      notificationAction.hashCode ^
      notificationActionInput.hashCode ^
      notificationId.hashCode ^
      notificationType.hashCode ^
      server.hashCode ^
      unifediApiNotification.hashCode;

  static FediPushNotification fromJson(Map<String, dynamic> json) =>
      _$FediPushNotificationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FediPushNotificationToJson(this);
}

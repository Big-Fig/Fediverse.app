import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/push/push_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'notifications_push_handler_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 66)
@JsonSerializable(explicitToJson: true)
class NotificationsPushHandlerMessage {
  @HiveField(0)
  final UnifediApiPushMessageBody body;
  @HiveField(1)
  @JsonKey(name: 'push_message')
  final PushMessage pushMessage;

  NotificationsPushHandlerMessage({
    required this.body,
    required this.pushMessage,
  });

  @override
  String toString() {
    return 'NotificationsPushHandlerMessage{'
        'body: $body, '
        'pushMessage: $pushMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsPushHandlerMessage &&
          runtimeType == other.runtimeType &&
          body == other.body &&
          pushMessage == other.pushMessage;

  NotificationsPushHandlerMessage copyWith({
    UnifediApiPushMessageBody? body,
    PushMessage? pushMessage,
  }) =>
      NotificationsPushHandlerMessage(
        body: body ?? this.body,
        pushMessage: pushMessage ?? this.pushMessage,
      );

  @override
  int get hashCode => body.hashCode ^ pushMessage.hashCode;

  static NotificationsPushHandlerMessage fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushHandlerMessageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NotificationsPushHandlerMessageToJson(this);
}

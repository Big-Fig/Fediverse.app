import 'package:fedi_app/app/push/fedi_push_notification_model_impl.dart';
import 'package:fedi_app/push/push_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'notifications_push_handler_model.freezed.dart';

part 'notifications_push_handler_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 66)
@freezed
class NotificationsPushHandlerMessage with _$NotificationsPushHandlerMessage {
  const factory NotificationsPushHandlerMessage({
    @HiveField(0) required FediPushNotification body,
    @HiveField(1)
    @JsonKey(name: 'push_message')
        required PushMessage pushMessage,
  }) = _NotificationsPushHandlerMessage;

  factory NotificationsPushHandlerMessage.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushHandlerMessageFromJson(json);
}

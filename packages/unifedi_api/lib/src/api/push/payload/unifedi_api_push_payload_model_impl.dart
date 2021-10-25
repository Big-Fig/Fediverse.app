import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'unifedi_api_push_payload_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_push_payload_model_impl.freezed.dart';

part 'unifedi_api_push_payload_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPushPayload
    with _$UnifediApiPushPayload
    implements IUnifediApiPushPayload {
  const factory UnifediApiPushPayload({
    @HiveField(0)
    @JsonKey(name: 'notification_id')
        required String notificationId,
    @HiveField(1)
    @JsonKey(name: 'notification_type')
        required String notificationType,
    @HiveField(2) required String? title,
    @HiveField(3) required String? body,
    @HiveField(4) required String? icon,
  }) = _UnifediApiPushPayload;

  factory UnifediApiPushPayload.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushPayloadFromJson(json);
}

extension IUnifediApiPushPayloadInterfaceExtension on IUnifediApiPushPayload {
  UnifediApiPushPayload toUnifediApiPushPayload({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPushPayload(
          notificationId: notificationId,
          notificationType: notificationType,
          title: title,
          body: body,
          icon: icon,
        ),
        forceNewObject: forceNewObject,
      );
}

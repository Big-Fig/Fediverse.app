import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'pleroma_api_push_payload_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_push_payload_model_impl.freezed.dart';

part 'pleroma_api_push_payload_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiPushPayload
    with _$PleromaApiPushPayload
    implements IPleromaApiPushPayload {
  const factory PleromaApiPushPayload({
    @HiveField(0)
    @JsonKey(name: 'notification_id')
        required String notificationId,
    @HiveField(1)
    @JsonKey(name: 'notification_type')
        required String notificationType,
    @HiveField(2) required String? title,
    @HiveField(3) required String? body,
    @HiveField(4) required String? icon,
  }) = _PleromaApiPushPayload;

  factory PleromaApiPushPayload.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushPayloadFromJson(json);
}

extension IPleromaApiPushPayloadInterfaceExtension on IPleromaApiPushPayload {
  PleromaApiPushPayload toPleromaApiPushPayload({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPushPayload(
          notificationId: notificationId,
          notificationType: notificationType,
          title: title,
          body: body,
          icon: icon,
        ),
        forceNewObject: forceNewObject,
      );
}

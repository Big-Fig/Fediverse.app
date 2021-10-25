import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/push/payload/unifedi_api_push_payload_model.dart';
import '../../notification/type/unifedi_api_notification_type_sealed_pleroma_converter.dart';

part 'unifedi_api_push_payload_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_push_payload_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushPayloadPleromaAdapter
    with _$UnifediApiPushPayloadPleromaAdapter
    implements IUnifediApiPushPayload {
  const UnifediApiPushPayloadPleromaAdapter._();
  const factory UnifediApiPushPayloadPleromaAdapter(
    @HiveField(0) PleromaApiPushPayload value,
  ) = _UnifediApiPushPayloadPleromaAdapter;

  @override
  String? get body => value.body;

  @override
  String? get icon => value.icon;

  @override
  String get notificationId => value.notificationId;

  @override
  String get notificationType => value.notificationTypeAsPleromaApi
      .toUnifediApiNotificationType()
      .stringValue;

  @override
  String? get title => value.title;
  factory UnifediApiPushPayloadPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushPayloadPleromaAdapterFromJson(json);
}

extension PleromaApiPushPayloadUnifediExtension on IPleromaApiPushPayload {
  UnifediApiPushPayloadPleromaAdapter toUnifediApiPushPayloadPleromaAdapter() =>
      UnifediApiPushPayloadPleromaAdapter(
        toPleromaApiPushPayload(),
      );
}

extension PleromaApiPushPayloadUnifediListExtension
    on List<IPleromaApiPushPayload> {
  List<UnifediApiPushPayloadPleromaAdapter>
      toUnifediApiPushPayloadPleromaAdapterList() => map(
            (item) => item.toUnifediApiPushPayloadPleromaAdapter(),
          ).toList();
}

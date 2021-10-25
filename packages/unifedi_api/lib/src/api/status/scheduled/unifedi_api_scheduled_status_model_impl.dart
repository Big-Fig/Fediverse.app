import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../media/attachment/unifedi_api_media_attachment_model_impl.dart';
import 'params/unifedi_api_scheduled_status_params_model_impl.dart';
import 'unifedi_api_scheduled_status_model.dart';

part 'unifedi_api_scheduled_status_model_impl.freezed.dart';

part 'unifedi_api_scheduled_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiScheduledStatus
    with _$UnifediApiScheduledStatus
    implements IUnifediApiScheduledStatus {
  const factory UnifediApiScheduledStatus({
    @HiveField(0) @override required String id,
    @HiveField(1)
    @JsonKey(name: 'media_attachments')
        required List<UnifediApiMediaAttachment>? mediaAttachments,
    @HiveField(2) required UnifediApiScheduledStatusParams params,
    @HiveField(3) @JsonKey(name: 'scheduled_at') required DateTime scheduledAt,
  }) = _UnifediApiScheduledStatus;

  factory UnifediApiScheduledStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusFromJson(json);
}

extension IUnifediApiScheduledStatusInterfaceExtension
    on IUnifediApiScheduledStatus {
  UnifediApiScheduledStatus toUnifediApiScheduledStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiScheduledStatus(
          id: id,
          mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          params: params.toUnifediApiScheduledStatusParams(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
        ),
        forceNewObject: forceNewObject,
      );
}

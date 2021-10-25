import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../media/attachment/pleroma_api_media_attachment_model_impl.dart';
import 'params/pleroma_api_scheduled_status_params_model_impl.dart';
import 'pleroma_api_scheduled_status_model.dart';

part 'pleroma_api_scheduled_status_model_impl.freezed.dart';

part 'pleroma_api_scheduled_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiScheduledStatus
    with _$PleromaApiScheduledStatus
    implements IPleromaApiScheduledStatus {
  const factory PleromaApiScheduledStatus({
    @HiveField(0) @override required String id,
    @HiveField(1)
    @JsonKey(name: 'media_attachments')
        required List<PleromaApiMediaAttachment>? mediaAttachments,
    @HiveField(2) required PleromaApiScheduledStatusParams params,
    @HiveField(3) @JsonKey(name: 'scheduled_at') required DateTime scheduledAt,
  }) = _PleromaApiScheduledStatus;

  factory PleromaApiScheduledStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiScheduledStatusFromJson(json);
}

extension IPleromaApiScheduledStatusInterfaceExtension
    on IPleromaApiScheduledStatus {
  PleromaApiScheduledStatus toPleromaApiScheduledStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiScheduledStatus(
          id: id,
          mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          params: params.toPleromaApiScheduledStatusParams(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
        ),
        forceNewObject: forceNewObject,
      );
}

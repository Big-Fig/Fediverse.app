import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../poll/pleroma_api_post_status_poll_model_impl.dart';
import 'pleroma_api_schedule_post_status_model.dart';

part 'pleroma_api_schedule_post_status_model_impl.freezed.dart';

part 'pleroma_api_schedule_post_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiSchedulePostStatus
    with _$PleromaApiSchedulePostStatus
    implements IPleromaApiSchedulePostStatus {
  const factory PleromaApiSchedulePostStatus({
    @HiveField(0)
    @JsonKey(name: 'content_type')
        required String? contentType,
    @HiveField(1)
    @JsonKey(name: 'expires_in')
        required int? expiresInSeconds,
    @HiveField(2)
    @JsonKey(name: 'in_reply_to_conversation_id')
        required String? inReplyToConversationId,
    @HiveField(3)
    @JsonKey(name: 'in_reply_to_id')
        required String? inReplyToId,
    @HiveField(4)
        required String? language,
    @HiveField(5)
        required String visibility,
    @JsonKey(name: 'media_ids')
    @HiveField(6)
        required List<String>? mediaIds,
    @HiveField(7)
        required PleromaApiPostStatusPoll? poll,
    @HiveField(8)
        required bool? preview,
    @HiveField(9)
        required bool sensitive,
    @HiveField(10)
    @JsonKey(name: 'spoiler_text')
        required String? spoilerText,
    @HiveField(11)
        required String? status,
    @HiveField(12)
        required List<String>? to,
    @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString,
    )
    @HiveField(13)
        required DateTime scheduledAt,
  }) = _PleromaApiSchedulePostStatus;

  factory PleromaApiSchedulePostStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiSchedulePostStatusFromJson(json);
}

extension IPleromaApiSchedulePostStatusInterfaceExtension
    on IPleromaApiSchedulePostStatus {
  PleromaApiSchedulePostStatus toPleromaApiSchedulePostStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiSchedulePostStatus(
          contentType: contentType,
          expiresInSeconds: expiresInSeconds,
          inReplyToConversationId: inReplyToConversationId,
          inReplyToId: inReplyToId,
          language: language,
          visibility: visibility,
          mediaIds: mediaIds,
          poll: poll?.toPleromaApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          preview: preview,
          sensitive: sensitive,
          spoilerText: spoilerText,
          status: status,
          to: to,
          scheduledAt: scheduledAt,
        ),
        forceNewObject: forceNewObject,
      );
}

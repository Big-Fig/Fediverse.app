import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../poll/unifedi_api_post_status_poll_model_impl.dart';
import 'unifedi_api_schedule_post_status_model.dart';

part 'unifedi_api_schedule_post_status_model_impl.freezed.dart';

part 'unifedi_api_schedule_post_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiSchedulePostStatus
    with _$UnifediApiSchedulePostStatus
    implements IUnifediApiSchedulePostStatus {
  const factory UnifediApiSchedulePostStatus({
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
        required UnifediApiPostStatusPoll? poll,
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
  }) = _UnifediApiSchedulePostStatus;

  factory UnifediApiSchedulePostStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiSchedulePostStatusFromJson(json);
}

extension IUnifediApiSchedulePostStatusInterfaceExtension
    on IUnifediApiSchedulePostStatus {
  UnifediApiSchedulePostStatus toUnifediApiSchedulePostStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiSchedulePostStatus(
          contentType: contentType,
          expiresInSeconds: expiresInSeconds,
          inReplyToConversationId: inReplyToConversationId,
          inReplyToId: inReplyToId,
          language: language,
          visibility: visibility,
          mediaIds: mediaIds,
          poll: poll?.toUnifediApiPostStatusPoll(
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

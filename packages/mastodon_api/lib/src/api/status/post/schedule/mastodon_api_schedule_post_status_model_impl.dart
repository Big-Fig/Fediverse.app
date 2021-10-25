import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../poll/mastodon_api_post_status_poll_model_impl.dart';
import 'mastodon_api_schedule_post_status_model.dart';

part 'mastodon_api_schedule_post_status_model_impl.freezed.dart';

part 'mastodon_api_schedule_post_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiSchedulePostStatus
    with _$MastodonApiSchedulePostStatus
    implements IMastodonApiSchedulePostStatus {
  const factory MastodonApiSchedulePostStatus({
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
        required MastodonApiPostStatusPoll? poll,
    @HiveField(9)
        required bool sensitive,
    @HiveField(10)
    @JsonKey(name: 'spoiler_text')
        required String? spoilerText,
    @HiveField(11)
        required String? status,
    @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString,
    )
    @HiveField(13)
        required DateTime scheduledAt,
  }) = _MastodonApiSchedulePostStatus;

  factory MastodonApiSchedulePostStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiSchedulePostStatusFromJson(json);
}

extension IMastodonApiSchedulePostStatusInterfaceExtension
    on IMastodonApiSchedulePostStatus {
  MastodonApiSchedulePostStatus toMastodonApiSchedulePostStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiSchedulePostStatus(
          inReplyToId: inReplyToId,
          language: language,
          visibility: visibility,
          mediaIds: mediaIds,
          poll: poll?.toMastodonApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          sensitive: sensitive,
          spoilerText: spoilerText,
          status: status,
          scheduledAt: scheduledAt,
        ),
        forceNewObject: forceNewObject,
      );
}

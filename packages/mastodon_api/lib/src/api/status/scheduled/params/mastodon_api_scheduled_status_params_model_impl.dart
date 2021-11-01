import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../post/poll/mastodon_api_post_status_poll_model_impl.dart';
import 'mastodon_api_scheduled_status_params_model.dart';

part 'mastodon_api_scheduled_status_params_model_impl.freezed.dart';

part 'mastodon_api_scheduled_status_params_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiScheduledStatusParams
    with _$MastodonApiScheduledStatusParams
    implements IMastodonApiScheduledStatusParams {
  const factory MastodonApiScheduledStatusParams({
    @HiveField(1) required String? text,
    @JsonKey(name: 'media_ids') @HiveField(2) required List<String>? mediaIds,
    @HiveField(3) required bool sensitive,
    @JsonKey(name: 'spoiler_text') @HiveField(4) required String? spoilerText,
    @HiveField(5) required String visibility,
    @HiveField(6) required String? language,
    @JsonKey(name: 'scheduled_at') @HiveField(7) required DateTime? scheduledAt,
    @HiveField(8) required MastodonApiPostStatusPoll? poll,
    @JsonKey(name: 'in_reply_to_id')
    @HiveField(10)
        required String? inReplyToId,
  }) = _MastodonApiScheduledStatusParams;

  factory MastodonApiScheduledStatusParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiScheduledStatusParamsFromJson(json);
}

extension IMastodonApiScheduledStatusParamsInterfaceExtension
    on IMastodonApiScheduledStatusParams {
  MastodonApiScheduledStatusParams toMastodonApiScheduledStatusParams({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiScheduledStatusParams(
          text: text,
          mediaIds: mediaIds,
          sensitive: sensitive,
          spoilerText: spoilerText,
          visibility: visibility,
          language: language,
          scheduledAt: scheduledAt,
          poll: poll?.toMastodonApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          inReplyToId: inReplyToId,
        ),
        forceNewObject: forceNewObject,
      );
}

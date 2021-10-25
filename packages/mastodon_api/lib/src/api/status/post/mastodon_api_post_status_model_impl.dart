import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_post_status_model.dart';
import 'poll/mastodon_api_post_status_poll_model_impl.dart';

part 'mastodon_api_post_status_model_impl.freezed.dart';

part 'mastodon_api_post_status_model_impl.g.dart';
// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiPostStatus
    with _$MastodonApiPostStatus
    implements IMastodonApiPostStatus {
  const factory MastodonApiPostStatus({
    @HiveField(3)
    @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
        required String? inReplyToId,
    @HiveField(4) required String? language,
    @HiveField(5) required String visibility,
    @HiveField(6) @JsonKey(name: 'media_ids') required List<String>? mediaIds,
    @HiveField(7) required MastodonApiPostStatusPoll? poll,
    @HiveField(9) required bool sensitive,
    @HiveField(10) @JsonKey(name: 'spoiler_text') required String? spoilerText,
    @HiveField(11) required String? status,
  }) = _MastodonApiPostStatus;

  factory MastodonApiPostStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPostStatusFromJson(json);
}

extension MastodonApiPostStatusInterfaceExtension on IMastodonApiPostStatus {
  MastodonApiPostStatus toMastodonApiPostStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPostStatus(
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
        ),
        forceNewObject: forceNewObject,
      );
}

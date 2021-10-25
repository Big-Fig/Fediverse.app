import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './option/mastodon_api_poll_option_model_impl.dart';
import 'mastodon_api_poll_model.dart';

part 'mastodon_api_poll_model_impl.freezed.dart';

part 'mastodon_api_poll_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiPoll with _$MastodonApiPoll implements IMastodonApiPoll {
  const factory MastodonApiPoll({
    @HiveField(0) required bool expired,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String? id,
    @HiveField(3) required bool multiple,
    @HiveField(4) required List<MastodonApiPollOption> options,
    @HiveField(5) @JsonKey(name: 'own_votes') required List<int>? ownVotes,
    @HiveField(6) required bool? voted,
    @HiveField(7) @JsonKey(name: 'voters_count') required int? votersCount,
    @HiveField(8) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _MastodonApiPoll;

  factory MastodonApiPoll.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiPollFromJson(json);
}

extension IMastodonApiPollInterfaceExtension on IMastodonApiPoll {
  MastodonApiPoll toMastodonApiPoll({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPoll(
          expired: expired,
          expiresAt: expiresAt,
          id: id,
          multiple: multiple,
          options: options.toMastodonApiPollOptionList(
            forceNewObject: forceNewObject,
          ),
          ownVotes: ownVotes,
          voted: voted,
          votesCount: votesCount,
          votersCount: votersCount,
        ),
        forceNewObject: forceNewObject,
      );
}

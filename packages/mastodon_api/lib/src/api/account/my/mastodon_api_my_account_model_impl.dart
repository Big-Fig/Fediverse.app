import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../emoji/mastodon_api_emoji_model_impl.dart';
import '../../field/mastodon_api_field_model_impl.dart';
import 'mastodon_api_my_account_model.dart';
import 'source/mastodon_api_my_account_source_model_impl.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_my_account_model_impl.freezed.dart';

part 'mastodon_api_my_account_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiMyAccount
    with _$MastodonApiMyAccount
    implements IMastodonApiMyAccount {
  const factory MastodonApiMyAccount({
    @HiveField(0) required String username,
    @HiveField(1) required String url,
    @HiveField(2) @JsonKey(name: 'statuses_count') required int statusesCount,
    @HiveField(3) required String? note,
    @HiveField(4) required bool locked,
    @HiveField(5) required String id,
    @HiveField(6) @JsonKey(name: 'header_static') required String headerStatic,
    @HiveField(7) required String header,
    @HiveField(8) @JsonKey(name: 'following_count') required int followingCount,
    @HiveField(9) @JsonKey(name: 'followers_count') required int followersCount,
    @HiveField(10) required List<MastodonApiField>? fields,
    @HiveField(11) required List<MastodonApiEmoji>? emojis,
    @HiveField(12) @JsonKey(name: 'display_name') required String? displayName,
    @HiveField(13) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(14) required bool? bot,
    @HiveField(15) @JsonKey(name: 'avatar_static') required String avatarStatic,
    @HiveField(16) required String avatar,
    @HiveField(17) required String acct,
    @HiveField(20)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(21) required MastodonApiMyAccountSource? source,
    @HiveField(22) required bool? discoverable,
    @HiveField(23) required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(24)
        required DateTime? muteExpiresAt,
  }) = _MastodonApiMyAccount;

  factory MastodonApiMyAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiMyAccountFromJson(json);
}

extension IMastodonApiMyAccountExtension on IMastodonApiMyAccount {
  MastodonApiMyAccount toMastodonApiMyAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMyAccount(
          header: header,
          headerStatic: headerStatic,
          username: username,
          url: url,
          statusesCount: statusesCount,
          note: note,
          locked: locked,
          id: id,
          followingCount: followingCount,
          followersCount: followersCount,
          fields: fields?.toMastodonApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toMastodonApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          displayName: displayName,
          createdAt: createdAt,
          bot: bot,
          avatarStatic: avatarStatic,
          avatar: avatar,
          acct: acct,
          lastStatusAt: lastStatusAt,
          source: source?.toMastodonApiMyAccountSource(
            forceNewObject: forceNewObject,
          ),
          discoverable: discoverable,
          suspended: suspended,
          muteExpiresAt: muteExpiresAt,
        ),
        forceNewObject: forceNewObject,
      );
}

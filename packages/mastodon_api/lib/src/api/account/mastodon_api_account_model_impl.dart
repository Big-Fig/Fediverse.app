import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../emoji/mastodon_api_emoji_model_impl.dart';
import '../field/mastodon_api_field_model_impl.dart';
import 'mastodon_api_account_model.dart';

part 'mastodon_api_account_model_impl.freezed.dart';

part 'mastodon_api_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiAccount
    with _$MastodonApiAccount
    implements IMastodonApiAccount {
  const factory MastodonApiAccount({
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
    @HiveField(21) required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(22)
        required DateTime? muteExpiresAt,
  }) = _MastodonApiAccount;

  factory MastodonApiAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiAccountFromJson(json);
}

extension IMastodonApiAccountInterfaceExtension on IMastodonApiAccount {
  MastodonApiAccount toMastodonApiAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccount(
          id: id,
          username: username,
          url: url,
          note: note,
          locked: locked,
          headerStatic: headerStatic,
          header: header,
          followingCount: followingCount,
          followersCount: followersCount,
          statusesCount: statusesCount,
          displayName: displayName,
          createdAt: createdAt,
          bot: bot,
          avatarStatic: avatarStatic,
          avatar: avatar,
          acct: acct,
          lastStatusAt: lastStatusAt,
          fields: fields?.toMastodonApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toMastodonApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          suspended: suspended,
          muteExpiresAt: muteExpiresAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiAccountInterfaceListExtension
    on List<IMastodonApiAccount> {
  List<MastodonApiAccount> toMastodonApiAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiAccount item) => item.toMastodonApiAccount(),
        forceNewObject: forceNewObject,
      );
}

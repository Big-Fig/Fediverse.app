import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../account/relationship/unifedi_api_account_relationship_model_impl.dart';
import '../../emoji/unifedi_api_emoji_model_impl.dart';
import '../../field/unifedi_api_field_model_impl.dart';
import '../../tag/unifedi_api_tag_model_impl.dart';
import '../relationship/unifedi_api_account_relationship_model_impl.dart';
import 'notifications_settings/unifedi_api_my_account_notifications_settings_model_impl.dart';
import 'unifedi_api_my_account_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_my_account_model_impl.freezed.dart';

part 'unifedi_api_my_account_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiMyAccount
    with _$UnifediApiMyAccount
    implements IUnifediApiMyAccount {
  const factory UnifediApiMyAccount({
    @HiveField(0) required String username,
    @HiveField(1) required String url,
    @HiveField(2) @JsonKey(name: 'statuses_count') required int? statusesCount,
    @HiveField(3) required String? note,
    @HiveField(4) required bool? locked,
    @HiveField(5) required String id,
    @HiveField(6) @JsonKey(name: 'header_static') required String? headerStatic,
    @HiveField(7) required String? header,
    @HiveField(8)
    @JsonKey(name: 'following_count')
        required int? followingCount,
    @HiveField(9)
    @JsonKey(name: 'followers_count')
        required int? followersCount,
    @HiveField(10) required List<UnifediApiField>? fields,
    @HiveField(11) required List<UnifediApiEmoji>? emojis,
    @HiveField(12) @JsonKey(name: 'display_name') required String? displayName,
    @HiveField(13) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(14) required bool? bot,
    @HiveField(15) @JsonKey(name: 'avatar_static') required String avatarStatic,
    @HiveField(16) required String avatar,
    @HiveField(17) required String acct,
    @HiveField(20)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(22) required bool? discoverable,
    @HiveField(23)
    @JsonKey(name: 'follow_requests_count')
        required int? followRequestsCount,
    @HiveField(24) required String? fqn,
    @HiveField(25) required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(26)
        required DateTime? muteExpiresAt,
    @HiveField(26 + 1)
    @JsonKey(name: 'background_image')
        required String? backgroundImage,
    @HiveField(26 + 2) required List<UnifediApiTag>? tags,
    @HiveField(26 + 3) required UnifediApiAccountRelationship? relationship,
    @HiveField(26 + 4) @JsonKey(name: 'is_admin') required bool? isAdmin,
    @HiveField(26 + 5)
    @JsonKey(name: 'is_moderator')
        required bool? isModerator,
    @HiveField(26 + 7)
    @JsonKey(name: 'confirmation_pending')
        required bool? confirmationPending,
    @HiveField(26 + 8)
    @JsonKey(name: 'hide_favorites')
        required bool? hideFavorites,
    @HiveField(26 + 9)
    @JsonKey(name: 'hide_followers')
        required bool? hideFollowers,
    @HiveField(26 + 11)
    @JsonKey(name: 'hide_follows')
        required bool? hideFollows,
    @HiveField(26 + 12)
    @JsonKey(name: 'hide_followers_count')
        required bool? hideFollowersCount,
    @HiveField(26 + 13)
    @JsonKey(name: 'hide_follows_count')
        required bool? hideFollowsCount,

    ///  A generic map of settings for frontends.
    ///  Opaque to the backend.
    ///  Only returned in verify_credentials and update_credentials

    @HiveField(26 + 14)
    @JsonKey(name: 'settings_store')
        required Map<String, dynamic>? settingsStore,

    /// The token needed for Unifedi chat. Only returned in verify_credentials

    @HiveField(26 + 15) @JsonKey(name: 'chat_token') required String? chatToken,
    @HiveField(26 + 16) required bool? deactivated,

    ///  boolean, true when the user allows automatically follow moved
    ///  following accounts

    @HiveField(26 + 17)
    @JsonKey(name: 'allow_following_move')
        required bool? allowFollowingMove,

    /// The count of unread conversations. Only returned to the account owner.

    @HiveField(26 + 18)
    @JsonKey(name: 'unread_conversation_count')
        required int? unreadConversationCount,
    @HiveField(26 + 19)
    @JsonKey(name: 'notifications_settings')
        required UnifediApiMyAccountNotificationsSettings? notificationSettings,
    @HiveField(26 + 20)
    @JsonKey(name: 'skip_thread_containment')
        required bool? skipThreadContainment,
    @HiveField(26 + 21)
    @JsonKey(name: 'accepts_chat_messages')
        required bool? acceptsChatMessages,
    @HiveField(26 + 22)
    @JsonKey(name: 'is_confirmed')
        required bool? isConfirmed,
    @HiveField(26 + 23) required String? favicon,
    @HiveField(26 + 24) required String? apId,
    @HiveField(26 + 25)
    @JsonKey(name: 'also_known_as')
        required List<String>? alsoKnownAs,
    @HiveField(26 + 26)
    @JsonKey(name: 'unread_notifications_count')
        required int? unreadNotificationsCount,
    @HiveField(26 + 26 + 1) required String? privacy,
    @HiveField(26 + 26 + 2) required bool? sensitive,
    @HiveField(26 + 26 + 3) required String? language,
    @HiveField(26 + 26 + 6 + 1)
    @JsonKey(name: 'show_role')
        required bool? showRole,
    @HiveField(26 + 26 + 6 + 2)
    @JsonKey(name: 'no_rich_text')
        required bool? noRichText,
    @HiveField(26 + 26 + 6 + 4)
    @JsonKey(name: 'actor_type')
        required String? actorType,
  }) = _UnifediApiMyAccount;

  factory UnifediApiMyAccount.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiMyAccountFromJson(json);
}

extension IUnifediApiMyAccountExtension on IUnifediApiMyAccount {
  // ignore: long-method
  UnifediApiMyAccount toUnifediApiMyAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMyAccount(
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
          fields: fields?.toUnifediApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toUnifediApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          displayName: displayName,
          createdAt: createdAt,
          bot: bot,
          avatarStatic: avatarStatic,
          avatar: avatar,
          acct: acct,
          suspended: suspended,
          muteExpiresAt: muteExpiresAt,
          lastStatusAt: lastStatusAt,
          discoverable: discoverable,
          followRequestsCount: followRequestsCount,
          fqn: fqn,
          backgroundImage: backgroundImage,
          tags: tags?.toUnifediApiTagList(),
          relationship: relationship?.toUnifediApiAccountRelationship(),
          isAdmin: isAdmin,
          isModerator: isModerator,
          confirmationPending: confirmationPending,
          hideFavorites: hideFavorites,
          hideFollowers: hideFollowers,
          hideFollows: hideFollows,
          hideFollowersCount: hideFollowersCount,
          hideFollowsCount: hideFollowsCount,
          settingsStore: settingsStore,
          chatToken: chatToken,
          deactivated: deactivated,
          allowFollowingMove: allowFollowingMove,
          unreadConversationCount: unreadConversationCount,
          skipThreadContainment: skipThreadContainment,
          notificationSettings:
              notificationSettings?.toUnifediApiMyAccountNotificationsSettings(
            forceNewObject: forceNewObject,
          ),
          acceptsChatMessages: acceptsChatMessages,
          isConfirmed: isConfirmed,
          favicon: favicon,
          apId: apId,
          alsoKnownAs: alsoKnownAs,
          unreadNotificationsCount: unreadNotificationsCount,
          noRichText: noRichText,
          actorType: actorType,
          showRole: showRole,
          language: language,
          privacy: privacy,
          sensitive: sensitive,
        ),
        forceNewObject: forceNewObject,
      );
}

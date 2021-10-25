import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../account/relationship/pleroma_api_account_relationship_model_impl.dart';
import '../../emoji/pleroma_api_emoji_model_impl.dart';
import '../../field/pleroma_api_field_model_impl.dart';
import '../../tag/pleroma_api_tag_model_impl.dart';
import '../relationship/pleroma_api_account_relationship_model_impl.dart';
import 'notifications_settings/pleroma_api_my_account_notifications_settings_model_impl.dart';
import 'pleroma_api_my_account_model.dart';
import 'source/pleroma_api_my_account_source_model_impl.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_my_account_model_impl.freezed.dart';

part 'pleroma_api_my_account_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiMyAccount
    with _$PleromaApiMyAccount
    implements IPleromaApiMyAccount {
  const factory PleromaApiMyAccount({
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
    @HiveField(10) required List<PleromaApiField>? fields,
    @HiveField(11) required List<PleromaApiEmoji>? emojis,
    @HiveField(12) @JsonKey(name: 'display_name') required String? displayName,
    @HiveField(13) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(14) required bool? bot,
    @HiveField(15) @JsonKey(name: 'avatar_static') required String avatarStatic,
    @HiveField(16) required String avatar,
    @HiveField(17) required String acct,
    @HiveField(19) required PleromaApiMyAccountPleromaPart? pleroma,
    @HiveField(20)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(21) required PleromaApiMyAccountSource? source,
    @HiveField(22) required bool? discoverable,
    @HiveField(23)
    @JsonKey(name: 'follow_requests_count')
        required int? followRequestsCount,
    @HiveField(24) required String? fqn,
    @HiveField(25) required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(26)
        required DateTime? muteExpiresAt,
  }) = _PleromaApiMyAccount;

  factory PleromaApiMyAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiMyAccountPleromaPart
    with _$PleromaApiMyAccountPleromaPart
    implements IPleromaApiMyAccountPleromaPart {
  static PleromaApiMyAccountPleromaPart? fromJsonOrNullOnError(dynamic json) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) => PleromaApiMyAccountPleromaPart.fromJson(
          json as Map<String, dynamic>,
        ),
      );

  const factory PleromaApiMyAccountPleromaPart({
    @HiveField(1)
    @JsonKey(name: 'background_image')
        required String? backgroundImage,
    @HiveField(2) required List<PleromaApiTag>? tags,
    @HiveField(3) required PleromaApiAccountRelationship? relationship,
    @HiveField(4) @JsonKey(name: 'is_admin') required bool? isAdmin,
    @HiveField(5) @JsonKey(name: 'is_moderator') required bool? isModerator,
    @HiveField(7)
    @JsonKey(name: 'confirmation_pending')
        required bool? confirmationPending,
    @HiveField(8) @JsonKey(name: 'hide_favorites') required bool? hideFavorites,
    @HiveField(9) @JsonKey(name: 'hide_followers') required bool? hideFollowers,
    @HiveField(11) @JsonKey(name: 'hide_follows') required bool? hideFollows,
    @HiveField(12)
    @JsonKey(name: 'hide_followers_count')
        required bool? hideFollowersCount,
    @HiveField(13)
    @JsonKey(name: 'hide_follows_count')
        required bool? hideFollowsCount,

    ///  A generic map of settings for frontends.
    ///  Opaque to the backend.
    ///  Only returned in verify_credentials and update_credentials

    @HiveField(14)
    @JsonKey(name: 'settings_store')
        required Map<String, dynamic>? settingsStore,

    /// The token needed for Pleroma chat. Only returned in verify_credentials

    @HiveField(15) @JsonKey(name: 'chat_token') required String? chatToken,
    @HiveField(16) required bool? deactivated,

    ///  boolean, true when the user allows automatically follow moved
    ///  following accounts

    @HiveField(17)
    @JsonKey(name: 'allow_following_move')
        required bool? allowFollowingMove,

    /// The count of unread conversations. Only returned to the account owner.

    @HiveField(18)
    @JsonKey(name: 'unread_conversation_count')
        required int? unreadConversationCount,
    @HiveField(19)
    @JsonKey(name: 'notifications_settings')
        required PleromaApiMyAccountNotificationsSettings? notificationSettings,
    @HiveField(20)
    @JsonKey(name: 'skip_thread_containment')
        required bool? skipThreadContainment,
    @HiveField(21)
    @JsonKey(name: 'accepts_chat_messages')
        required bool? acceptsChatMessages,
    @HiveField(22) @JsonKey(name: 'is_confirmed') required bool? isConfirmed,
    @HiveField(23) required String? favicon,
    @HiveField(24) required String? apId,
    @HiveField(25)
    @JsonKey(name: 'also_known_as')
        required List<String>? alsoKnownAs,
    @HiveField(26)
    @JsonKey(name: 'unread_notifications_count')
        required int? unreadNotificationsCount,
  }) = _PleromaApiMyAccountPleromaPart;

  factory PleromaApiMyAccountPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountPleromaPartFromJson(json);
}

extension IPleromaApiMyAccountPleromaPartExtension
    on IPleromaApiMyAccountPleromaPart {
  PleromaApiMyAccountPleromaPart toPleromaApiMyAccountPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMyAccountPleromaPart(
          backgroundImage: backgroundImage,
          tags: tags?.toPleromaApiTagList(),
          relationship: relationship?.toPleromaApiAccountRelationship(),
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
              notificationSettings?.toPleromaApiMyAccountNotificationsSettings(
            forceNewObject: forceNewObject,
          ),
          acceptsChatMessages: acceptsChatMessages,
          isConfirmed: isConfirmed,
          favicon: favicon,
          apId: apId,
          alsoKnownAs: alsoKnownAs,
          unreadNotificationsCount: unreadNotificationsCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiMyAccountExtension on IPleromaApiMyAccount {
  PleromaApiMyAccount toPleromaApiMyAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMyAccount(
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
          fields: fields?.toPleromaApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toPleromaApiEmojiList(
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
          pleroma: pleroma?.toPleromaApiMyAccountPleromaPart(
            forceNewObject: forceNewObject,
          ),
          lastStatusAt: lastStatusAt,
          source: source?.toPleromaApiMyAccountSource(
            forceNewObject: forceNewObject,
          ),
          discoverable: discoverable,
          followRequestsCount: followRequestsCount,
          fqn: fqn,
        ),
        forceNewObject: forceNewObject,
      );
}

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../emoji/unifedi_api_emoji_model_impl.dart';
import '../field/unifedi_api_field_model_impl.dart';
import '../tag/unifedi_api_tag_model_impl.dart';
import 'relationship/unifedi_api_account_relationship_model_impl.dart';
import 'unifedi_api_account_model.dart';

part 'unifedi_api_account_model_impl.freezed.dart';

part 'unifedi_api_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiAccount with _$UnifediApiAccount implements IUnifediApiAccount {
  const factory UnifediApiAccount({
    @HiveField(0)
        required String username,
    @HiveField(1)
        required String url,
    @HiveField(2)
    @JsonKey(name: 'statuses_count')
        required int? statusesCount,
    @HiveField(3)
        required String? note,
    @HiveField(4)
        required bool? locked,
    @HiveField(5)
        required String id,
    @HiveField(6)
    @JsonKey(name: 'header_static')
        required String? headerStatic,
    @HiveField(7)
        required String? header,
    @HiveField(8)
    @JsonKey(name: 'following_count')
        required int? followingCount,
    @HiveField(9)
    @JsonKey(name: 'followers_count')
        required int? followersCount,
    @HiveField(10)
        required List<UnifediApiField>? fields,
    @HiveField(11)
        required List<UnifediApiEmoji>? emojis,
    @HiveField(12)
    @JsonKey(name: 'display_name')
        required String? displayName,
    @HiveField(13)
    @JsonKey(name: 'created_at')
        required DateTime createdAt,
    @HiveField(14)
        required bool? bot,
    @HiveField(15)
    @JsonKey(name: 'avatar_static')
        required String avatarStatic,
    @HiveField(16)
        required String avatar,
    @HiveField(17)
        required String acct,
    @HiveField(20)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(21)
        required String? fqn,
    @HiveField(22)
        required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(23)
        required DateTime? muteExpiresAt,
    @HiveField(23 + 1)
    @JsonKey(name: 'background_image')
        required String? backgroundImage,
    @HiveField(23 + 2)
    @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
        required List<UnifediApiTag>? tags,
    @HiveField(23 + 3)
    @JsonKey(
      fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError,
    )
        required UnifediApiAccountRelationship? relationship,
    @HiveField(23 + 4)
    @JsonKey(name: 'is_admin')
        required bool? isAdmin,
    @HiveField(23 + 5)
    @JsonKey(name: 'is_moderator')
        required bool? isModerator,
    @HiveField(23 + 7)
    @JsonKey(name: 'confirmation_pending')
        required bool? confirmationPending,
    @HiveField(23 + 8)
    @JsonKey(name: 'hide_favorites')
        required bool? hideFavorites,
    @HiveField(23 + 9)
    @JsonKey(name: 'hide_followers')
        required bool? hideFollowers,
    @HiveField(23 + 11)
    @JsonKey(name: 'hide_follows')
        required bool? hideFollows,
    @HiveField(23 + 12)
    @JsonKey(name: 'hide_followers_count')
        required bool? hideFollowersCount,
    @HiveField(23 + 13)
    @JsonKey(name: 'hide_follows_count')
        required bool? hideFollowsCount,
    @HiveField(23 + 16)
        required bool? deactivated,
    @HiveField(23 + 17)
    @JsonKey(name: 'allow_following_move')
        required bool? allowFollowingMove,
    @HiveField(23 + 18)
    @JsonKey(name: 'skip_thread_containment')
        required bool? skipThreadContainment,
    @HiveField(23 + 19)
    @JsonKey(name: 'accepts_chat_messages')
        required bool? acceptsChatMessages,
    @HiveField(23 + 20)
    @JsonKey(name: 'is_confirmed')
        required bool? isConfirmed,
    @HiveField(23 + 21)
        required String? favicon,
    @HiveField(23 + 22)
        required String? apId,
    @HiveField(23 + 23)
    @JsonKey(
      name: 'also_known_as',
      fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError,
    )
        required List<String>? alsoKnownAs,
  }) = _UnifediApiAccount;

  factory UnifediApiAccount.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiAccountFromJson(json);

  static List<String>? fromJsonAlsoKnownAsListOrNullOnError(dynamic json) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) {
          var iterable = json as Iterable;

          return iterable
              .map(
                (dynamic item) => item as String,
              )
              .toList();
        },
      );
}

extension IUnifediApiAccountInterfaceExtension on IUnifediApiAccount {
  // ignore: long-method
  UnifediApiAccount toUnifediApiAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccount(
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
          fields: fields?.toUnifediApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toUnifediApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          fqn: fqn,
          suspended: suspended,
          muteExpiresAt: muteExpiresAt,
          backgroundImage: backgroundImage,
          tags: tags?.toUnifediApiTagList(
            forceNewObject: forceNewObject,
          ),
          relationship: relationship?.toUnifediApiAccountRelationship(
            forceNewObject: forceNewObject,
          ),
          isAdmin: isAdmin,
          isModerator: isModerator,
          confirmationPending: confirmationPending,
          hideFavorites: hideFavorites,
          hideFollowers: hideFollowers,
          hideFollows: hideFollows,
          hideFollowersCount: hideFollowersCount,
          hideFollowsCount: hideFollowsCount,
          deactivated: deactivated,
          allowFollowingMove: allowFollowingMove,
          skipThreadContainment: skipThreadContainment,
          acceptsChatMessages: acceptsChatMessages,
          apId: apId,
          isConfirmed: isConfirmed,
          alsoKnownAs: alsoKnownAs,
          favicon: favicon,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiAccountInterfaceListExtension on List<IUnifediApiAccount> {
  List<UnifediApiAccount> toUnifediApiAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiAccount item) => item.toUnifediApiAccount(),
        forceNewObject: forceNewObject,
      );
}

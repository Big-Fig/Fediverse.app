import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../emoji/pleroma_api_emoji_model_impl.dart';
import '../field/pleroma_api_field_model_impl.dart';
import '../tag/pleroma_api_tag_model_impl.dart';
import 'pleroma_api_account_model.dart';
import 'relationship/pleroma_api_account_relationship_model_impl.dart';

part 'pleroma_api_account_model_impl.freezed.dart';

part 'pleroma_api_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiAccount with _$PleromaApiAccount implements IPleromaApiAccount {
  const factory PleromaApiAccount({
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
    @HiveField(19) required PleromaApiAccountPleromaPart? pleroma,
    @HiveField(20)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(21) required String? fqn,
    @HiveField(22) required bool? suspended,
    @JsonKey(name: 'mute_expires_at')
    @HiveField(23)
        required DateTime? muteExpiresAt,
  }) = _PleromaApiAccount;

  factory PleromaApiAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiAccountPleromaPart
    with _$PleromaApiAccountPleromaPart
    implements IPleromaApiAccountPleromaPart {
  const factory PleromaApiAccountPleromaPart({
    @HiveField(1)
    @JsonKey(name: 'background_image')
        required String? backgroundImage,
    @HiveField(2)
    //  Pleroma return List<String> instead of List<PleromaTag>
    // for example at accounts/verify_credentials endpoint
    @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
        required List<PleromaApiTag>? tags,
    @HiveField(3)
    @JsonKey(
      fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError,
    )
        required PleromaApiAccountRelationship? relationship,
    @HiveField(4)
    @JsonKey(name: 'is_admin')
        required bool? isAdmin,
    @HiveField(5)
    @JsonKey(name: 'is_moderator')
        required bool? isModerator,
    @HiveField(7)
    @JsonKey(name: 'confirmation_pending')
        required bool? confirmationPending,
    @HiveField(8)
    @JsonKey(name: 'hide_favorites')
        required bool? hideFavorites,
    @HiveField(9)
    @JsonKey(name: 'hide_followers')
        required bool? hideFollowers,
    @HiveField(11)
    @JsonKey(name: 'hide_follows')
        required bool? hideFollows,
    @HiveField(12)
    @JsonKey(name: 'hide_followers_count')
        required bool? hideFollowersCount,
    @HiveField(13)
    @JsonKey(name: 'hide_follows_count')
        required bool? hideFollowsCount,
    @HiveField(16)
        required bool? deactivated,

    ///  boolean, true when the user allows automatically follow moved
    ///  following accounts

    @HiveField(17)
    @JsonKey(name: 'allow_following_move')
        required bool? allowFollowingMove,
    @HiveField(18)
    @JsonKey(name: 'skip_thread_containment')
        required bool? skipThreadContainment,
    @HiveField(19)
    @JsonKey(name: 'accepts_chat_messages')
        required bool? acceptsChatMessages,
    @HiveField(20)
    @JsonKey(name: 'is_confirmed')
        required bool? isConfirmed,
    @HiveField(21)
        required String? favicon,
    @HiveField(22)
        required String? apId,
    @HiveField(23)
    @JsonKey(
      name: 'also_known_as',
      fromJson:
          PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError,
    )
        required List<String>? alsoKnownAs,
  }) = _PleromaApiAccountPleromaPart;

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

  factory PleromaApiAccountPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountPleromaPartFromJson(json);

  static PleromaApiAccountPleromaPart? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) =>
            PleromaApiAccountPleromaPart.fromJson(json as Map<String, dynamic>),
      );
}

extension IPleromaApiAccountInterfaceExtension on IPleromaApiAccount {
  PleromaApiAccount toPleromaApiAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccount(
          pleroma: pleroma?.toPleromaApiAccountPleromaPart(
            forceNewObject: forceNewObject,
          ),
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
          fields: fields?.toPleromaApiFieldList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toPleromaApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          fqn: fqn,
          suspended: suspended,
          muteExpiresAt: muteExpiresAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAccountInterfaceListExtension on List<IPleromaApiAccount> {
  List<PleromaApiAccount> toPleromaApiAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiAccount item) => item.toPleromaApiAccount(),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAccountPleromaPartInterfaceExtension
    on IPleromaApiAccountPleromaPart {
  PleromaApiAccountPleromaPart toPleromaApiAccountPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccountPleromaPart(
          backgroundImage: backgroundImage,
          tags: tags?.toPleromaApiTagList(
            forceNewObject: forceNewObject,
          ),
          relationship: relationship?.toPleromaApiAccountRelationship(
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

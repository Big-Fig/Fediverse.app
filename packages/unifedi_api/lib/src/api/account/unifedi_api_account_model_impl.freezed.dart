// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccount _$UnifediApiAccountFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccount.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountTearOff {
  const _$UnifediApiAccountTearOff();

  _UnifediApiAccount call(
      {@HiveField(0)
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
      @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
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
      @JsonKey(name: 'also_known_as', fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
          required List<String>? alsoKnownAs}) {
    return _UnifediApiAccount(
      username: username,
      url: url,
      statusesCount: statusesCount,
      note: note,
      locked: locked,
      id: id,
      headerStatic: headerStatic,
      header: header,
      followingCount: followingCount,
      followersCount: followersCount,
      fields: fields,
      emojis: emojis,
      displayName: displayName,
      createdAt: createdAt,
      bot: bot,
      avatarStatic: avatarStatic,
      avatar: avatar,
      acct: acct,
      lastStatusAt: lastStatusAt,
      fqn: fqn,
      suspended: suspended,
      muteExpiresAt: muteExpiresAt,
      backgroundImage: backgroundImage,
      tags: tags,
      relationship: relationship,
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
      isConfirmed: isConfirmed,
      favicon: favicon,
      apId: apId,
      alsoKnownAs: alsoKnownAs,
    );
  }

  UnifediApiAccount fromJson(Map<String, Object?> json) {
    return UnifediApiAccount.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccount = _$UnifediApiAccountTearOff();

/// @nodoc
mixin _$UnifediApiAccount {
  @HiveField(0)
  String get username => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int? get statusesCount => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get locked => throw _privateConstructorUsedError;
  @HiveField(5)
  String get id => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String? get headerStatic => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get header => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int? get followingCount => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @HiveField(10)
  List<UnifediApiField>? get fields => throw _privateConstructorUsedError;
  @HiveField(11)
  List<UnifediApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(14)
  bool? get bot => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'avatar_static')
  String get avatarStatic => throw _privateConstructorUsedError;
  @HiveField(16)
  String get avatar => throw _privateConstructorUsedError;
  @HiveField(17)
  String get acct => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @HiveField(21)
  String? get fqn => throw _privateConstructorUsedError;
  @HiveField(22)
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'mute_expires_at')
  @HiveField(23)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;
  @HiveField(23 + 1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @HiveField(23 + 2)
  @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
  List<UnifediApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(23 + 3)
  @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
  UnifediApiAccountRelationship? get relationship =>
      throw _privateConstructorUsedError;
  @HiveField(23 + 4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @HiveField(23 + 5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator => throw _privateConstructorUsedError;
  @HiveField(23 + 7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending => throw _privateConstructorUsedError;
  @HiveField(23 + 8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites => throw _privateConstructorUsedError;
  @HiveField(23 + 9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers => throw _privateConstructorUsedError;
  @HiveField(23 + 11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows => throw _privateConstructorUsedError;
  @HiveField(23 + 12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount => throw _privateConstructorUsedError;
  @HiveField(23 + 13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount => throw _privateConstructorUsedError;
  @HiveField(23 + 16)
  bool? get deactivated => throw _privateConstructorUsedError;
  @HiveField(23 + 17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove => throw _privateConstructorUsedError;
  @HiveField(23 + 18)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment => throw _privateConstructorUsedError;
  @HiveField(23 + 19)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages => throw _privateConstructorUsedError;
  @HiveField(23 + 20)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed => throw _privateConstructorUsedError;
  @HiveField(23 + 21)
  String? get favicon => throw _privateConstructorUsedError;
  @HiveField(23 + 22)
  String? get apId => throw _privateConstructorUsedError;
  @HiveField(23 + 23)
  @JsonKey(
      name: 'also_known_as',
      fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountCopyWith<UnifediApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountCopyWith<$Res> {
  factory $UnifediApiAccountCopyWith(
          UnifediApiAccount value, $Res Function(UnifediApiAccount) then) =
      _$UnifediApiAccountCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String username,
      @HiveField(1)
          String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          int? statusesCount,
      @HiveField(3)
          String? note,
      @HiveField(4)
          bool? locked,
      @HiveField(5)
          String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          String? headerStatic,
      @HiveField(7)
          String? header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          int? followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          int? followersCount,
      @HiveField(10)
          List<UnifediApiField>? fields,
      @HiveField(11)
          List<UnifediApiEmoji>? emojis,
      @HiveField(12)
      @JsonKey(name: 'display_name')
          String? displayName,
      @HiveField(13)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(14)
          bool? bot,
      @HiveField(15)
      @JsonKey(name: 'avatar_static')
          String avatarStatic,
      @HiveField(16)
          String avatar,
      @HiveField(17)
          String acct,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          DateTime? lastStatusAt,
      @HiveField(21)
          String? fqn,
      @HiveField(22)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          DateTime? muteExpiresAt,
      @HiveField(23 + 1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(23 + 2)
      @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
          List<UnifediApiTag>? tags,
      @HiveField(23 + 3)
      @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
          UnifediApiAccountRelationship? relationship,
      @HiveField(23 + 4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(23 + 5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(23 + 7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(23 + 8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(23 + 9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(23 + 11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(23 + 12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(23 + 13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(23 + 16)
          bool? deactivated,
      @HiveField(23 + 17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(23 + 18)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(23 + 19)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(23 + 20)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(23 + 21)
          String? favicon,
      @HiveField(23 + 22)
          String? apId,
      @HiveField(23 + 23)
      @JsonKey(name: 'also_known_as', fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
          List<String>? alsoKnownAs});

  $UnifediApiAccountRelationshipCopyWith<$Res>? get relationship;
}

/// @nodoc
class _$UnifediApiAccountCopyWithImpl<$Res>
    implements $UnifediApiAccountCopyWith<$Res> {
  _$UnifediApiAccountCopyWithImpl(this._value, this._then);

  final UnifediApiAccount _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccount) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? url = freezed,
    Object? statusesCount = freezed,
    Object? note = freezed,
    Object? locked = freezed,
    Object? id = freezed,
    Object? headerStatic = freezed,
    Object? header = freezed,
    Object? followingCount = freezed,
    Object? followersCount = freezed,
    Object? fields = freezed,
    Object? emojis = freezed,
    Object? displayName = freezed,
    Object? createdAt = freezed,
    Object? bot = freezed,
    Object? avatarStatic = freezed,
    Object? avatar = freezed,
    Object? acct = freezed,
    Object? lastStatusAt = freezed,
    Object? fqn = freezed,
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
    Object? backgroundImage = freezed,
    Object? tags = freezed,
    Object? relationship = freezed,
    Object? isAdmin = freezed,
    Object? isModerator = freezed,
    Object? confirmationPending = freezed,
    Object? hideFavorites = freezed,
    Object? hideFollowers = freezed,
    Object? hideFollows = freezed,
    Object? hideFollowersCount = freezed,
    Object? hideFollowsCount = freezed,
    Object? deactivated = freezed,
    Object? allowFollowingMove = freezed,
    Object? skipThreadContainment = freezed,
    Object? acceptsChatMessages = freezed,
    Object? isConfirmed = freezed,
    Object? favicon = freezed,
    Object? apId = freezed,
    Object? alsoKnownAs = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      headerStatic: headerStatic == freezed
          ? _value.headerStatic
          : headerStatic // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiEmoji>?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bot: bot == freezed
          ? _value.bot
          : bot // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarStatic: avatarStatic == freezed
          ? _value.avatarStatic
          : avatarStatic // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fqn: fqn == freezed
          ? _value.fqn
          : fqn // ignore: cast_nullable_to_non_nullable
              as String?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      muteExpiresAt: muteExpiresAt == freezed
          ? _value.muteExpiresAt
          : muteExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationship?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      confirmationPending: confirmationPending == freezed
          ? _value.confirmationPending
          : confirmationPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFavorites: hideFavorites == freezed
          ? _value.hideFavorites
          : hideFavorites // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowers: hideFollowers == freezed
          ? _value.hideFollowers
          : hideFollowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollows: hideFollows == freezed
          ? _value.hideFollows
          : hideFollows // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowersCount: hideFollowersCount == freezed
          ? _value.hideFollowersCount
          : hideFollowersCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowsCount: hideFollowsCount == freezed
          ? _value.hideFollowsCount
          : hideFollowsCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      deactivated: deactivated == freezed
          ? _value.deactivated
          : deactivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowFollowingMove: allowFollowingMove == freezed
          ? _value.allowFollowingMove
          : allowFollowingMove // ignore: cast_nullable_to_non_nullable
              as bool?,
      skipThreadContainment: skipThreadContainment == freezed
          ? _value.skipThreadContainment
          : skipThreadContainment // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptsChatMessages: acceptsChatMessages == freezed
          ? _value.acceptsChatMessages
          : acceptsChatMessages // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfirmed: isConfirmed == freezed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      apId: apId == freezed
          ? _value.apId
          : apId // ignore: cast_nullable_to_non_nullable
              as String?,
      alsoKnownAs: alsoKnownAs == freezed
          ? _value.alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $UnifediApiAccountRelationshipCopyWith<$Res>? get relationship {
    if (_value.relationship == null) {
      return null;
    }

    return $UnifediApiAccountRelationshipCopyWith<$Res>(_value.relationship!,
        (value) {
      return _then(_value.copyWith(relationship: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountCopyWith<$Res>
    implements $UnifediApiAccountCopyWith<$Res> {
  factory _$UnifediApiAccountCopyWith(
          _UnifediApiAccount value, $Res Function(_UnifediApiAccount) then) =
      __$UnifediApiAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String username,
      @HiveField(1)
          String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          int? statusesCount,
      @HiveField(3)
          String? note,
      @HiveField(4)
          bool? locked,
      @HiveField(5)
          String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          String? headerStatic,
      @HiveField(7)
          String? header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          int? followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          int? followersCount,
      @HiveField(10)
          List<UnifediApiField>? fields,
      @HiveField(11)
          List<UnifediApiEmoji>? emojis,
      @HiveField(12)
      @JsonKey(name: 'display_name')
          String? displayName,
      @HiveField(13)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(14)
          bool? bot,
      @HiveField(15)
      @JsonKey(name: 'avatar_static')
          String avatarStatic,
      @HiveField(16)
          String avatar,
      @HiveField(17)
          String acct,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          DateTime? lastStatusAt,
      @HiveField(21)
          String? fqn,
      @HiveField(22)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          DateTime? muteExpiresAt,
      @HiveField(23 + 1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(23 + 2)
      @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
          List<UnifediApiTag>? tags,
      @HiveField(23 + 3)
      @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
          UnifediApiAccountRelationship? relationship,
      @HiveField(23 + 4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(23 + 5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(23 + 7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(23 + 8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(23 + 9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(23 + 11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(23 + 12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(23 + 13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(23 + 16)
          bool? deactivated,
      @HiveField(23 + 17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(23 + 18)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(23 + 19)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(23 + 20)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(23 + 21)
          String? favicon,
      @HiveField(23 + 22)
          String? apId,
      @HiveField(23 + 23)
      @JsonKey(name: 'also_known_as', fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
          List<String>? alsoKnownAs});

  @override
  $UnifediApiAccountRelationshipCopyWith<$Res>? get relationship;
}

/// @nodoc
class __$UnifediApiAccountCopyWithImpl<$Res>
    extends _$UnifediApiAccountCopyWithImpl<$Res>
    implements _$UnifediApiAccountCopyWith<$Res> {
  __$UnifediApiAccountCopyWithImpl(
      _UnifediApiAccount _value, $Res Function(_UnifediApiAccount) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccount));

  @override
  _UnifediApiAccount get _value => super._value as _UnifediApiAccount;

  @override
  $Res call({
    Object? username = freezed,
    Object? url = freezed,
    Object? statusesCount = freezed,
    Object? note = freezed,
    Object? locked = freezed,
    Object? id = freezed,
    Object? headerStatic = freezed,
    Object? header = freezed,
    Object? followingCount = freezed,
    Object? followersCount = freezed,
    Object? fields = freezed,
    Object? emojis = freezed,
    Object? displayName = freezed,
    Object? createdAt = freezed,
    Object? bot = freezed,
    Object? avatarStatic = freezed,
    Object? avatar = freezed,
    Object? acct = freezed,
    Object? lastStatusAt = freezed,
    Object? fqn = freezed,
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
    Object? backgroundImage = freezed,
    Object? tags = freezed,
    Object? relationship = freezed,
    Object? isAdmin = freezed,
    Object? isModerator = freezed,
    Object? confirmationPending = freezed,
    Object? hideFavorites = freezed,
    Object? hideFollowers = freezed,
    Object? hideFollows = freezed,
    Object? hideFollowersCount = freezed,
    Object? hideFollowsCount = freezed,
    Object? deactivated = freezed,
    Object? allowFollowingMove = freezed,
    Object? skipThreadContainment = freezed,
    Object? acceptsChatMessages = freezed,
    Object? isConfirmed = freezed,
    Object? favicon = freezed,
    Object? apId = freezed,
    Object? alsoKnownAs = freezed,
  }) {
    return _then(_UnifediApiAccount(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      headerStatic: headerStatic == freezed
          ? _value.headerStatic
          : headerStatic // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiEmoji>?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bot: bot == freezed
          ? _value.bot
          : bot // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarStatic: avatarStatic == freezed
          ? _value.avatarStatic
          : avatarStatic // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fqn: fqn == freezed
          ? _value.fqn
          : fqn // ignore: cast_nullable_to_non_nullable
              as String?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      muteExpiresAt: muteExpiresAt == freezed
          ? _value.muteExpiresAt
          : muteExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationship?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      confirmationPending: confirmationPending == freezed
          ? _value.confirmationPending
          : confirmationPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFavorites: hideFavorites == freezed
          ? _value.hideFavorites
          : hideFavorites // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowers: hideFollowers == freezed
          ? _value.hideFollowers
          : hideFollowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollows: hideFollows == freezed
          ? _value.hideFollows
          : hideFollows // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowersCount: hideFollowersCount == freezed
          ? _value.hideFollowersCount
          : hideFollowersCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFollowsCount: hideFollowsCount == freezed
          ? _value.hideFollowsCount
          : hideFollowsCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      deactivated: deactivated == freezed
          ? _value.deactivated
          : deactivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowFollowingMove: allowFollowingMove == freezed
          ? _value.allowFollowingMove
          : allowFollowingMove // ignore: cast_nullable_to_non_nullable
              as bool?,
      skipThreadContainment: skipThreadContainment == freezed
          ? _value.skipThreadContainment
          : skipThreadContainment // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptsChatMessages: acceptsChatMessages == freezed
          ? _value.acceptsChatMessages
          : acceptsChatMessages // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfirmed: isConfirmed == freezed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      apId: apId == freezed
          ? _value.apId
          : apId // ignore: cast_nullable_to_non_nullable
              as String?,
      alsoKnownAs: alsoKnownAs == freezed
          ? _value.alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccount implements _UnifediApiAccount {
  const _$_UnifediApiAccount(
      {@HiveField(0)
          required this.username,
      @HiveField(1)
          required this.url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required this.statusesCount,
      @HiveField(3)
          required this.note,
      @HiveField(4)
          required this.locked,
      @HiveField(5)
          required this.id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          required this.headerStatic,
      @HiveField(7)
          required this.header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          required this.followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          required this.followersCount,
      @HiveField(10)
          required this.fields,
      @HiveField(11)
          required this.emojis,
      @HiveField(12)
      @JsonKey(name: 'display_name')
          required this.displayName,
      @HiveField(13)
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @HiveField(14)
          required this.bot,
      @HiveField(15)
      @JsonKey(name: 'avatar_static')
          required this.avatarStatic,
      @HiveField(16)
          required this.avatar,
      @HiveField(17)
          required this.acct,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          required this.lastStatusAt,
      @HiveField(21)
          required this.fqn,
      @HiveField(22)
          required this.suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          required this.muteExpiresAt,
      @HiveField(23 + 1)
      @JsonKey(name: 'background_image')
          required this.backgroundImage,
      @HiveField(23 + 2)
      @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
          required this.tags,
      @HiveField(23 + 3)
      @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
          required this.relationship,
      @HiveField(23 + 4)
      @JsonKey(name: 'is_admin')
          required this.isAdmin,
      @HiveField(23 + 5)
      @JsonKey(name: 'is_moderator')
          required this.isModerator,
      @HiveField(23 + 7)
      @JsonKey(name: 'confirmation_pending')
          required this.confirmationPending,
      @HiveField(23 + 8)
      @JsonKey(name: 'hide_favorites')
          required this.hideFavorites,
      @HiveField(23 + 9)
      @JsonKey(name: 'hide_followers')
          required this.hideFollowers,
      @HiveField(23 + 11)
      @JsonKey(name: 'hide_follows')
          required this.hideFollows,
      @HiveField(23 + 12)
      @JsonKey(name: 'hide_followers_count')
          required this.hideFollowersCount,
      @HiveField(23 + 13)
      @JsonKey(name: 'hide_follows_count')
          required this.hideFollowsCount,
      @HiveField(23 + 16)
          required this.deactivated,
      @HiveField(23 + 17)
      @JsonKey(name: 'allow_following_move')
          required this.allowFollowingMove,
      @HiveField(23 + 18)
      @JsonKey(name: 'skip_thread_containment')
          required this.skipThreadContainment,
      @HiveField(23 + 19)
      @JsonKey(name: 'accepts_chat_messages')
          required this.acceptsChatMessages,
      @HiveField(23 + 20)
      @JsonKey(name: 'is_confirmed')
          required this.isConfirmed,
      @HiveField(23 + 21)
          required this.favicon,
      @HiveField(23 + 22)
          required this.apId,
      @HiveField(23 + 23)
      @JsonKey(name: 'also_known_as', fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
          required this.alsoKnownAs});

  factory _$_UnifediApiAccount.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccountFromJson(json);

  @override
  @HiveField(0)
  final String username;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  final int? statusesCount;
  @override
  @HiveField(3)
  final String? note;
  @override
  @HiveField(4)
  final bool? locked;
  @override
  @HiveField(5)
  final String id;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  final String? headerStatic;
  @override
  @HiveField(7)
  final String? header;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  final int? followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @HiveField(10)
  final List<UnifediApiField>? fields;
  @override
  @HiveField(11)
  final List<UnifediApiEmoji>? emojis;
  @override
  @HiveField(12)
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @HiveField(13)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(14)
  final bool? bot;
  @override
  @HiveField(15)
  @JsonKey(name: 'avatar_static')
  final String avatarStatic;
  @override
  @HiveField(16)
  final String avatar;
  @override
  @HiveField(17)
  final String acct;
  @override
  @HiveField(20)
  @JsonKey(name: 'last_status_at')
  final DateTime? lastStatusAt;
  @override
  @HiveField(21)
  final String? fqn;
  @override
  @HiveField(22)
  final bool? suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(23)
  final DateTime? muteExpiresAt;
  @override
  @HiveField(23 + 1)
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  @HiveField(23 + 2)
  @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
  final List<UnifediApiTag>? tags;
  @override
  @HiveField(23 + 3)
  @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
  final UnifediApiAccountRelationship? relationship;
  @override
  @HiveField(23 + 4)
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @override
  @HiveField(23 + 5)
  @JsonKey(name: 'is_moderator')
  final bool? isModerator;
  @override
  @HiveField(23 + 7)
  @JsonKey(name: 'confirmation_pending')
  final bool? confirmationPending;
  @override
  @HiveField(23 + 8)
  @JsonKey(name: 'hide_favorites')
  final bool? hideFavorites;
  @override
  @HiveField(23 + 9)
  @JsonKey(name: 'hide_followers')
  final bool? hideFollowers;
  @override
  @HiveField(23 + 11)
  @JsonKey(name: 'hide_follows')
  final bool? hideFollows;
  @override
  @HiveField(23 + 12)
  @JsonKey(name: 'hide_followers_count')
  final bool? hideFollowersCount;
  @override
  @HiveField(23 + 13)
  @JsonKey(name: 'hide_follows_count')
  final bool? hideFollowsCount;
  @override
  @HiveField(23 + 16)
  final bool? deactivated;
  @override
  @HiveField(23 + 17)
  @JsonKey(name: 'allow_following_move')
  final bool? allowFollowingMove;
  @override
  @HiveField(23 + 18)
  @JsonKey(name: 'skip_thread_containment')
  final bool? skipThreadContainment;
  @override
  @HiveField(23 + 19)
  @JsonKey(name: 'accepts_chat_messages')
  final bool? acceptsChatMessages;
  @override
  @HiveField(23 + 20)
  @JsonKey(name: 'is_confirmed')
  final bool? isConfirmed;
  @override
  @HiveField(23 + 21)
  final String? favicon;
  @override
  @HiveField(23 + 22)
  final String? apId;
  @override
  @HiveField(23 + 23)
  @JsonKey(
      name: 'also_known_as',
      fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
  final List<String>? alsoKnownAs;

  @override
  String toString() {
    return 'UnifediApiAccount(username: $username, url: $url, statusesCount: $statusesCount, note: $note, locked: $locked, id: $id, headerStatic: $headerStatic, header: $header, followingCount: $followingCount, followersCount: $followersCount, fields: $fields, emojis: $emojis, displayName: $displayName, createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct, lastStatusAt: $lastStatusAt, fqn: $fqn, suspended: $suspended, muteExpiresAt: $muteExpiresAt, backgroundImage: $backgroundImage, tags: $tags, relationship: $relationship, isAdmin: $isAdmin, isModerator: $isModerator, confirmationPending: $confirmationPending, hideFavorites: $hideFavorites, hideFollowers: $hideFollowers, hideFollows: $hideFollows, hideFollowersCount: $hideFollowersCount, hideFollowsCount: $hideFollowsCount, deactivated: $deactivated, allowFollowingMove: $allowFollowingMove, skipThreadContainment: $skipThreadContainment, acceptsChatMessages: $acceptsChatMessages, isConfirmed: $isConfirmed, favicon: $favicon, apId: $apId, alsoKnownAs: $alsoKnownAs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccount &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.statusesCount, statusesCount) ||
                other.statusesCount == statusesCount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.headerStatic, headerStatic) ||
                other.headerStatic == headerStatic) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            const DeepCollectionEquality().equals(other.fields, fields) &&
            const DeepCollectionEquality().equals(other.emojis, emojis) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bot, bot) || other.bot == bot) &&
            (identical(other.avatarStatic, avatarStatic) ||
                other.avatarStatic == avatarStatic) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.acct, acct) || other.acct == acct) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                other.lastStatusAt == lastStatusAt) &&
            (identical(other.fqn, fqn) || other.fqn == fqn) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.muteExpiresAt, muteExpiresAt) ||
                other.muteExpiresAt == muteExpiresAt) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isModerator, isModerator) ||
                other.isModerator == isModerator) &&
            (identical(other.confirmationPending, confirmationPending) ||
                other.confirmationPending == confirmationPending) &&
            (identical(other.hideFavorites, hideFavorites) ||
                other.hideFavorites == hideFavorites) &&
            (identical(other.hideFollowers, hideFollowers) ||
                other.hideFollowers == hideFollowers) &&
            (identical(other.hideFollows, hideFollows) ||
                other.hideFollows == hideFollows) &&
            (identical(other.hideFollowersCount, hideFollowersCount) ||
                other.hideFollowersCount == hideFollowersCount) &&
            (identical(other.hideFollowsCount, hideFollowsCount) ||
                other.hideFollowsCount == hideFollowsCount) &&
            (identical(other.deactivated, deactivated) ||
                other.deactivated == deactivated) &&
            (identical(other.allowFollowingMove, allowFollowingMove) ||
                other.allowFollowingMove == allowFollowingMove) &&
            (identical(other.skipThreadContainment, skipThreadContainment) ||
                other.skipThreadContainment == skipThreadContainment) &&
            (identical(other.acceptsChatMessages, acceptsChatMessages) ||
                other.acceptsChatMessages == acceptsChatMessages) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.apId, apId) || other.apId == apId) &&
            const DeepCollectionEquality()
                .equals(other.alsoKnownAs, alsoKnownAs));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        username,
        url,
        statusesCount,
        note,
        locked,
        id,
        headerStatic,
        header,
        followingCount,
        followersCount,
        const DeepCollectionEquality().hash(fields),
        const DeepCollectionEquality().hash(emojis),
        displayName,
        createdAt,
        bot,
        avatarStatic,
        avatar,
        acct,
        lastStatusAt,
        fqn,
        suspended,
        muteExpiresAt,
        backgroundImage,
        const DeepCollectionEquality().hash(tags),
        relationship,
        isAdmin,
        isModerator,
        confirmationPending,
        hideFavorites,
        hideFollowers,
        hideFollows,
        hideFollowersCount,
        hideFollowsCount,
        deactivated,
        allowFollowingMove,
        skipThreadContainment,
        acceptsChatMessages,
        isConfirmed,
        favicon,
        apId,
        const DeepCollectionEquality().hash(alsoKnownAs)
      ]);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountCopyWith<_UnifediApiAccount> get copyWith =>
      __$UnifediApiAccountCopyWithImpl<_UnifediApiAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountToJson(this);
  }
}

abstract class _UnifediApiAccount implements UnifediApiAccount {
  const factory _UnifediApiAccount(
      {@HiveField(0)
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
      @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
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
      @JsonKey(name: 'also_known_as', fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
          required List<String>? alsoKnownAs}) = _$_UnifediApiAccount;

  factory _UnifediApiAccount.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccount.fromJson;

  @override
  @HiveField(0)
  String get username;
  @override
  @HiveField(1)
  String get url;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int? get statusesCount;
  @override
  @HiveField(3)
  String? get note;
  @override
  @HiveField(4)
  bool? get locked;
  @override
  @HiveField(5)
  String get id;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String? get headerStatic;
  @override
  @HiveField(7)
  String? get header;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int? get followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @HiveField(10)
  List<UnifediApiField>? get fields;
  @override
  @HiveField(11)
  List<UnifediApiEmoji>? get emojis;
  @override
  @HiveField(12)
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @HiveField(13)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @HiveField(14)
  bool? get bot;
  @override
  @HiveField(15)
  @JsonKey(name: 'avatar_static')
  String get avatarStatic;
  @override
  @HiveField(16)
  String get avatar;
  @override
  @HiveField(17)
  String get acct;
  @override
  @HiveField(20)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt;
  @override
  @HiveField(21)
  String? get fqn;
  @override
  @HiveField(22)
  bool? get suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(23)
  DateTime? get muteExpiresAt;
  @override
  @HiveField(23 + 1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage;
  @override
  @HiveField(23 + 2)
  @JsonKey(fromJson: UnifediApiTag.fromJsonListOrNullOnError)
  List<UnifediApiTag>? get tags;
  @override
  @HiveField(23 + 3)
  @JsonKey(fromJson: UnifediApiAccountRelationship.fromJsonOrNullOnError)
  UnifediApiAccountRelationship? get relationship;
  @override
  @HiveField(23 + 4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin;
  @override
  @HiveField(23 + 5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator;
  @override
  @HiveField(23 + 7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending;
  @override
  @HiveField(23 + 8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites;
  @override
  @HiveField(23 + 9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers;
  @override
  @HiveField(23 + 11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows;
  @override
  @HiveField(23 + 12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount;
  @override
  @HiveField(23 + 13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount;
  @override
  @HiveField(23 + 16)
  bool? get deactivated;
  @override
  @HiveField(23 + 17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove;
  @override
  @HiveField(23 + 18)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment;
  @override
  @HiveField(23 + 19)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages;
  @override
  @HiveField(23 + 20)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed;
  @override
  @HiveField(23 + 21)
  String? get favicon;
  @override
  @HiveField(23 + 22)
  String? get apId;
  @override
  @HiveField(23 + 23)
  @JsonKey(
      name: 'also_known_as',
      fromJson: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError)
  List<String>? get alsoKnownAs;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountCopyWith<_UnifediApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_my_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMyAccount _$UnifediApiMyAccountFromJson(Map<String, dynamic> json) {
  return _UnifediApiMyAccount.fromJson(json);
}

/// @nodoc
class _$UnifediApiMyAccountTearOff {
  const _$UnifediApiMyAccountTearOff();

  _UnifediApiMyAccount call(
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
      @HiveField(22)
          required bool? discoverable,
      @HiveField(23)
      @JsonKey(name: 'follow_requests_count')
          required int? followRequestsCount,
      @HiveField(24)
          required String? fqn,
      @HiveField(25)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(26)
          required DateTime? muteExpiresAt,
      @HiveField(26 + 1)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(26 + 2)
          required List<UnifediApiTag>? tags,
      @HiveField(26 + 3)
          required UnifediApiAccountRelationship? relationship,
      @HiveField(26 + 4)
      @JsonKey(name: 'is_admin')
          required bool? isAdmin,
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
      @HiveField(26 + 14)
      @JsonKey(name: 'settings_store')
          required Map<String, dynamic>? settingsStore,
      @HiveField(26 + 15)
      @JsonKey(name: 'chat_token')
          required String? chatToken,
      @HiveField(26 + 16)
          required bool? deactivated,
      @HiveField(26 + 17)
      @JsonKey(name: 'allow_following_move')
          required bool? allowFollowingMove,
      @HiveField(26 + 18)
      @JsonKey(name: 'unread_conversation_count')
          required int? unreadConversationCount,
      @HiveField(26 + 19)
      @JsonKey(name: 'notifications_settings')
          required UnifediApiMyAccountNotificationsSettings?
              notificationSettings,
      @HiveField(26 + 20)
      @JsonKey(name: 'skip_thread_containment')
          required bool? skipThreadContainment,
      @HiveField(26 + 21)
      @JsonKey(name: 'accepts_chat_messages')
          required bool? acceptsChatMessages,
      @HiveField(26 + 22)
      @JsonKey(name: 'is_confirmed')
          required bool? isConfirmed,
      @HiveField(26 + 23)
          required String? favicon,
      @HiveField(26 + 24)
          required String? apId,
      @HiveField(26 + 25)
      @JsonKey(name: 'also_known_as')
          required List<String>? alsoKnownAs,
      @HiveField(26 + 26)
      @JsonKey(name: 'unread_notifications_count')
          required int? unreadNotificationsCount,
      @HiveField(26 + 26 + 1)
          required String? privacy,
      @HiveField(26 + 26 + 2)
          required bool? sensitive,
      @HiveField(26 + 26 + 3)
          required String? language,
      @HiveField(26 + 26 + 6 + 1)
      @JsonKey(name: 'show_role')
          required bool? showRole,
      @HiveField(26 + 26 + 6 + 2)
      @JsonKey(name: 'no_rich_text')
          required bool? noRichText,
      @HiveField(26 + 26 + 6 + 4)
      @JsonKey(name: 'actor_type')
          required String? actorType}) {
    return _UnifediApiMyAccount(
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
      discoverable: discoverable,
      followRequestsCount: followRequestsCount,
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
      settingsStore: settingsStore,
      chatToken: chatToken,
      deactivated: deactivated,
      allowFollowingMove: allowFollowingMove,
      unreadConversationCount: unreadConversationCount,
      notificationSettings: notificationSettings,
      skipThreadContainment: skipThreadContainment,
      acceptsChatMessages: acceptsChatMessages,
      isConfirmed: isConfirmed,
      favicon: favicon,
      apId: apId,
      alsoKnownAs: alsoKnownAs,
      unreadNotificationsCount: unreadNotificationsCount,
      privacy: privacy,
      sensitive: sensitive,
      language: language,
      showRole: showRole,
      noRichText: noRichText,
      actorType: actorType,
    );
  }

  UnifediApiMyAccount fromJson(Map<String, Object> json) {
    return UnifediApiMyAccount.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMyAccount = _$UnifediApiMyAccountTearOff();

/// @nodoc
mixin _$UnifediApiMyAccount {
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
  @HiveField(22)
  bool? get discoverable => throw _privateConstructorUsedError;
  @HiveField(23)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount => throw _privateConstructorUsedError;
  @HiveField(24)
  String? get fqn => throw _privateConstructorUsedError;
  @HiveField(25)
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'mute_expires_at')
  @HiveField(26)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;
  @HiveField(26 + 1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @HiveField(26 + 2)
  List<UnifediApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(26 + 3)
  UnifediApiAccountRelationship? get relationship =>
      throw _privateConstructorUsedError;
  @HiveField(26 + 4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @HiveField(26 + 5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator => throw _privateConstructorUsedError;
  @HiveField(26 + 7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending => throw _privateConstructorUsedError;
  @HiveField(26 + 8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites => throw _privateConstructorUsedError;
  @HiveField(26 + 9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers => throw _privateConstructorUsedError;
  @HiveField(26 + 11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows => throw _privateConstructorUsedError;
  @HiveField(26 + 12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount => throw _privateConstructorUsedError;
  @HiveField(26 + 13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount => throw _privateConstructorUsedError;

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @HiveField(26 + 14)
  @JsonKey(name: 'settings_store')
  Map<String, dynamic>? get settingsStore => throw _privateConstructorUsedError;

  /// The token needed for Unifedi chat. Only returned in verify_credentials
  @HiveField(26 + 15)
  @JsonKey(name: 'chat_token')
  String? get chatToken => throw _privateConstructorUsedError;
  @HiveField(26 + 16)
  bool? get deactivated => throw _privateConstructorUsedError;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(26 + 17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove => throw _privateConstructorUsedError;

  /// The count of unread conversations. Only returned to the account owner.
  @HiveField(26 + 18)
  @JsonKey(name: 'unread_conversation_count')
  int? get unreadConversationCount => throw _privateConstructorUsedError;
  @HiveField(26 + 19)
  @JsonKey(name: 'notifications_settings')
  UnifediApiMyAccountNotificationsSettings? get notificationSettings =>
      throw _privateConstructorUsedError;
  @HiveField(26 + 20)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment => throw _privateConstructorUsedError;
  @HiveField(26 + 21)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages => throw _privateConstructorUsedError;
  @HiveField(26 + 22)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed => throw _privateConstructorUsedError;
  @HiveField(26 + 23)
  String? get favicon => throw _privateConstructorUsedError;
  @HiveField(26 + 24)
  String? get apId => throw _privateConstructorUsedError;
  @HiveField(26 + 25)
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;
  @HiveField(26 + 26)
  @JsonKey(name: 'unread_notifications_count')
  int? get unreadNotificationsCount => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 1)
  String? get privacy => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 2)
  bool? get sensitive => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 3)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 6 + 1)
  @JsonKey(name: 'show_role')
  bool? get showRole => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 6 + 2)
  @JsonKey(name: 'no_rich_text')
  bool? get noRichText => throw _privateConstructorUsedError;
  @HiveField(26 + 26 + 6 + 4)
  @JsonKey(name: 'actor_type')
  String? get actorType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMyAccountCopyWith<UnifediApiMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMyAccountCopyWith<$Res> {
  factory $UnifediApiMyAccountCopyWith(
          UnifediApiMyAccount value, $Res Function(UnifediApiMyAccount) then) =
      _$UnifediApiMyAccountCopyWithImpl<$Res>;
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
      @HiveField(22)
          bool? discoverable,
      @HiveField(23)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount,
      @HiveField(24)
          String? fqn,
      @HiveField(25)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(26)
          DateTime? muteExpiresAt,
      @HiveField(26 + 1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(26 + 2)
          List<UnifediApiTag>? tags,
      @HiveField(26 + 3)
          UnifediApiAccountRelationship? relationship,
      @HiveField(26 + 4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(26 + 5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(26 + 7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(26 + 8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(26 + 9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(26 + 11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(26 + 12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(26 + 13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(26 + 14)
      @JsonKey(name: 'settings_store')
          Map<String, dynamic>? settingsStore,
      @HiveField(26 + 15)
      @JsonKey(name: 'chat_token')
          String? chatToken,
      @HiveField(26 + 16)
          bool? deactivated,
      @HiveField(26 + 17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(26 + 18)
      @JsonKey(name: 'unread_conversation_count')
          int? unreadConversationCount,
      @HiveField(26 + 19)
      @JsonKey(name: 'notifications_settings')
          UnifediApiMyAccountNotificationsSettings? notificationSettings,
      @HiveField(26 + 20)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(26 + 21)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(26 + 22)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(26 + 23)
          String? favicon,
      @HiveField(26 + 24)
          String? apId,
      @HiveField(26 + 25)
      @JsonKey(name: 'also_known_as')
          List<String>? alsoKnownAs,
      @HiveField(26 + 26)
      @JsonKey(name: 'unread_notifications_count')
          int? unreadNotificationsCount,
      @HiveField(26 + 26 + 1)
          String? privacy,
      @HiveField(26 + 26 + 2)
          bool? sensitive,
      @HiveField(26 + 26 + 3)
          String? language,
      @HiveField(26 + 26 + 6 + 1)
      @JsonKey(name: 'show_role')
          bool? showRole,
      @HiveField(26 + 26 + 6 + 2)
      @JsonKey(name: 'no_rich_text')
          bool? noRichText,
      @HiveField(26 + 26 + 6 + 4)
      @JsonKey(name: 'actor_type')
          String? actorType});

  $UnifediApiAccountRelationshipCopyWith<$Res>? get relationship;
  $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res>?
      get notificationSettings;
}

/// @nodoc
class _$UnifediApiMyAccountCopyWithImpl<$Res>
    implements $UnifediApiMyAccountCopyWith<$Res> {
  _$UnifediApiMyAccountCopyWithImpl(this._value, this._then);

  final UnifediApiMyAccount _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMyAccount) _then;

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
    Object? discoverable = freezed,
    Object? followRequestsCount = freezed,
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
    Object? settingsStore = freezed,
    Object? chatToken = freezed,
    Object? deactivated = freezed,
    Object? allowFollowingMove = freezed,
    Object? unreadConversationCount = freezed,
    Object? notificationSettings = freezed,
    Object? skipThreadContainment = freezed,
    Object? acceptsChatMessages = freezed,
    Object? isConfirmed = freezed,
    Object? favicon = freezed,
    Object? apId = freezed,
    Object? alsoKnownAs = freezed,
    Object? unreadNotificationsCount = freezed,
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? showRole = freezed,
    Object? noRichText = freezed,
    Object? actorType = freezed,
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
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      settingsStore: settingsStore == freezed
          ? _value.settingsStore
          : settingsStore // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      chatToken: chatToken == freezed
          ? _value.chatToken
          : chatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deactivated: deactivated == freezed
          ? _value.deactivated
          : deactivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowFollowingMove: allowFollowingMove == freezed
          ? _value.allowFollowingMove
          : allowFollowingMove // ignore: cast_nullable_to_non_nullable
              as bool?,
      unreadConversationCount: unreadConversationCount == freezed
          ? _value.unreadConversationCount
          : unreadConversationCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccountNotificationsSettings?,
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
      unreadNotificationsCount: unreadNotificationsCount == freezed
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      privacy: privacy == freezed
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      showRole: showRole == freezed
          ? _value.showRole
          : showRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      noRichText: noRichText == freezed
          ? _value.noRichText
          : noRichText // ignore: cast_nullable_to_non_nullable
              as bool?,
      actorType: actorType == freezed
          ? _value.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res>?
      get notificationSettings {
    if (_value.notificationSettings == null) {
      return null;
    }

    return $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res>(
        _value.notificationSettings!, (value) {
      return _then(_value.copyWith(notificationSettings: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMyAccountCopyWith<$Res>
    implements $UnifediApiMyAccountCopyWith<$Res> {
  factory _$UnifediApiMyAccountCopyWith(_UnifediApiMyAccount value,
          $Res Function(_UnifediApiMyAccount) then) =
      __$UnifediApiMyAccountCopyWithImpl<$Res>;
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
      @HiveField(22)
          bool? discoverable,
      @HiveField(23)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount,
      @HiveField(24)
          String? fqn,
      @HiveField(25)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(26)
          DateTime? muteExpiresAt,
      @HiveField(26 + 1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(26 + 2)
          List<UnifediApiTag>? tags,
      @HiveField(26 + 3)
          UnifediApiAccountRelationship? relationship,
      @HiveField(26 + 4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(26 + 5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(26 + 7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(26 + 8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(26 + 9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(26 + 11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(26 + 12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(26 + 13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(26 + 14)
      @JsonKey(name: 'settings_store')
          Map<String, dynamic>? settingsStore,
      @HiveField(26 + 15)
      @JsonKey(name: 'chat_token')
          String? chatToken,
      @HiveField(26 + 16)
          bool? deactivated,
      @HiveField(26 + 17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(26 + 18)
      @JsonKey(name: 'unread_conversation_count')
          int? unreadConversationCount,
      @HiveField(26 + 19)
      @JsonKey(name: 'notifications_settings')
          UnifediApiMyAccountNotificationsSettings? notificationSettings,
      @HiveField(26 + 20)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(26 + 21)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(26 + 22)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(26 + 23)
          String? favicon,
      @HiveField(26 + 24)
          String? apId,
      @HiveField(26 + 25)
      @JsonKey(name: 'also_known_as')
          List<String>? alsoKnownAs,
      @HiveField(26 + 26)
      @JsonKey(name: 'unread_notifications_count')
          int? unreadNotificationsCount,
      @HiveField(26 + 26 + 1)
          String? privacy,
      @HiveField(26 + 26 + 2)
          bool? sensitive,
      @HiveField(26 + 26 + 3)
          String? language,
      @HiveField(26 + 26 + 6 + 1)
      @JsonKey(name: 'show_role')
          bool? showRole,
      @HiveField(26 + 26 + 6 + 2)
      @JsonKey(name: 'no_rich_text')
          bool? noRichText,
      @HiveField(26 + 26 + 6 + 4)
      @JsonKey(name: 'actor_type')
          String? actorType});

  @override
  $UnifediApiAccountRelationshipCopyWith<$Res>? get relationship;
  @override
  $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res>?
      get notificationSettings;
}

/// @nodoc
class __$UnifediApiMyAccountCopyWithImpl<$Res>
    extends _$UnifediApiMyAccountCopyWithImpl<$Res>
    implements _$UnifediApiMyAccountCopyWith<$Res> {
  __$UnifediApiMyAccountCopyWithImpl(
      _UnifediApiMyAccount _value, $Res Function(_UnifediApiMyAccount) _then)
      : super(_value, (v) => _then(v as _UnifediApiMyAccount));

  @override
  _UnifediApiMyAccount get _value => super._value as _UnifediApiMyAccount;

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
    Object? discoverable = freezed,
    Object? followRequestsCount = freezed,
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
    Object? settingsStore = freezed,
    Object? chatToken = freezed,
    Object? deactivated = freezed,
    Object? allowFollowingMove = freezed,
    Object? unreadConversationCount = freezed,
    Object? notificationSettings = freezed,
    Object? skipThreadContainment = freezed,
    Object? acceptsChatMessages = freezed,
    Object? isConfirmed = freezed,
    Object? favicon = freezed,
    Object? apId = freezed,
    Object? alsoKnownAs = freezed,
    Object? unreadNotificationsCount = freezed,
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? showRole = freezed,
    Object? noRichText = freezed,
    Object? actorType = freezed,
  }) {
    return _then(_UnifediApiMyAccount(
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
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      settingsStore: settingsStore == freezed
          ? _value.settingsStore
          : settingsStore // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      chatToken: chatToken == freezed
          ? _value.chatToken
          : chatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deactivated: deactivated == freezed
          ? _value.deactivated
          : deactivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowFollowingMove: allowFollowingMove == freezed
          ? _value.allowFollowingMove
          : allowFollowingMove // ignore: cast_nullable_to_non_nullable
              as bool?,
      unreadConversationCount: unreadConversationCount == freezed
          ? _value.unreadConversationCount
          : unreadConversationCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationSettings: notificationSettings == freezed
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccountNotificationsSettings?,
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
      unreadNotificationsCount: unreadNotificationsCount == freezed
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      privacy: privacy == freezed
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      showRole: showRole == freezed
          ? _value.showRole
          : showRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      noRichText: noRichText == freezed
          ? _value.noRichText
          : noRichText // ignore: cast_nullable_to_non_nullable
              as bool?,
      actorType: actorType == freezed
          ? _value.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMyAccount implements _UnifediApiMyAccount {
  const _$_UnifediApiMyAccount(
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
      @HiveField(22)
          required this.discoverable,
      @HiveField(23)
      @JsonKey(name: 'follow_requests_count')
          required this.followRequestsCount,
      @HiveField(24)
          required this.fqn,
      @HiveField(25)
          required this.suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(26)
          required this.muteExpiresAt,
      @HiveField(26 + 1)
      @JsonKey(name: 'background_image')
          required this.backgroundImage,
      @HiveField(26 + 2)
          required this.tags,
      @HiveField(26 + 3)
          required this.relationship,
      @HiveField(26 + 4)
      @JsonKey(name: 'is_admin')
          required this.isAdmin,
      @HiveField(26 + 5)
      @JsonKey(name: 'is_moderator')
          required this.isModerator,
      @HiveField(26 + 7)
      @JsonKey(name: 'confirmation_pending')
          required this.confirmationPending,
      @HiveField(26 + 8)
      @JsonKey(name: 'hide_favorites')
          required this.hideFavorites,
      @HiveField(26 + 9)
      @JsonKey(name: 'hide_followers')
          required this.hideFollowers,
      @HiveField(26 + 11)
      @JsonKey(name: 'hide_follows')
          required this.hideFollows,
      @HiveField(26 + 12)
      @JsonKey(name: 'hide_followers_count')
          required this.hideFollowersCount,
      @HiveField(26 + 13)
      @JsonKey(name: 'hide_follows_count')
          required this.hideFollowsCount,
      @HiveField(26 + 14)
      @JsonKey(name: 'settings_store')
          required this.settingsStore,
      @HiveField(26 + 15)
      @JsonKey(name: 'chat_token')
          required this.chatToken,
      @HiveField(26 + 16)
          required this.deactivated,
      @HiveField(26 + 17)
      @JsonKey(name: 'allow_following_move')
          required this.allowFollowingMove,
      @HiveField(26 + 18)
      @JsonKey(name: 'unread_conversation_count')
          required this.unreadConversationCount,
      @HiveField(26 + 19)
      @JsonKey(name: 'notifications_settings')
          required this.notificationSettings,
      @HiveField(26 + 20)
      @JsonKey(name: 'skip_thread_containment')
          required this.skipThreadContainment,
      @HiveField(26 + 21)
      @JsonKey(name: 'accepts_chat_messages')
          required this.acceptsChatMessages,
      @HiveField(26 + 22)
      @JsonKey(name: 'is_confirmed')
          required this.isConfirmed,
      @HiveField(26 + 23)
          required this.favicon,
      @HiveField(26 + 24)
          required this.apId,
      @HiveField(26 + 25)
      @JsonKey(name: 'also_known_as')
          required this.alsoKnownAs,
      @HiveField(26 + 26)
      @JsonKey(name: 'unread_notifications_count')
          required this.unreadNotificationsCount,
      @HiveField(26 + 26 + 1)
          required this.privacy,
      @HiveField(26 + 26 + 2)
          required this.sensitive,
      @HiveField(26 + 26 + 3)
          required this.language,
      @HiveField(26 + 26 + 6 + 1)
      @JsonKey(name: 'show_role')
          required this.showRole,
      @HiveField(26 + 26 + 6 + 2)
      @JsonKey(name: 'no_rich_text')
          required this.noRichText,
      @HiveField(26 + 26 + 6 + 4)
      @JsonKey(name: 'actor_type')
          required this.actorType});

  factory _$_UnifediApiMyAccount.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiMyAccountFromJson(json);

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
  @HiveField(22)
  final bool? discoverable;
  @override
  @HiveField(23)
  @JsonKey(name: 'follow_requests_count')
  final int? followRequestsCount;
  @override
  @HiveField(24)
  final String? fqn;
  @override
  @HiveField(25)
  final bool? suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(26)
  final DateTime? muteExpiresAt;
  @override
  @HiveField(26 + 1)
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  @HiveField(26 + 2)
  final List<UnifediApiTag>? tags;
  @override
  @HiveField(26 + 3)
  final UnifediApiAccountRelationship? relationship;
  @override
  @HiveField(26 + 4)
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @override
  @HiveField(26 + 5)
  @JsonKey(name: 'is_moderator')
  final bool? isModerator;
  @override
  @HiveField(26 + 7)
  @JsonKey(name: 'confirmation_pending')
  final bool? confirmationPending;
  @override
  @HiveField(26 + 8)
  @JsonKey(name: 'hide_favorites')
  final bool? hideFavorites;
  @override
  @HiveField(26 + 9)
  @JsonKey(name: 'hide_followers')
  final bool? hideFollowers;
  @override
  @HiveField(26 + 11)
  @JsonKey(name: 'hide_follows')
  final bool? hideFollows;
  @override
  @HiveField(26 + 12)
  @JsonKey(name: 'hide_followers_count')
  final bool? hideFollowersCount;
  @override
  @HiveField(26 + 13)
  @JsonKey(name: 'hide_follows_count')
  final bool? hideFollowsCount;
  @override

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @HiveField(26 + 14)
  @JsonKey(name: 'settings_store')
  final Map<String, dynamic>? settingsStore;
  @override

  /// The token needed for Unifedi chat. Only returned in verify_credentials
  @HiveField(26 + 15)
  @JsonKey(name: 'chat_token')
  final String? chatToken;
  @override
  @HiveField(26 + 16)
  final bool? deactivated;
  @override

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(26 + 17)
  @JsonKey(name: 'allow_following_move')
  final bool? allowFollowingMove;
  @override

  /// The count of unread conversations. Only returned to the account owner.
  @HiveField(26 + 18)
  @JsonKey(name: 'unread_conversation_count')
  final int? unreadConversationCount;
  @override
  @HiveField(26 + 19)
  @JsonKey(name: 'notifications_settings')
  final UnifediApiMyAccountNotificationsSettings? notificationSettings;
  @override
  @HiveField(26 + 20)
  @JsonKey(name: 'skip_thread_containment')
  final bool? skipThreadContainment;
  @override
  @HiveField(26 + 21)
  @JsonKey(name: 'accepts_chat_messages')
  final bool? acceptsChatMessages;
  @override
  @HiveField(26 + 22)
  @JsonKey(name: 'is_confirmed')
  final bool? isConfirmed;
  @override
  @HiveField(26 + 23)
  final String? favicon;
  @override
  @HiveField(26 + 24)
  final String? apId;
  @override
  @HiveField(26 + 25)
  @JsonKey(name: 'also_known_as')
  final List<String>? alsoKnownAs;
  @override
  @HiveField(26 + 26)
  @JsonKey(name: 'unread_notifications_count')
  final int? unreadNotificationsCount;
  @override
  @HiveField(26 + 26 + 1)
  final String? privacy;
  @override
  @HiveField(26 + 26 + 2)
  final bool? sensitive;
  @override
  @HiveField(26 + 26 + 3)
  final String? language;
  @override
  @HiveField(26 + 26 + 6 + 1)
  @JsonKey(name: 'show_role')
  final bool? showRole;
  @override
  @HiveField(26 + 26 + 6 + 2)
  @JsonKey(name: 'no_rich_text')
  final bool? noRichText;
  @override
  @HiveField(26 + 26 + 6 + 4)
  @JsonKey(name: 'actor_type')
  final String? actorType;

  @override
  String toString() {
    return 'UnifediApiMyAccount(username: $username, url: $url, statusesCount: $statusesCount, note: $note, locked: $locked, id: $id, headerStatic: $headerStatic, header: $header, followingCount: $followingCount, followersCount: $followersCount, fields: $fields, emojis: $emojis, displayName: $displayName, createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct, lastStatusAt: $lastStatusAt, discoverable: $discoverable, followRequestsCount: $followRequestsCount, fqn: $fqn, suspended: $suspended, muteExpiresAt: $muteExpiresAt, backgroundImage: $backgroundImage, tags: $tags, relationship: $relationship, isAdmin: $isAdmin, isModerator: $isModerator, confirmationPending: $confirmationPending, hideFavorites: $hideFavorites, hideFollowers: $hideFollowers, hideFollows: $hideFollows, hideFollowersCount: $hideFollowersCount, hideFollowsCount: $hideFollowsCount, settingsStore: $settingsStore, chatToken: $chatToken, deactivated: $deactivated, allowFollowingMove: $allowFollowingMove, unreadConversationCount: $unreadConversationCount, notificationSettings: $notificationSettings, skipThreadContainment: $skipThreadContainment, acceptsChatMessages: $acceptsChatMessages, isConfirmed: $isConfirmed, favicon: $favicon, apId: $apId, alsoKnownAs: $alsoKnownAs, unreadNotificationsCount: $unreadNotificationsCount, privacy: $privacy, sensitive: $sensitive, language: $language, showRole: $showRole, noRichText: $noRichText, actorType: $actorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMyAccount &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.statusesCount, statusesCount) ||
                const DeepCollectionEquality()
                    .equals(other.statusesCount, statusesCount)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.locked, locked) ||
                const DeepCollectionEquality().equals(other.locked, locked)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.headerStatic, headerStatic) ||
                const DeepCollectionEquality()
                    .equals(other.headerStatic, headerStatic)) &&
            (identical(other.header, header) ||
                const DeepCollectionEquality().equals(other.header, header)) &&
            (identical(other.followingCount, followingCount) ||
                const DeepCollectionEquality()
                    .equals(other.followingCount, followingCount)) &&
            (identical(other.followersCount, followersCount) ||
                const DeepCollectionEquality()
                    .equals(other.followersCount, followersCount)) &&
            (identical(other.fields, fields) ||
                const DeepCollectionEquality().equals(other.fields, fields)) &&
            (identical(other.emojis, emojis) ||
                const DeepCollectionEquality().equals(other.emojis, emojis)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.bot, bot) ||
                const DeepCollectionEquality().equals(other.bot, bot)) &&
            (identical(other.avatarStatic, avatarStatic) ||
                const DeepCollectionEquality()
                    .equals(other.avatarStatic, avatarStatic)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.acct, acct) ||
                const DeepCollectionEquality().equals(other.acct, acct)) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastStatusAt, lastStatusAt)) &&
            (identical(other.discoverable, discoverable) ||
                const DeepCollectionEquality()
                    .equals(other.discoverable, discoverable)) &&
            (identical(other.followRequestsCount, followRequestsCount) ||
                const DeepCollectionEquality()
                    .equals(other.followRequestsCount, followRequestsCount)) &&
            (identical(other.fqn, fqn) ||
                const DeepCollectionEquality().equals(other.fqn, fqn)) &&
            (identical(other.suspended, suspended) ||
                const DeepCollectionEquality()
                    .equals(other.suspended, suspended)) &&
            (identical(other.muteExpiresAt, muteExpiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.muteExpiresAt, muteExpiresAt)) &&
            (identical(other.backgroundImage, backgroundImage) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundImage, backgroundImage)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.relationship, relationship) ||
                const DeepCollectionEquality()
                    .equals(other.relationship, relationship)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)) &&
            (identical(other.isModerator, isModerator) || const DeepCollectionEquality().equals(other.isModerator, isModerator)) &&
            (identical(other.confirmationPending, confirmationPending) || const DeepCollectionEquality().equals(other.confirmationPending, confirmationPending)) &&
            (identical(other.hideFavorites, hideFavorites) || const DeepCollectionEquality().equals(other.hideFavorites, hideFavorites)) &&
            (identical(other.hideFollowers, hideFollowers) || const DeepCollectionEquality().equals(other.hideFollowers, hideFollowers)) &&
            (identical(other.hideFollows, hideFollows) || const DeepCollectionEquality().equals(other.hideFollows, hideFollows)) &&
            (identical(other.hideFollowersCount, hideFollowersCount) || const DeepCollectionEquality().equals(other.hideFollowersCount, hideFollowersCount)) &&
            (identical(other.hideFollowsCount, hideFollowsCount) || const DeepCollectionEquality().equals(other.hideFollowsCount, hideFollowsCount)) &&
            (identical(other.settingsStore, settingsStore) || const DeepCollectionEquality().equals(other.settingsStore, settingsStore)) &&
            (identical(other.chatToken, chatToken) || const DeepCollectionEquality().equals(other.chatToken, chatToken)) &&
            (identical(other.deactivated, deactivated) || const DeepCollectionEquality().equals(other.deactivated, deactivated)) &&
            (identical(other.allowFollowingMove, allowFollowingMove) || const DeepCollectionEquality().equals(other.allowFollowingMove, allowFollowingMove)) &&
            (identical(other.unreadConversationCount, unreadConversationCount) || const DeepCollectionEquality().equals(other.unreadConversationCount, unreadConversationCount)) &&
            (identical(other.notificationSettings, notificationSettings) || const DeepCollectionEquality().equals(other.notificationSettings, notificationSettings)) &&
            (identical(other.skipThreadContainment, skipThreadContainment) || const DeepCollectionEquality().equals(other.skipThreadContainment, skipThreadContainment)) &&
            (identical(other.acceptsChatMessages, acceptsChatMessages) || const DeepCollectionEquality().equals(other.acceptsChatMessages, acceptsChatMessages)) &&
            (identical(other.isConfirmed, isConfirmed) || const DeepCollectionEquality().equals(other.isConfirmed, isConfirmed)) &&
            (identical(other.favicon, favicon) || const DeepCollectionEquality().equals(other.favicon, favicon)) &&
            (identical(other.apId, apId) || const DeepCollectionEquality().equals(other.apId, apId)) &&
            (identical(other.alsoKnownAs, alsoKnownAs) || const DeepCollectionEquality().equals(other.alsoKnownAs, alsoKnownAs)) &&
            (identical(other.unreadNotificationsCount, unreadNotificationsCount) || const DeepCollectionEquality().equals(other.unreadNotificationsCount, unreadNotificationsCount)) &&
            (identical(other.privacy, privacy) || const DeepCollectionEquality().equals(other.privacy, privacy)) &&
            (identical(other.sensitive, sensitive) || const DeepCollectionEquality().equals(other.sensitive, sensitive)) &&
            (identical(other.language, language) || const DeepCollectionEquality().equals(other.language, language)) &&
            (identical(other.showRole, showRole) || const DeepCollectionEquality().equals(other.showRole, showRole)) &&
            (identical(other.noRichText, noRichText) || const DeepCollectionEquality().equals(other.noRichText, noRichText)) &&
            (identical(other.actorType, actorType) || const DeepCollectionEquality().equals(other.actorType, actorType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(statusesCount) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(locked) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(headerStatic) ^
      const DeepCollectionEquality().hash(header) ^
      const DeepCollectionEquality().hash(followingCount) ^
      const DeepCollectionEquality().hash(followersCount) ^
      const DeepCollectionEquality().hash(fields) ^
      const DeepCollectionEquality().hash(emojis) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(bot) ^
      const DeepCollectionEquality().hash(avatarStatic) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(acct) ^
      const DeepCollectionEquality().hash(lastStatusAt) ^
      const DeepCollectionEquality().hash(discoverable) ^
      const DeepCollectionEquality().hash(followRequestsCount) ^
      const DeepCollectionEquality().hash(fqn) ^
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(muteExpiresAt) ^
      const DeepCollectionEquality().hash(backgroundImage) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(relationship) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      const DeepCollectionEquality().hash(isModerator) ^
      const DeepCollectionEquality().hash(confirmationPending) ^
      const DeepCollectionEquality().hash(hideFavorites) ^
      const DeepCollectionEquality().hash(hideFollowers) ^
      const DeepCollectionEquality().hash(hideFollows) ^
      const DeepCollectionEquality().hash(hideFollowersCount) ^
      const DeepCollectionEquality().hash(hideFollowsCount) ^
      const DeepCollectionEquality().hash(settingsStore) ^
      const DeepCollectionEquality().hash(chatToken) ^
      const DeepCollectionEquality().hash(deactivated) ^
      const DeepCollectionEquality().hash(allowFollowingMove) ^
      const DeepCollectionEquality().hash(unreadConversationCount) ^
      const DeepCollectionEquality().hash(notificationSettings) ^
      const DeepCollectionEquality().hash(skipThreadContainment) ^
      const DeepCollectionEquality().hash(acceptsChatMessages) ^
      const DeepCollectionEquality().hash(isConfirmed) ^
      const DeepCollectionEquality().hash(favicon) ^
      const DeepCollectionEquality().hash(apId) ^
      const DeepCollectionEquality().hash(alsoKnownAs) ^
      const DeepCollectionEquality().hash(unreadNotificationsCount) ^
      const DeepCollectionEquality().hash(privacy) ^
      const DeepCollectionEquality().hash(sensitive) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(showRole) ^
      const DeepCollectionEquality().hash(noRichText) ^
      const DeepCollectionEquality().hash(actorType);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMyAccountCopyWith<_UnifediApiMyAccount> get copyWith =>
      __$UnifediApiMyAccountCopyWithImpl<_UnifediApiMyAccount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMyAccountToJson(this);
  }
}

abstract class _UnifediApiMyAccount implements UnifediApiMyAccount {
  const factory _UnifediApiMyAccount(
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
      @HiveField(22)
          required bool? discoverable,
      @HiveField(23)
      @JsonKey(name: 'follow_requests_count')
          required int? followRequestsCount,
      @HiveField(24)
          required String? fqn,
      @HiveField(25)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(26)
          required DateTime? muteExpiresAt,
      @HiveField(26 + 1)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(26 + 2)
          required List<UnifediApiTag>? tags,
      @HiveField(26 + 3)
          required UnifediApiAccountRelationship? relationship,
      @HiveField(26 + 4)
      @JsonKey(name: 'is_admin')
          required bool? isAdmin,
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
      @HiveField(26 + 14)
      @JsonKey(name: 'settings_store')
          required Map<String, dynamic>? settingsStore,
      @HiveField(26 + 15)
      @JsonKey(name: 'chat_token')
          required String? chatToken,
      @HiveField(26 + 16)
          required bool? deactivated,
      @HiveField(26 + 17)
      @JsonKey(name: 'allow_following_move')
          required bool? allowFollowingMove,
      @HiveField(26 + 18)
      @JsonKey(name: 'unread_conversation_count')
          required int? unreadConversationCount,
      @HiveField(26 + 19)
      @JsonKey(name: 'notifications_settings')
          required UnifediApiMyAccountNotificationsSettings?
              notificationSettings,
      @HiveField(26 + 20)
      @JsonKey(name: 'skip_thread_containment')
          required bool? skipThreadContainment,
      @HiveField(26 + 21)
      @JsonKey(name: 'accepts_chat_messages')
          required bool? acceptsChatMessages,
      @HiveField(26 + 22)
      @JsonKey(name: 'is_confirmed')
          required bool? isConfirmed,
      @HiveField(26 + 23)
          required String? favicon,
      @HiveField(26 + 24)
          required String? apId,
      @HiveField(26 + 25)
      @JsonKey(name: 'also_known_as')
          required List<String>? alsoKnownAs,
      @HiveField(26 + 26)
      @JsonKey(name: 'unread_notifications_count')
          required int? unreadNotificationsCount,
      @HiveField(26 + 26 + 1)
          required String? privacy,
      @HiveField(26 + 26 + 2)
          required bool? sensitive,
      @HiveField(26 + 26 + 3)
          required String? language,
      @HiveField(26 + 26 + 6 + 1)
      @JsonKey(name: 'show_role')
          required bool? showRole,
      @HiveField(26 + 26 + 6 + 2)
      @JsonKey(name: 'no_rich_text')
          required bool? noRichText,
      @HiveField(26 + 26 + 6 + 4)
      @JsonKey(name: 'actor_type')
          required String? actorType}) = _$_UnifediApiMyAccount;

  factory _UnifediApiMyAccount.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMyAccount.fromJson;

  @override
  @HiveField(0)
  String get username => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int? get statusesCount => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool? get locked => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String? get headerStatic => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String? get header => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int? get followingCount => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  List<UnifediApiField>? get fields => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  List<UnifediApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  bool? get bot => throw _privateConstructorUsedError;
  @override
  @HiveField(15)
  @JsonKey(name: 'avatar_static')
  String get avatarStatic => throw _privateConstructorUsedError;
  @override
  @HiveField(16)
  String get avatar => throw _privateConstructorUsedError;
  @override
  @HiveField(17)
  String get acct => throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  bool? get discoverable => throw _privateConstructorUsedError;
  @override
  @HiveField(23)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount => throw _privateConstructorUsedError;
  @override
  @HiveField(24)
  String? get fqn => throw _privateConstructorUsedError;
  @override
  @HiveField(25)
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(26)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 2)
  List<UnifediApiTag>? get tags => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 3)
  UnifediApiAccountRelationship? get relationship =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount => throw _privateConstructorUsedError;
  @override

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @HiveField(26 + 14)
  @JsonKey(name: 'settings_store')
  Map<String, dynamic>? get settingsStore => throw _privateConstructorUsedError;
  @override

  /// The token needed for Unifedi chat. Only returned in verify_credentials
  @HiveField(26 + 15)
  @JsonKey(name: 'chat_token')
  String? get chatToken => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 16)
  bool? get deactivated => throw _privateConstructorUsedError;
  @override

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(26 + 17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove => throw _privateConstructorUsedError;
  @override

  /// The count of unread conversations. Only returned to the account owner.
  @HiveField(26 + 18)
  @JsonKey(name: 'unread_conversation_count')
  int? get unreadConversationCount => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 19)
  @JsonKey(name: 'notifications_settings')
  UnifediApiMyAccountNotificationsSettings? get notificationSettings =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 20)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 21)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 22)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 23)
  String? get favicon => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 24)
  String? get apId => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 25)
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26)
  @JsonKey(name: 'unread_notifications_count')
  int? get unreadNotificationsCount => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 1)
  String? get privacy => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 2)
  bool? get sensitive => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 3)
  String? get language => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 6 + 1)
  @JsonKey(name: 'show_role')
  bool? get showRole => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 6 + 2)
  @JsonKey(name: 'no_rich_text')
  bool? get noRichText => throw _privateConstructorUsedError;
  @override
  @HiveField(26 + 26 + 6 + 4)
  @JsonKey(name: 'actor_type')
  String? get actorType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMyAccountCopyWith<_UnifediApiMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

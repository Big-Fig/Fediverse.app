// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_my_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMyAccount _$MastodonApiMyAccountFromJson(Map<String, dynamic> json) {
  return _MastodonApiMyAccount.fromJson(json);
}

/// @nodoc
class _$MastodonApiMyAccountTearOff {
  const _$MastodonApiMyAccountTearOff();

  _MastodonApiMyAccount call(
      {@HiveField(0)
          required String username,
      @HiveField(1)
          required String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required int statusesCount,
      @HiveField(3)
          required String? note,
      @HiveField(4)
          required bool locked,
      @HiveField(5)
          required String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          required String headerStatic,
      @HiveField(7)
          required String header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          required int followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          required int followersCount,
      @HiveField(10)
          required List<MastodonApiField>? fields,
      @HiveField(11)
          required List<MastodonApiEmoji>? emojis,
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
          required MastodonApiMyAccountSource? source,
      @HiveField(22)
          required bool? discoverable,
      @HiveField(23)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(24)
          required DateTime? muteExpiresAt}) {
    return _MastodonApiMyAccount(
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
      source: source,
      discoverable: discoverable,
      suspended: suspended,
      muteExpiresAt: muteExpiresAt,
    );
  }

  MastodonApiMyAccount fromJson(Map<String, Object?> json) {
    return MastodonApiMyAccount.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMyAccount = _$MastodonApiMyAccountTearOff();

/// @nodoc
mixin _$MastodonApiMyAccount {
  @HiveField(0)
  String get username => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get locked => throw _privateConstructorUsedError;
  @HiveField(5)
  String get id => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String get headerStatic => throw _privateConstructorUsedError;
  @HiveField(7)
  String get header => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int get followingCount => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @HiveField(10)
  List<MastodonApiField>? get fields => throw _privateConstructorUsedError;
  @HiveField(11)
  List<MastodonApiEmoji>? get emojis => throw _privateConstructorUsedError;
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
  MastodonApiMyAccountSource? get source => throw _privateConstructorUsedError;
  @HiveField(22)
  bool? get discoverable => throw _privateConstructorUsedError;
  @HiveField(23)
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'mute_expires_at')
  @HiveField(24)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMyAccountCopyWith<MastodonApiMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMyAccountCopyWith<$Res> {
  factory $MastodonApiMyAccountCopyWith(MastodonApiMyAccount value,
          $Res Function(MastodonApiMyAccount) then) =
      _$MastodonApiMyAccountCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String username,
      @HiveField(1)
          String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          int statusesCount,
      @HiveField(3)
          String? note,
      @HiveField(4)
          bool locked,
      @HiveField(5)
          String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          String headerStatic,
      @HiveField(7)
          String header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          int followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          int followersCount,
      @HiveField(10)
          List<MastodonApiField>? fields,
      @HiveField(11)
          List<MastodonApiEmoji>? emojis,
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
          MastodonApiMyAccountSource? source,
      @HiveField(22)
          bool? discoverable,
      @HiveField(23)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(24)
          DateTime? muteExpiresAt});

  $MastodonApiMyAccountSourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$MastodonApiMyAccountCopyWithImpl<$Res>
    implements $MastodonApiMyAccountCopyWith<$Res> {
  _$MastodonApiMyAccountCopyWithImpl(this._value, this._then);

  final MastodonApiMyAccount _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMyAccount) _then;

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
    Object? source = freezed,
    Object? discoverable = freezed,
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
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
              as int,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      headerStatic: headerStatic == freezed
          ? _value.headerStatic
          : headerStatic // ignore: cast_nullable_to_non_nullable
              as String,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiEmoji>?,
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
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccountSource?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      muteExpiresAt: muteExpiresAt == freezed
          ? _value.muteExpiresAt
          : muteExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $MastodonApiMyAccountSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $MastodonApiMyAccountSourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiMyAccountCopyWith<$Res>
    implements $MastodonApiMyAccountCopyWith<$Res> {
  factory _$MastodonApiMyAccountCopyWith(_MastodonApiMyAccount value,
          $Res Function(_MastodonApiMyAccount) then) =
      __$MastodonApiMyAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String username,
      @HiveField(1)
          String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          int statusesCount,
      @HiveField(3)
          String? note,
      @HiveField(4)
          bool locked,
      @HiveField(5)
          String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          String headerStatic,
      @HiveField(7)
          String header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          int followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          int followersCount,
      @HiveField(10)
          List<MastodonApiField>? fields,
      @HiveField(11)
          List<MastodonApiEmoji>? emojis,
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
          MastodonApiMyAccountSource? source,
      @HiveField(22)
          bool? discoverable,
      @HiveField(23)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(24)
          DateTime? muteExpiresAt});

  @override
  $MastodonApiMyAccountSourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$MastodonApiMyAccountCopyWithImpl<$Res>
    extends _$MastodonApiMyAccountCopyWithImpl<$Res>
    implements _$MastodonApiMyAccountCopyWith<$Res> {
  __$MastodonApiMyAccountCopyWithImpl(
      _MastodonApiMyAccount _value, $Res Function(_MastodonApiMyAccount) _then)
      : super(_value, (v) => _then(v as _MastodonApiMyAccount));

  @override
  _MastodonApiMyAccount get _value => super._value as _MastodonApiMyAccount;

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
    Object? source = freezed,
    Object? discoverable = freezed,
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
  }) {
    return _then(_MastodonApiMyAccount(
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
              as int,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      headerStatic: headerStatic == freezed
          ? _value.headerStatic
          : headerStatic // ignore: cast_nullable_to_non_nullable
              as String,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiEmoji>?,
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
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccountSource?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      muteExpiresAt: muteExpiresAt == freezed
          ? _value.muteExpiresAt
          : muteExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiMyAccount implements _MastodonApiMyAccount {
  const _$_MastodonApiMyAccount(
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
          required this.source,
      @HiveField(22)
          required this.discoverable,
      @HiveField(23)
          required this.suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(24)
          required this.muteExpiresAt});

  factory _$_MastodonApiMyAccount.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiMyAccountFromJson(json);

  @override
  @HiveField(0)
  final String username;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  final int statusesCount;
  @override
  @HiveField(3)
  final String? note;
  @override
  @HiveField(4)
  final bool locked;
  @override
  @HiveField(5)
  final String id;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  final String headerStatic;
  @override
  @HiveField(7)
  final String header;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  final int followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @HiveField(10)
  final List<MastodonApiField>? fields;
  @override
  @HiveField(11)
  final List<MastodonApiEmoji>? emojis;
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
  final MastodonApiMyAccountSource? source;
  @override
  @HiveField(22)
  final bool? discoverable;
  @override
  @HiveField(23)
  final bool? suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(24)
  final DateTime? muteExpiresAt;

  @override
  String toString() {
    return 'MastodonApiMyAccount(username: $username, url: $url, statusesCount: $statusesCount, note: $note, locked: $locked, id: $id, headerStatic: $headerStatic, header: $header, followingCount: $followingCount, followersCount: $followersCount, fields: $fields, emojis: $emojis, displayName: $displayName, createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct, lastStatusAt: $lastStatusAt, source: $source, discoverable: $discoverable, suspended: $suspended, muteExpiresAt: $muteExpiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiMyAccount &&
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
            (identical(other.source, source) || other.source == source) &&
            (identical(other.discoverable, discoverable) ||
                other.discoverable == discoverable) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.muteExpiresAt, muteExpiresAt) ||
                other.muteExpiresAt == muteExpiresAt));
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
        source,
        discoverable,
        suspended,
        muteExpiresAt
      ]);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMyAccountCopyWith<_MastodonApiMyAccount> get copyWith =>
      __$MastodonApiMyAccountCopyWithImpl<_MastodonApiMyAccount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMyAccountToJson(this);
  }
}

abstract class _MastodonApiMyAccount implements MastodonApiMyAccount {
  const factory _MastodonApiMyAccount(
      {@HiveField(0)
          required String username,
      @HiveField(1)
          required String url,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required int statusesCount,
      @HiveField(3)
          required String? note,
      @HiveField(4)
          required bool locked,
      @HiveField(5)
          required String id,
      @HiveField(6)
      @JsonKey(name: 'header_static')
          required String headerStatic,
      @HiveField(7)
          required String header,
      @HiveField(8)
      @JsonKey(name: 'following_count')
          required int followingCount,
      @HiveField(9)
      @JsonKey(name: 'followers_count')
          required int followersCount,
      @HiveField(10)
          required List<MastodonApiField>? fields,
      @HiveField(11)
          required List<MastodonApiEmoji>? emojis,
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
          required MastodonApiMyAccountSource? source,
      @HiveField(22)
          required bool? discoverable,
      @HiveField(23)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(24)
          required DateTime? muteExpiresAt}) = _$_MastodonApiMyAccount;

  factory _MastodonApiMyAccount.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMyAccount.fromJson;

  @override
  @HiveField(0)
  String get username;
  @override
  @HiveField(1)
  String get url;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount;
  @override
  @HiveField(3)
  String? get note;
  @override
  @HiveField(4)
  bool get locked;
  @override
  @HiveField(5)
  String get id;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String get headerStatic;
  @override
  @HiveField(7)
  String get header;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int get followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @HiveField(10)
  List<MastodonApiField>? get fields;
  @override
  @HiveField(11)
  List<MastodonApiEmoji>? get emojis;
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
  MastodonApiMyAccountSource? get source;
  @override
  @HiveField(22)
  bool? get discoverable;
  @override
  @HiveField(23)
  bool? get suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(24)
  DateTime? get muteExpiresAt;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMyAccountCopyWith<_MastodonApiMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

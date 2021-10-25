// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccount _$MastodonApiAccountFromJson(Map<String, dynamic> json) {
  return _MastodonApiAccount.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccountTearOff {
  const _$MastodonApiAccountTearOff();

  _MastodonApiAccount call(
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
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(22)
          required DateTime? muteExpiresAt}) {
    return _MastodonApiAccount(
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
      suspended: suspended,
      muteExpiresAt: muteExpiresAt,
    );
  }

  MastodonApiAccount fromJson(Map<String, Object> json) {
    return MastodonApiAccount.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccount = _$MastodonApiAccountTearOff();

/// @nodoc
mixin _$MastodonApiAccount {
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
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'mute_expires_at')
  @HiveField(22)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccountCopyWith<MastodonApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccountCopyWith<$Res> {
  factory $MastodonApiAccountCopyWith(
          MastodonApiAccount value, $Res Function(MastodonApiAccount) then) =
      _$MastodonApiAccountCopyWithImpl<$Res>;
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
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(22)
          DateTime? muteExpiresAt});
}

/// @nodoc
class _$MastodonApiAccountCopyWithImpl<$Res>
    implements $MastodonApiAccountCopyWith<$Res> {
  _$MastodonApiAccountCopyWithImpl(this._value, this._then);

  final MastodonApiAccount _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccount) _then;

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
abstract class _$MastodonApiAccountCopyWith<$Res>
    implements $MastodonApiAccountCopyWith<$Res> {
  factory _$MastodonApiAccountCopyWith(
          _MastodonApiAccount value, $Res Function(_MastodonApiAccount) then) =
      __$MastodonApiAccountCopyWithImpl<$Res>;
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
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(22)
          DateTime? muteExpiresAt});
}

/// @nodoc
class __$MastodonApiAccountCopyWithImpl<$Res>
    extends _$MastodonApiAccountCopyWithImpl<$Res>
    implements _$MastodonApiAccountCopyWith<$Res> {
  __$MastodonApiAccountCopyWithImpl(
      _MastodonApiAccount _value, $Res Function(_MastodonApiAccount) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccount));

  @override
  _MastodonApiAccount get _value => super._value as _MastodonApiAccount;

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
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
  }) {
    return _then(_MastodonApiAccount(
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
class _$_MastodonApiAccount implements _MastodonApiAccount {
  const _$_MastodonApiAccount(
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
          required this.suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(22)
          required this.muteExpiresAt});

  factory _$_MastodonApiAccount.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccountFromJson(json);

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
  final bool? suspended;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(22)
  final DateTime? muteExpiresAt;

  @override
  String toString() {
    return 'MastodonApiAccount(username: $username, url: $url, statusesCount: $statusesCount, note: $note, locked: $locked, id: $id, headerStatic: $headerStatic, header: $header, followingCount: $followingCount, followersCount: $followersCount, fields: $fields, emojis: $emojis, displayName: $displayName, createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct, lastStatusAt: $lastStatusAt, suspended: $suspended, muteExpiresAt: $muteExpiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccount &&
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
            (identical(other.suspended, suspended) ||
                const DeepCollectionEquality()
                    .equals(other.suspended, suspended)) &&
            (identical(other.muteExpiresAt, muteExpiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.muteExpiresAt, muteExpiresAt)));
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
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(muteExpiresAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccountCopyWith<_MastodonApiAccount> get copyWith =>
      __$MastodonApiAccountCopyWithImpl<_MastodonApiAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccountToJson(this);
  }
}

abstract class _MastodonApiAccount implements MastodonApiAccount {
  const factory _MastodonApiAccount(
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
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(22)
          required DateTime? muteExpiresAt}) = _$_MastodonApiAccount;

  factory _MastodonApiAccount.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccount.fromJson;

  @override
  @HiveField(0)
  String get username => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get locked => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  @JsonKey(name: 'header_static')
  String get headerStatic => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String get header => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'following_count')
  int get followingCount => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  List<MastodonApiField>? get fields => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  List<MastodonApiEmoji>? get emojis => throw _privateConstructorUsedError;
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
  @HiveField(21)
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(22)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccountCopyWith<_MastodonApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

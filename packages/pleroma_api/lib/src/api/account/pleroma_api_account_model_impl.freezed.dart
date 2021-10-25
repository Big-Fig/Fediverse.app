// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccount _$PleromaApiAccountFromJson(Map<String, dynamic> json) {
  return _PleromaApiAccount.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountTearOff {
  const _$PleromaApiAccountTearOff();

  _PleromaApiAccount call(
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
          required List<PleromaApiField>? fields,
      @HiveField(11)
          required List<PleromaApiEmoji>? emojis,
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
      @HiveField(19)
          required PleromaApiAccountPleromaPart? pleroma,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          required DateTime? lastStatusAt,
      @HiveField(21)
          required String? fqn,
      @HiveField(22)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          required DateTime? muteExpiresAt}) {
    return _PleromaApiAccount(
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
      pleroma: pleroma,
      lastStatusAt: lastStatusAt,
      fqn: fqn,
      suspended: suspended,
      muteExpiresAt: muteExpiresAt,
    );
  }

  PleromaApiAccount fromJson(Map<String, Object> json) {
    return PleromaApiAccount.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccount = _$PleromaApiAccountTearOff();

/// @nodoc
mixin _$PleromaApiAccount {
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
  List<PleromaApiField>? get fields => throw _privateConstructorUsedError;
  @HiveField(11)
  List<PleromaApiEmoji>? get emojis => throw _privateConstructorUsedError;
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
  @HiveField(19)
  PleromaApiAccountPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountCopyWith<PleromaApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountCopyWith<$Res> {
  factory $PleromaApiAccountCopyWith(
          PleromaApiAccount value, $Res Function(PleromaApiAccount) then) =
      _$PleromaApiAccountCopyWithImpl<$Res>;
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
          List<PleromaApiField>? fields,
      @HiveField(11)
          List<PleromaApiEmoji>? emojis,
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
      @HiveField(19)
          PleromaApiAccountPleromaPart? pleroma,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          DateTime? lastStatusAt,
      @HiveField(21)
          String? fqn,
      @HiveField(22)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          DateTime? muteExpiresAt});

  $PleromaApiAccountPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiAccountCopyWithImpl<$Res>
    implements $PleromaApiAccountCopyWith<$Res> {
  _$PleromaApiAccountCopyWithImpl(this._value, this._then);

  final PleromaApiAccount _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccount) _then;

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
    Object? pleroma = freezed,
    Object? lastStatusAt = freezed,
    Object? fqn = freezed,
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
              as List<PleromaApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiEmoji>?,
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
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountPleromaPart?,
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
    ));
  }

  @override
  $PleromaApiAccountPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiAccountPleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccountCopyWith<$Res>
    implements $PleromaApiAccountCopyWith<$Res> {
  factory _$PleromaApiAccountCopyWith(
          _PleromaApiAccount value, $Res Function(_PleromaApiAccount) then) =
      __$PleromaApiAccountCopyWithImpl<$Res>;
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
          List<PleromaApiField>? fields,
      @HiveField(11)
          List<PleromaApiEmoji>? emojis,
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
      @HiveField(19)
          PleromaApiAccountPleromaPart? pleroma,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          DateTime? lastStatusAt,
      @HiveField(21)
          String? fqn,
      @HiveField(22)
          bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          DateTime? muteExpiresAt});

  @override
  $PleromaApiAccountPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiAccountCopyWithImpl<$Res>
    extends _$PleromaApiAccountCopyWithImpl<$Res>
    implements _$PleromaApiAccountCopyWith<$Res> {
  __$PleromaApiAccountCopyWithImpl(
      _PleromaApiAccount _value, $Res Function(_PleromaApiAccount) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccount));

  @override
  _PleromaApiAccount get _value => super._value as _PleromaApiAccount;

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
    Object? pleroma = freezed,
    Object? lastStatusAt = freezed,
    Object? fqn = freezed,
    Object? suspended = freezed,
    Object? muteExpiresAt = freezed,
  }) {
    return _then(_PleromaApiAccount(
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
              as List<PleromaApiField>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiEmoji>?,
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
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountPleromaPart?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccount implements _PleromaApiAccount {
  const _$_PleromaApiAccount(
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
      @HiveField(19)
          required this.pleroma,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          required this.lastStatusAt,
      @HiveField(21)
          required this.fqn,
      @HiveField(22)
          required this.suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          required this.muteExpiresAt});

  factory _$_PleromaApiAccount.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccountFromJson(json);

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
  final List<PleromaApiField>? fields;
  @override
  @HiveField(11)
  final List<PleromaApiEmoji>? emojis;
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
  @HiveField(19)
  final PleromaApiAccountPleromaPart? pleroma;
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
  String toString() {
    return 'PleromaApiAccount(username: $username, url: $url, statusesCount: $statusesCount, note: $note, locked: $locked, id: $id, headerStatic: $headerStatic, header: $header, followingCount: $followingCount, followersCount: $followersCount, fields: $fields, emojis: $emojis, displayName: $displayName, createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct, pleroma: $pleroma, lastStatusAt: $lastStatusAt, fqn: $fqn, suspended: $suspended, muteExpiresAt: $muteExpiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccount &&
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
            (identical(other.pleroma, pleroma) ||
                const DeepCollectionEquality()
                    .equals(other.pleroma, pleroma)) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastStatusAt, lastStatusAt)) &&
            (identical(other.fqn, fqn) ||
                const DeepCollectionEquality().equals(other.fqn, fqn)) &&
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
      const DeepCollectionEquality().hash(pleroma) ^
      const DeepCollectionEquality().hash(lastStatusAt) ^
      const DeepCollectionEquality().hash(fqn) ^
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(muteExpiresAt);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccountCopyWith<_PleromaApiAccount> get copyWith =>
      __$PleromaApiAccountCopyWithImpl<_PleromaApiAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountToJson(this);
  }
}

abstract class _PleromaApiAccount implements PleromaApiAccount {
  const factory _PleromaApiAccount(
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
          required List<PleromaApiField>? fields,
      @HiveField(11)
          required List<PleromaApiEmoji>? emojis,
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
      @HiveField(19)
          required PleromaApiAccountPleromaPart? pleroma,
      @HiveField(20)
      @JsonKey(name: 'last_status_at')
          required DateTime? lastStatusAt,
      @HiveField(21)
          required String? fqn,
      @HiveField(22)
          required bool? suspended,
      @JsonKey(name: 'mute_expires_at')
      @HiveField(23)
          required DateTime? muteExpiresAt}) = _$_PleromaApiAccount;

  factory _PleromaApiAccount.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccount.fromJson;

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
  List<PleromaApiField>? get fields => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  List<PleromaApiEmoji>? get emojis => throw _privateConstructorUsedError;
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
  @HiveField(19)
  PleromaApiAccountPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @override
  @HiveField(21)
  String? get fqn => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'mute_expires_at')
  @HiveField(23)
  DateTime? get muteExpiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountCopyWith<_PleromaApiAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

PleromaApiAccountPleromaPart _$PleromaApiAccountPleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccountPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountPleromaPartTearOff {
  const _$PleromaApiAccountPleromaPartTearOff();

  _PleromaApiAccountPleromaPart call(
      {@HiveField(1)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(2)
      @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
          required List<PleromaApiTag>? tags,
      @HiveField(3)
      @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
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
              PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
          required List<String>? alsoKnownAs}) {
    return _PleromaApiAccountPleromaPart(
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

  PleromaApiAccountPleromaPart fromJson(Map<String, Object> json) {
    return PleromaApiAccountPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccountPleromaPart = _$PleromaApiAccountPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiAccountPleromaPart {
  @HiveField(1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
  List<PleromaApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
  PleromaApiAccountRelationship? get relationship =>
      throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount => throw _privateConstructorUsedError;
  @HiveField(16)
  bool? get deactivated => throw _privateConstructorUsedError;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove => throw _privateConstructorUsedError;
  @HiveField(18)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment => throw _privateConstructorUsedError;
  @HiveField(19)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed => throw _privateConstructorUsedError;
  @HiveField(21)
  String? get favicon => throw _privateConstructorUsedError;
  @HiveField(22)
  String? get apId => throw _privateConstructorUsedError;
  @HiveField(23)
  @JsonKey(
      name: 'also_known_as',
      fromJson:
          PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountPleromaPartCopyWith<PleromaApiAccountPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountPleromaPartCopyWith<$Res> {
  factory $PleromaApiAccountPleromaPartCopyWith(
          PleromaApiAccountPleromaPart value,
          $Res Function(PleromaApiAccountPleromaPart) then) =
      _$PleromaApiAccountPleromaPartCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(2)
      @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
          List<PleromaApiTag>? tags,
      @HiveField(3)
      @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
          PleromaApiAccountRelationship? relationship,
      @HiveField(4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(16)
          bool? deactivated,
      @HiveField(17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(18)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(19)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(20)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(21)
          String? favicon,
      @HiveField(22)
          String? apId,
      @HiveField(23)
      @JsonKey(
          name: 'also_known_as',
          fromJson:
              PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
          List<String>? alsoKnownAs});

  $PleromaApiAccountRelationshipCopyWith<$Res>? get relationship;
}

/// @nodoc
class _$PleromaApiAccountPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiAccountPleromaPartCopyWith<$Res> {
  _$PleromaApiAccountPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiAccountPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccountPleromaPart) _then;

  @override
  $Res call({
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
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationship?,
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
  $PleromaApiAccountRelationshipCopyWith<$Res>? get relationship {
    if (_value.relationship == null) {
      return null;
    }

    return $PleromaApiAccountRelationshipCopyWith<$Res>(_value.relationship!,
        (value) {
      return _then(_value.copyWith(relationship: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccountPleromaPartCopyWith<$Res>
    implements $PleromaApiAccountPleromaPartCopyWith<$Res> {
  factory _$PleromaApiAccountPleromaPartCopyWith(
          _PleromaApiAccountPleromaPart value,
          $Res Function(_PleromaApiAccountPleromaPart) then) =
      __$PleromaApiAccountPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(2)
      @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
          List<PleromaApiTag>? tags,
      @HiveField(3)
      @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
          PleromaApiAccountRelationship? relationship,
      @HiveField(4)
      @JsonKey(name: 'is_admin')
          bool? isAdmin,
      @HiveField(5)
      @JsonKey(name: 'is_moderator')
          bool? isModerator,
      @HiveField(7)
      @JsonKey(name: 'confirmation_pending')
          bool? confirmationPending,
      @HiveField(8)
      @JsonKey(name: 'hide_favorites')
          bool? hideFavorites,
      @HiveField(9)
      @JsonKey(name: 'hide_followers')
          bool? hideFollowers,
      @HiveField(11)
      @JsonKey(name: 'hide_follows')
          bool? hideFollows,
      @HiveField(12)
      @JsonKey(name: 'hide_followers_count')
          bool? hideFollowersCount,
      @HiveField(13)
      @JsonKey(name: 'hide_follows_count')
          bool? hideFollowsCount,
      @HiveField(16)
          bool? deactivated,
      @HiveField(17)
      @JsonKey(name: 'allow_following_move')
          bool? allowFollowingMove,
      @HiveField(18)
      @JsonKey(name: 'skip_thread_containment')
          bool? skipThreadContainment,
      @HiveField(19)
      @JsonKey(name: 'accepts_chat_messages')
          bool? acceptsChatMessages,
      @HiveField(20)
      @JsonKey(name: 'is_confirmed')
          bool? isConfirmed,
      @HiveField(21)
          String? favicon,
      @HiveField(22)
          String? apId,
      @HiveField(23)
      @JsonKey(
          name: 'also_known_as',
          fromJson:
              PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
          List<String>? alsoKnownAs});

  @override
  $PleromaApiAccountRelationshipCopyWith<$Res>? get relationship;
}

/// @nodoc
class __$PleromaApiAccountPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiAccountPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiAccountPleromaPartCopyWith<$Res> {
  __$PleromaApiAccountPleromaPartCopyWithImpl(
      _PleromaApiAccountPleromaPart _value,
      $Res Function(_PleromaApiAccountPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccountPleromaPart));

  @override
  _PleromaApiAccountPleromaPart get _value =>
      super._value as _PleromaApiAccountPleromaPart;

  @override
  $Res call({
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
    return _then(_PleromaApiAccountPleromaPart(
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationship?,
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
class _$_PleromaApiAccountPleromaPart implements _PleromaApiAccountPleromaPart {
  const _$_PleromaApiAccountPleromaPart(
      {@HiveField(1)
      @JsonKey(name: 'background_image')
          required this.backgroundImage,
      @HiveField(2)
      @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
          required this.tags,
      @HiveField(3)
      @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
          required this.relationship,
      @HiveField(4)
      @JsonKey(name: 'is_admin')
          required this.isAdmin,
      @HiveField(5)
      @JsonKey(name: 'is_moderator')
          required this.isModerator,
      @HiveField(7)
      @JsonKey(name: 'confirmation_pending')
          required this.confirmationPending,
      @HiveField(8)
      @JsonKey(name: 'hide_favorites')
          required this.hideFavorites,
      @HiveField(9)
      @JsonKey(name: 'hide_followers')
          required this.hideFollowers,
      @HiveField(11)
      @JsonKey(name: 'hide_follows')
          required this.hideFollows,
      @HiveField(12)
      @JsonKey(name: 'hide_followers_count')
          required this.hideFollowersCount,
      @HiveField(13)
      @JsonKey(name: 'hide_follows_count')
          required this.hideFollowsCount,
      @HiveField(16)
          required this.deactivated,
      @HiveField(17)
      @JsonKey(name: 'allow_following_move')
          required this.allowFollowingMove,
      @HiveField(18)
      @JsonKey(name: 'skip_thread_containment')
          required this.skipThreadContainment,
      @HiveField(19)
      @JsonKey(name: 'accepts_chat_messages')
          required this.acceptsChatMessages,
      @HiveField(20)
      @JsonKey(name: 'is_confirmed')
          required this.isConfirmed,
      @HiveField(21)
          required this.favicon,
      @HiveField(22)
          required this.apId,
      @HiveField(23)
      @JsonKey(
          name: 'also_known_as',
          fromJson:
              PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
          required this.alsoKnownAs});

  factory _$_PleromaApiAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccountPleromaPartFromJson(json);

  @override
  @HiveField(1)
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  @HiveField(2)
  @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
  final List<PleromaApiTag>? tags;
  @override
  @HiveField(3)
  @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
  final PleromaApiAccountRelationship? relationship;
  @override
  @HiveField(4)
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_moderator')
  final bool? isModerator;
  @override
  @HiveField(7)
  @JsonKey(name: 'confirmation_pending')
  final bool? confirmationPending;
  @override
  @HiveField(8)
  @JsonKey(name: 'hide_favorites')
  final bool? hideFavorites;
  @override
  @HiveField(9)
  @JsonKey(name: 'hide_followers')
  final bool? hideFollowers;
  @override
  @HiveField(11)
  @JsonKey(name: 'hide_follows')
  final bool? hideFollows;
  @override
  @HiveField(12)
  @JsonKey(name: 'hide_followers_count')
  final bool? hideFollowersCount;
  @override
  @HiveField(13)
  @JsonKey(name: 'hide_follows_count')
  final bool? hideFollowsCount;
  @override
  @HiveField(16)
  final bool? deactivated;
  @override

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(17)
  @JsonKey(name: 'allow_following_move')
  final bool? allowFollowingMove;
  @override
  @HiveField(18)
  @JsonKey(name: 'skip_thread_containment')
  final bool? skipThreadContainment;
  @override
  @HiveField(19)
  @JsonKey(name: 'accepts_chat_messages')
  final bool? acceptsChatMessages;
  @override
  @HiveField(20)
  @JsonKey(name: 'is_confirmed')
  final bool? isConfirmed;
  @override
  @HiveField(21)
  final String? favicon;
  @override
  @HiveField(22)
  final String? apId;
  @override
  @HiveField(23)
  @JsonKey(
      name: 'also_known_as',
      fromJson:
          PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
  final List<String>? alsoKnownAs;

  @override
  String toString() {
    return 'PleromaApiAccountPleromaPart(backgroundImage: $backgroundImage, tags: $tags, relationship: $relationship, isAdmin: $isAdmin, isModerator: $isModerator, confirmationPending: $confirmationPending, hideFavorites: $hideFavorites, hideFollowers: $hideFollowers, hideFollows: $hideFollows, hideFollowersCount: $hideFollowersCount, hideFollowsCount: $hideFollowsCount, deactivated: $deactivated, allowFollowingMove: $allowFollowingMove, skipThreadContainment: $skipThreadContainment, acceptsChatMessages: $acceptsChatMessages, isConfirmed: $isConfirmed, favicon: $favicon, apId: $apId, alsoKnownAs: $alsoKnownAs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccountPleromaPart &&
            (identical(other.backgroundImage, backgroundImage) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundImage, backgroundImage)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.relationship, relationship) ||
                const DeepCollectionEquality()
                    .equals(other.relationship, relationship)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.isAdmin, isAdmin)) &&
            (identical(other.isModerator, isModerator) ||
                const DeepCollectionEquality()
                    .equals(other.isModerator, isModerator)) &&
            (identical(other.confirmationPending, confirmationPending) ||
                const DeepCollectionEquality()
                    .equals(other.confirmationPending, confirmationPending)) &&
            (identical(other.hideFavorites, hideFavorites) ||
                const DeepCollectionEquality()
                    .equals(other.hideFavorites, hideFavorites)) &&
            (identical(other.hideFollowers, hideFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.hideFollowers, hideFollowers)) &&
            (identical(other.hideFollows, hideFollows) ||
                const DeepCollectionEquality()
                    .equals(other.hideFollows, hideFollows)) &&
            (identical(other.hideFollowersCount, hideFollowersCount) ||
                const DeepCollectionEquality()
                    .equals(other.hideFollowersCount, hideFollowersCount)) &&
            (identical(other.hideFollowsCount, hideFollowsCount) ||
                const DeepCollectionEquality()
                    .equals(other.hideFollowsCount, hideFollowsCount)) &&
            (identical(other.deactivated, deactivated) ||
                const DeepCollectionEquality()
                    .equals(other.deactivated, deactivated)) &&
            (identical(other.allowFollowingMove, allowFollowingMove) ||
                const DeepCollectionEquality()
                    .equals(other.allowFollowingMove, allowFollowingMove)) &&
            (identical(other.skipThreadContainment, skipThreadContainment) ||
                const DeepCollectionEquality().equals(
                    other.skipThreadContainment, skipThreadContainment)) &&
            (identical(other.acceptsChatMessages, acceptsChatMessages) ||
                const DeepCollectionEquality()
                    .equals(other.acceptsChatMessages, acceptsChatMessages)) &&
            (identical(other.isConfirmed, isConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.isConfirmed, isConfirmed)) &&
            (identical(other.favicon, favicon) ||
                const DeepCollectionEquality()
                    .equals(other.favicon, favicon)) &&
            (identical(other.apId, apId) ||
                const DeepCollectionEquality().equals(other.apId, apId)) &&
            (identical(other.alsoKnownAs, alsoKnownAs) ||
                const DeepCollectionEquality()
                    .equals(other.alsoKnownAs, alsoKnownAs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
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
      const DeepCollectionEquality().hash(deactivated) ^
      const DeepCollectionEquality().hash(allowFollowingMove) ^
      const DeepCollectionEquality().hash(skipThreadContainment) ^
      const DeepCollectionEquality().hash(acceptsChatMessages) ^
      const DeepCollectionEquality().hash(isConfirmed) ^
      const DeepCollectionEquality().hash(favicon) ^
      const DeepCollectionEquality().hash(apId) ^
      const DeepCollectionEquality().hash(alsoKnownAs);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccountPleromaPartCopyWith<_PleromaApiAccountPleromaPart>
      get copyWith => __$PleromaApiAccountPleromaPartCopyWithImpl<
          _PleromaApiAccountPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountPleromaPartToJson(this);
  }
}

abstract class _PleromaApiAccountPleromaPart
    implements PleromaApiAccountPleromaPart {
  const factory _PleromaApiAccountPleromaPart(
      {@HiveField(1)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(2)
      @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
          required List<PleromaApiTag>? tags,
      @HiveField(3)
      @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
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
              PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
          required List<String>?
              alsoKnownAs}) = _$_PleromaApiAccountPleromaPart;

  factory _PleromaApiAccountPleromaPart.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccountPleromaPart.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(fromJson: PleromaApiTag.fromJsonListOrNullOnError)
  List<PleromaApiTag>? get tags => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(fromJson: PleromaApiAccountRelationship.fromJsonOrNullOnError)
  PleromaApiAccountRelationship? get relationship =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'is_admin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_moderator')
  bool? get isModerator => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  @JsonKey(name: 'confirmation_pending')
  bool? get confirmationPending => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'hide_favorites')
  bool? get hideFavorites => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  @JsonKey(name: 'hide_followers')
  bool? get hideFollowers => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  @JsonKey(name: 'hide_follows')
  bool? get hideFollows => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  @JsonKey(name: 'hide_followers_count')
  bool? get hideFollowersCount => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  @JsonKey(name: 'hide_follows_count')
  bool? get hideFollowsCount => throw _privateConstructorUsedError;
  @override
  @HiveField(16)
  bool? get deactivated => throw _privateConstructorUsedError;
  @override

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(17)
  @JsonKey(name: 'allow_following_move')
  bool? get allowFollowingMove => throw _privateConstructorUsedError;
  @override
  @HiveField(18)
  @JsonKey(name: 'skip_thread_containment')
  bool? get skipThreadContainment => throw _privateConstructorUsedError;
  @override
  @HiveField(19)
  @JsonKey(name: 'accepts_chat_messages')
  bool? get acceptsChatMessages => throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  @JsonKey(name: 'is_confirmed')
  bool? get isConfirmed => throw _privateConstructorUsedError;
  @override
  @HiveField(21)
  String? get favicon => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  String? get apId => throw _privateConstructorUsedError;
  @override
  @HiveField(23)
  @JsonKey(
      name: 'also_known_as',
      fromJson:
          PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError)
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountPleromaPartCopyWith<_PleromaApiAccountPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

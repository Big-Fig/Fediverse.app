// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_mention_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMention _$MastodonApiMentionFromJson(Map<String, dynamic> json) {
  return _MastodonApiMention.fromJson(json);
}

/// @nodoc
class _$MastodonApiMentionTearOff {
  const _$MastodonApiMentionTearOff();

  _MastodonApiMention call(
      {@HiveField(0) required String acct,
      @HiveField(1) required String id,
      @HiveField(2) required String url,
      @HiveField(3) required String? username}) {
    return _MastodonApiMention(
      acct: acct,
      id: id,
      url: url,
      username: username,
    );
  }

  MastodonApiMention fromJson(Map<String, Object> json) {
    return MastodonApiMention.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMention = _$MastodonApiMentionTearOff();

/// @nodoc
mixin _$MastodonApiMention {
  @HiveField(0)
  String get acct => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMentionCopyWith<MastodonApiMention> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMentionCopyWith<$Res> {
  factory $MastodonApiMentionCopyWith(
          MastodonApiMention value, $Res Function(MastodonApiMention) then) =
      _$MastodonApiMentionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String acct,
      @HiveField(1) String id,
      @HiveField(2) String url,
      @HiveField(3) String? username});
}

/// @nodoc
class _$MastodonApiMentionCopyWithImpl<$Res>
    implements $MastodonApiMentionCopyWith<$Res> {
  _$MastodonApiMentionCopyWithImpl(this._value, this._then);

  final MastodonApiMention _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMention) _then;

  @override
  $Res call({
    Object? acct = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiMentionCopyWith<$Res>
    implements $MastodonApiMentionCopyWith<$Res> {
  factory _$MastodonApiMentionCopyWith(
          _MastodonApiMention value, $Res Function(_MastodonApiMention) then) =
      __$MastodonApiMentionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String acct,
      @HiveField(1) String id,
      @HiveField(2) String url,
      @HiveField(3) String? username});
}

/// @nodoc
class __$MastodonApiMentionCopyWithImpl<$Res>
    extends _$MastodonApiMentionCopyWithImpl<$Res>
    implements _$MastodonApiMentionCopyWith<$Res> {
  __$MastodonApiMentionCopyWithImpl(
      _MastodonApiMention _value, $Res Function(_MastodonApiMention) _then)
      : super(_value, (v) => _then(v as _MastodonApiMention));

  @override
  _MastodonApiMention get _value => super._value as _MastodonApiMention;

  @override
  $Res call({
    Object? acct = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? username = freezed,
  }) {
    return _then(_MastodonApiMention(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiMention implements _MastodonApiMention {
  const _$_MastodonApiMention(
      {@HiveField(0) required this.acct,
      @HiveField(1) required this.id,
      @HiveField(2) required this.url,
      @HiveField(3) required this.username});

  factory _$_MastodonApiMention.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiMentionFromJson(json);

  @override
  @HiveField(0)
  final String acct;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String url;
  @override
  @HiveField(3)
  final String? username;

  @override
  String toString() {
    return 'MastodonApiMention(acct: $acct, id: $id, url: $url, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiMention &&
            (identical(other.acct, acct) ||
                const DeepCollectionEquality().equals(other.acct, acct)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(acct) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMentionCopyWith<_MastodonApiMention> get copyWith =>
      __$MastodonApiMentionCopyWithImpl<_MastodonApiMention>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMentionToJson(this);
  }
}

abstract class _MastodonApiMention implements MastodonApiMention {
  const factory _MastodonApiMention(
      {@HiveField(0) required String acct,
      @HiveField(1) required String id,
      @HiveField(2) required String url,
      @HiveField(3) required String? username}) = _$_MastodonApiMention;

  factory _MastodonApiMention.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMention.fromJson;

  @override
  @HiveField(0)
  String get acct => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMentionCopyWith<_MastodonApiMention> get copyWith =>
      throw _privateConstructorUsedError;
}

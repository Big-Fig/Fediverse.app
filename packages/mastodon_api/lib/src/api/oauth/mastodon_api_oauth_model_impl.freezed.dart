// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_oauth_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiOAuthToken _$MastodonApiOAuthTokenFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiOAuthToken.fromJson(json);
}

/// @nodoc
class _$MastodonApiOAuthTokenTearOff {
  const _$MastodonApiOAuthTokenTearOff();

  _MastodonApiOAuthToken call(
      {@HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') required String tokenType}) {
    return _MastodonApiOAuthToken(
      accessToken: accessToken,
      tokenType: tokenType,
    );
  }

  MastodonApiOAuthToken fromJson(Map<String, Object?> json) {
    return MastodonApiOAuthToken.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiOAuthToken = _$MastodonApiOAuthTokenTearOff();

/// @nodoc
mixin _$MastodonApiOAuthToken {
  @HiveField(0)
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiOAuthTokenCopyWith<MastodonApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiOAuthTokenCopyWith<$Res> {
  factory $MastodonApiOAuthTokenCopyWith(MastodonApiOAuthToken value,
          $Res Function(MastodonApiOAuthToken) then) =
      _$MastodonApiOAuthTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'access_token') String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class _$MastodonApiOAuthTokenCopyWithImpl<$Res>
    implements $MastodonApiOAuthTokenCopyWith<$Res> {
  _$MastodonApiOAuthTokenCopyWithImpl(this._value, this._then);

  final MastodonApiOAuthToken _value;
  // ignore: unused_field
  final $Res Function(MastodonApiOAuthToken) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiOAuthTokenCopyWith<$Res>
    implements $MastodonApiOAuthTokenCopyWith<$Res> {
  factory _$MastodonApiOAuthTokenCopyWith(_MastodonApiOAuthToken value,
          $Res Function(_MastodonApiOAuthToken) then) =
      __$MastodonApiOAuthTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'access_token') String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class __$MastodonApiOAuthTokenCopyWithImpl<$Res>
    extends _$MastodonApiOAuthTokenCopyWithImpl<$Res>
    implements _$MastodonApiOAuthTokenCopyWith<$Res> {
  __$MastodonApiOAuthTokenCopyWithImpl(_MastodonApiOAuthToken _value,
      $Res Function(_MastodonApiOAuthToken) _then)
      : super(_value, (v) => _then(v as _MastodonApiOAuthToken));

  @override
  _MastodonApiOAuthToken get _value => super._value as _MastodonApiOAuthToken;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_MastodonApiOAuthToken(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiOAuthToken implements _MastodonApiOAuthToken {
  const _$_MastodonApiOAuthToken(
      {@HiveField(0) @JsonKey(name: 'access_token') required this.accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') required this.tokenType});

  factory _$_MastodonApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiOAuthTokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: 'token_type')
  final String tokenType;

  @override
  String toString() {
    return 'MastodonApiOAuthToken(accessToken: $accessToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiOAuthToken &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiOAuthTokenCopyWith<_MastodonApiOAuthToken> get copyWith =>
      __$MastodonApiOAuthTokenCopyWithImpl<_MastodonApiOAuthToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiOAuthTokenToJson(this);
  }
}

abstract class _MastodonApiOAuthToken implements MastodonApiOAuthToken {
  const factory _MastodonApiOAuthToken(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          required String accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          required String tokenType}) = _$_MastodonApiOAuthToken;

  factory _MastodonApiOAuthToken.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiOAuthToken.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiOAuthTokenCopyWith<_MastodonApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

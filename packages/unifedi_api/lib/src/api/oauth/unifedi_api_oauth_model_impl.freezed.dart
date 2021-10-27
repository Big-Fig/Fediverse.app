// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_oauth_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiOAuthToken _$UnifediApiOAuthTokenFromJson(Map<String, dynamic> json) {
  return _UnifediApiOAuthToken.fromJson(json);
}

/// @nodoc
class _$UnifediApiOAuthTokenTearOff {
  const _$UnifediApiOAuthTokenTearOff();

  _UnifediApiOAuthToken call(
      {@HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') required String tokenType,
      @HiveField(2) required String? id,
      @HiveField(3) required String? me}) {
    return _UnifediApiOAuthToken(
      accessToken: accessToken,
      tokenType: tokenType,
      id: id,
      me: me,
    );
  }

  UnifediApiOAuthToken fromJson(Map<String, Object?> json) {
    return UnifediApiOAuthToken.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiOAuthToken = _$UnifediApiOAuthTokenTearOff();

/// @nodoc
mixin _$UnifediApiOAuthToken {
  @HiveField(0)
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get me => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiOAuthTokenCopyWith<UnifediApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiOAuthTokenCopyWith<$Res> {
  factory $UnifediApiOAuthTokenCopyWith(UnifediApiOAuthToken value,
          $Res Function(UnifediApiOAuthToken) then) =
      _$UnifediApiOAuthTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'access_token') String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') String tokenType,
      @HiveField(2) String? id,
      @HiveField(3) String? me});
}

/// @nodoc
class _$UnifediApiOAuthTokenCopyWithImpl<$Res>
    implements $UnifediApiOAuthTokenCopyWith<$Res> {
  _$UnifediApiOAuthTokenCopyWithImpl(this._value, this._then);

  final UnifediApiOAuthToken _value;
  // ignore: unused_field
  final $Res Function(UnifediApiOAuthToken) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? id = freezed,
    Object? me = freezed,
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiOAuthTokenCopyWith<$Res>
    implements $UnifediApiOAuthTokenCopyWith<$Res> {
  factory _$UnifediApiOAuthTokenCopyWith(_UnifediApiOAuthToken value,
          $Res Function(_UnifediApiOAuthToken) then) =
      __$UnifediApiOAuthTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'access_token') String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') String tokenType,
      @HiveField(2) String? id,
      @HiveField(3) String? me});
}

/// @nodoc
class __$UnifediApiOAuthTokenCopyWithImpl<$Res>
    extends _$UnifediApiOAuthTokenCopyWithImpl<$Res>
    implements _$UnifediApiOAuthTokenCopyWith<$Res> {
  __$UnifediApiOAuthTokenCopyWithImpl(
      _UnifediApiOAuthToken _value, $Res Function(_UnifediApiOAuthToken) _then)
      : super(_value, (v) => _then(v as _UnifediApiOAuthToken));

  @override
  _UnifediApiOAuthToken get _value => super._value as _UnifediApiOAuthToken;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? id = freezed,
    Object? me = freezed,
  }) {
    return _then(_UnifediApiOAuthToken(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiOAuthToken implements _UnifediApiOAuthToken {
  const _$_UnifediApiOAuthToken(
      {@HiveField(0) @JsonKey(name: 'access_token') required this.accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') required this.tokenType,
      @HiveField(2) required this.id,
      @HiveField(3) required this.me});

  factory _$_UnifediApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiOAuthTokenFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @HiveField(2)
  final String? id;
  @override
  @HiveField(3)
  final String? me;

  @override
  String toString() {
    return 'UnifediApiOAuthToken(accessToken: $accessToken, tokenType: $tokenType, id: $id, me: $me)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiOAuthToken &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.me, me) || other.me == me));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType, id, me);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiOAuthTokenCopyWith<_UnifediApiOAuthToken> get copyWith =>
      __$UnifediApiOAuthTokenCopyWithImpl<_UnifediApiOAuthToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiOAuthTokenToJson(this);
  }
}

abstract class _UnifediApiOAuthToken implements UnifediApiOAuthToken {
  const factory _UnifediApiOAuthToken(
      {@HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
      @HiveField(1) @JsonKey(name: 'token_type') required String tokenType,
      @HiveField(2) required String? id,
      @HiveField(3) required String? me}) = _$_UnifediApiOAuthToken;

  factory _UnifediApiOAuthToken.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiOAuthToken.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @HiveField(1)
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @HiveField(2)
  String? get id;
  @override
  @HiveField(3)
  String? get me;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiOAuthTokenCopyWith<_UnifediApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_oauth_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiOAuthToken _$PleromaApiOAuthTokenFromJson(Map<String, dynamic> json) {
  return _PleromaApiOAuthToken.fromJson(json);
}

/// @nodoc
class _$PleromaApiOAuthTokenTearOff {
  const _$PleromaApiOAuthTokenTearOff();

  _PleromaApiOAuthToken call(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          required String accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          required String tokenType,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
          required String? id,
      @HiveField(3)
          required String? me}) {
    return _PleromaApiOAuthToken(
      accessToken: accessToken,
      tokenType: tokenType,
      id: id,
      me: me,
    );
  }

  PleromaApiOAuthToken fromJson(Map<String, Object?> json) {
    return PleromaApiOAuthToken.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiOAuthToken = _$PleromaApiOAuthTokenTearOff();

/// @nodoc
mixin _$PleromaApiOAuthToken {
  @HiveField(0)
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get me => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiOAuthTokenCopyWith<PleromaApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiOAuthTokenCopyWith<$Res> {
  factory $PleromaApiOAuthTokenCopyWith(PleromaApiOAuthToken value,
          $Res Function(PleromaApiOAuthToken) then) =
      _$PleromaApiOAuthTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          String accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          String tokenType,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
          String? id,
      @HiveField(3)
          String? me});
}

/// @nodoc
class _$PleromaApiOAuthTokenCopyWithImpl<$Res>
    implements $PleromaApiOAuthTokenCopyWith<$Res> {
  _$PleromaApiOAuthTokenCopyWithImpl(this._value, this._then);

  final PleromaApiOAuthToken _value;
  // ignore: unused_field
  final $Res Function(PleromaApiOAuthToken) _then;

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
abstract class _$PleromaApiOAuthTokenCopyWith<$Res>
    implements $PleromaApiOAuthTokenCopyWith<$Res> {
  factory _$PleromaApiOAuthTokenCopyWith(_PleromaApiOAuthToken value,
          $Res Function(_PleromaApiOAuthToken) then) =
      __$PleromaApiOAuthTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          String accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          String tokenType,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
          String? id,
      @HiveField(3)
          String? me});
}

/// @nodoc
class __$PleromaApiOAuthTokenCopyWithImpl<$Res>
    extends _$PleromaApiOAuthTokenCopyWithImpl<$Res>
    implements _$PleromaApiOAuthTokenCopyWith<$Res> {
  __$PleromaApiOAuthTokenCopyWithImpl(
      _PleromaApiOAuthToken _value, $Res Function(_PleromaApiOAuthToken) _then)
      : super(_value, (v) => _then(v as _PleromaApiOAuthToken));

  @override
  _PleromaApiOAuthToken get _value => super._value as _PleromaApiOAuthToken;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? id = freezed,
    Object? me = freezed,
  }) {
    return _then(_PleromaApiOAuthToken(
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
class _$_PleromaApiOAuthToken implements _PleromaApiOAuthToken {
  const _$_PleromaApiOAuthToken(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          required this.accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          required this.tokenType,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
          required this.id,
      @HiveField(3)
          required this.me});

  factory _$_PleromaApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiOAuthTokenFromJson(json);

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
  @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
  final String? id;
  @override
  @HiveField(3)
  final String? me;

  @override
  String toString() {
    return 'PleromaApiOAuthToken(accessToken: $accessToken, tokenType: $tokenType, id: $id, me: $me)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiOAuthToken &&
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
  _$PleromaApiOAuthTokenCopyWith<_PleromaApiOAuthToken> get copyWith =>
      __$PleromaApiOAuthTokenCopyWithImpl<_PleromaApiOAuthToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiOAuthTokenToJson(this);
  }
}

abstract class _PleromaApiOAuthToken implements PleromaApiOAuthToken {
  const factory _PleromaApiOAuthToken(
      {@HiveField(0)
      @JsonKey(name: 'access_token')
          required String accessToken,
      @HiveField(1)
      @JsonKey(name: 'token_type')
          required String tokenType,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
          required String? id,
      @HiveField(3)
          required String? me}) = _$_PleromaApiOAuthToken;

  factory _PleromaApiOAuthToken.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiOAuthToken.fromJson;

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
  @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
  String? get id;
  @override
  @HiveField(3)
  String? get me;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiOAuthTokenCopyWith<_PleromaApiOAuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

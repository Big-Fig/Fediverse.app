// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_application_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessApplicationToken _$PleromaApiAccessApplicationTokenFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessApplicationToken.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessApplicationTokenTearOff {
  const _$PleromaApiAccessApplicationTokenTearOff();

  _PleromaApiAccessApplicationToken call(
      {@HiveField(1)
          required PleromaApiAccessScopes scopes,
      @HiveField(2)
          required PleromaApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          required PleromaApiOAuthToken oauthToken}) {
    return _PleromaApiAccessApplicationToken(
      scopes: scopes,
      clientApplication: clientApplication,
      oauthToken: oauthToken,
    );
  }

  PleromaApiAccessApplicationToken fromJson(Map<String, Object> json) {
    return PleromaApiAccessApplicationToken.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessApplicationToken =
    _$PleromaApiAccessApplicationTokenTearOff();

/// @nodoc
mixin _$PleromaApiAccessApplicationToken {
  @HiveField(1)
  PleromaApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiClientApplication get clientApplication =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessApplicationTokenCopyWith<PleromaApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessApplicationTokenCopyWith<$Res> {
  factory $PleromaApiAccessApplicationTokenCopyWith(
          PleromaApiAccessApplicationToken value,
          $Res Function(PleromaApiAccessApplicationToken) then) =
      _$PleromaApiAccessApplicationTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
          PleromaApiAccessScopes scopes,
      @HiveField(2)
          PleromaApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken});

  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
  $PleromaApiClientApplicationCopyWith<$Res> get clientApplication;
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class _$PleromaApiAccessApplicationTokenCopyWithImpl<$Res>
    implements $PleromaApiAccessApplicationTokenCopyWith<$Res> {
  _$PleromaApiAccessApplicationTokenCopyWithImpl(this._value, this._then);

  final PleromaApiAccessApplicationToken _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessApplicationToken) _then;

  @override
  $Res call({
    Object? scopes = freezed,
    Object? clientApplication = freezed,
    Object? oauthToken = freezed,
  }) {
    return _then(_value.copyWith(
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as PleromaApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
    ));
  }

  @override
  $PleromaApiAccessScopesCopyWith<$Res> get scopes {
    return $PleromaApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }

  @override
  $PleromaApiClientApplicationCopyWith<$Res> get clientApplication {
    return $PleromaApiClientApplicationCopyWith<$Res>(_value.clientApplication,
        (value) {
      return _then(_value.copyWith(clientApplication: value));
    });
  }

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $PleromaApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccessApplicationTokenCopyWith<$Res>
    implements $PleromaApiAccessApplicationTokenCopyWith<$Res> {
  factory _$PleromaApiAccessApplicationTokenCopyWith(
          _PleromaApiAccessApplicationToken value,
          $Res Function(_PleromaApiAccessApplicationToken) then) =
      __$PleromaApiAccessApplicationTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          PleromaApiAccessScopes scopes,
      @HiveField(2)
          PleromaApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          PleromaApiOAuthToken oauthToken});

  @override
  $PleromaApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $PleromaApiClientApplicationCopyWith<$Res> get clientApplication;
  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class __$PleromaApiAccessApplicationTokenCopyWithImpl<$Res>
    extends _$PleromaApiAccessApplicationTokenCopyWithImpl<$Res>
    implements _$PleromaApiAccessApplicationTokenCopyWith<$Res> {
  __$PleromaApiAccessApplicationTokenCopyWithImpl(
      _PleromaApiAccessApplicationToken _value,
      $Res Function(_PleromaApiAccessApplicationToken) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessApplicationToken));

  @override
  _PleromaApiAccessApplicationToken get _value =>
      super._value as _PleromaApiAccessApplicationToken;

  @override
  $Res call({
    Object? scopes = freezed,
    Object? clientApplication = freezed,
    Object? oauthToken = freezed,
  }) {
    return _then(_PleromaApiAccessApplicationToken(
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as PleromaApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessApplicationToken
    extends _PleromaApiAccessApplicationToken {
  const _$_PleromaApiAccessApplicationToken(
      {@HiveField(1) required this.scopes,
      @HiveField(2) required this.clientApplication,
      @HiveField(3) @JsonKey(name: 'oauth_token') required this.oauthToken})
      : super._();

  factory _$_PleromaApiAccessApplicationToken.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccessApplicationTokenFromJson(json);

  @override
  @HiveField(1)
  final PleromaApiAccessScopes scopes;
  @override
  @HiveField(2)
  final PleromaApiClientApplication clientApplication;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final PleromaApiOAuthToken oauthToken;

  @override
  String toString() {
    return 'PleromaApiAccessApplicationToken(scopes: $scopes, clientApplication: $clientApplication, oauthToken: $oauthToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccessApplicationToken &&
            (identical(other.scopes, scopes) ||
                const DeepCollectionEquality().equals(other.scopes, scopes)) &&
            (identical(other.clientApplication, clientApplication) ||
                const DeepCollectionEquality()
                    .equals(other.clientApplication, clientApplication)) &&
            (identical(other.oauthToken, oauthToken) ||
                const DeepCollectionEquality()
                    .equals(other.oauthToken, oauthToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scopes) ^
      const DeepCollectionEquality().hash(clientApplication) ^
      const DeepCollectionEquality().hash(oauthToken);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccessApplicationTokenCopyWith<_PleromaApiAccessApplicationToken>
      get copyWith => __$PleromaApiAccessApplicationTokenCopyWithImpl<
          _PleromaApiAccessApplicationToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessApplicationTokenToJson(this);
  }
}

abstract class _PleromaApiAccessApplicationToken
    extends PleromaApiAccessApplicationToken {
  const factory _PleromaApiAccessApplicationToken(
          {@HiveField(1)
              required PleromaApiAccessScopes scopes,
          @HiveField(2)
              required PleromaApiClientApplication clientApplication,
          @HiveField(3)
          @JsonKey(name: 'oauth_token')
              required PleromaApiOAuthToken oauthToken}) =
      _$_PleromaApiAccessApplicationToken;
  const _PleromaApiAccessApplicationToken._() : super._();

  factory _PleromaApiAccessApplicationToken.fromJson(
      Map<String, dynamic> json) = _$_PleromaApiAccessApplicationToken.fromJson;

  @override
  @HiveField(1)
  PleromaApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  PleromaApiClientApplication get clientApplication =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  PleromaApiOAuthToken get oauthToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessApplicationTokenCopyWith<_PleromaApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}

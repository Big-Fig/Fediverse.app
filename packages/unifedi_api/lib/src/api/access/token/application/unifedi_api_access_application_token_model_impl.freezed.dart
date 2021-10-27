// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_application_token_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessApplicationToken _$UnifediApiAccessApplicationTokenFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessApplicationToken.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenTearOff {
  const _$UnifediApiAccessApplicationTokenTearOff();

  _UnifediApiAccessApplicationToken call(
      {@HiveField(1)
          required UnifediApiAccessScopes scopes,
      @JsonKey(name: 'client_application')
      @HiveField(2)
          required UnifediApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          required UnifediApiOAuthToken oauthToken}) {
    return _UnifediApiAccessApplicationToken(
      scopes: scopes,
      clientApplication: clientApplication,
      oauthToken: oauthToken,
    );
  }

  UnifediApiAccessApplicationToken fromJson(Map<String, Object?> json) {
    return UnifediApiAccessApplicationToken.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessApplicationToken =
    _$UnifediApiAccessApplicationTokenTearOff();

/// @nodoc
mixin _$UnifediApiAccessApplicationToken {
  @HiveField(1)
  UnifediApiAccessScopes get scopes => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_application')
  @HiveField(2)
  UnifediApiClientApplication get clientApplication =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessApplicationTokenCopyWith<UnifediApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessApplicationTokenCopyWith<$Res> {
  factory $UnifediApiAccessApplicationTokenCopyWith(
          UnifediApiAccessApplicationToken value,
          $Res Function(UnifediApiAccessApplicationToken) then) =
      _$UnifediApiAccessApplicationTokenCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
          UnifediApiAccessScopes scopes,
      @JsonKey(name: 'client_application')
      @HiveField(2)
          UnifediApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken});

  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
  $UnifediApiClientApplicationCopyWith<$Res> get clientApplication;
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenCopyWithImpl<$Res>
    implements $UnifediApiAccessApplicationTokenCopyWith<$Res> {
  _$UnifediApiAccessApplicationTokenCopyWithImpl(this._value, this._then);

  final UnifediApiAccessApplicationToken _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessApplicationToken) _then;

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
              as UnifediApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as UnifediApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiOAuthToken,
    ));
  }

  @override
  $UnifediApiAccessScopesCopyWith<$Res> get scopes {
    return $UnifediApiAccessScopesCopyWith<$Res>(_value.scopes, (value) {
      return _then(_value.copyWith(scopes: value));
    });
  }

  @override
  $UnifediApiClientApplicationCopyWith<$Res> get clientApplication {
    return $UnifediApiClientApplicationCopyWith<$Res>(_value.clientApplication,
        (value) {
      return _then(_value.copyWith(clientApplication: value));
    });
  }

  @override
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken {
    return $UnifediApiOAuthTokenCopyWith<$Res>(_value.oauthToken, (value) {
      return _then(_value.copyWith(oauthToken: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessApplicationTokenCopyWith<$Res>
    implements $UnifediApiAccessApplicationTokenCopyWith<$Res> {
  factory _$UnifediApiAccessApplicationTokenCopyWith(
          _UnifediApiAccessApplicationToken value,
          $Res Function(_UnifediApiAccessApplicationToken) then) =
      __$UnifediApiAccessApplicationTokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          UnifediApiAccessScopes scopes,
      @JsonKey(name: 'client_application')
      @HiveField(2)
          UnifediApiClientApplication clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          UnifediApiOAuthToken oauthToken});

  @override
  $UnifediApiAccessScopesCopyWith<$Res> get scopes;
  @override
  $UnifediApiClientApplicationCopyWith<$Res> get clientApplication;
  @override
  $UnifediApiOAuthTokenCopyWith<$Res> get oauthToken;
}

/// @nodoc
class __$UnifediApiAccessApplicationTokenCopyWithImpl<$Res>
    extends _$UnifediApiAccessApplicationTokenCopyWithImpl<$Res>
    implements _$UnifediApiAccessApplicationTokenCopyWith<$Res> {
  __$UnifediApiAccessApplicationTokenCopyWithImpl(
      _UnifediApiAccessApplicationToken _value,
      $Res Function(_UnifediApiAccessApplicationToken) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessApplicationToken));

  @override
  _UnifediApiAccessApplicationToken get _value =>
      super._value as _UnifediApiAccessApplicationToken;

  @override
  $Res call({
    Object? scopes = freezed,
    Object? clientApplication = freezed,
    Object? oauthToken = freezed,
  }) {
    return _then(_UnifediApiAccessApplicationToken(
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessScopes,
      clientApplication: clientApplication == freezed
          ? _value.clientApplication
          : clientApplication // ignore: cast_nullable_to_non_nullable
              as UnifediApiClientApplication,
      oauthToken: oauthToken == freezed
          ? _value.oauthToken
          : oauthToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiOAuthToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessApplicationToken
    extends _UnifediApiAccessApplicationToken {
  const _$_UnifediApiAccessApplicationToken(
      {@HiveField(1)
          required this.scopes,
      @JsonKey(name: 'client_application')
      @HiveField(2)
          required this.clientApplication,
      @HiveField(3)
      @JsonKey(name: 'oauth_token')
          required this.oauthToken})
      : super._();

  factory _$_UnifediApiAccessApplicationToken.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessApplicationTokenFromJson(json);

  @override
  @HiveField(1)
  final UnifediApiAccessScopes scopes;
  @override
  @JsonKey(name: 'client_application')
  @HiveField(2)
  final UnifediApiClientApplication clientApplication;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  final UnifediApiOAuthToken oauthToken;

  @override
  String toString() {
    return 'UnifediApiAccessApplicationToken(scopes: $scopes, clientApplication: $clientApplication, oauthToken: $oauthToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessApplicationToken &&
            (identical(other.scopes, scopes) || other.scopes == scopes) &&
            (identical(other.clientApplication, clientApplication) ||
                other.clientApplication == clientApplication) &&
            (identical(other.oauthToken, oauthToken) ||
                other.oauthToken == oauthToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scopes, clientApplication, oauthToken);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessApplicationTokenCopyWith<_UnifediApiAccessApplicationToken>
      get copyWith => __$UnifediApiAccessApplicationTokenCopyWithImpl<
          _UnifediApiAccessApplicationToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessApplicationTokenToJson(this);
  }
}

abstract class _UnifediApiAccessApplicationToken
    extends UnifediApiAccessApplicationToken {
  const factory _UnifediApiAccessApplicationToken(
          {@HiveField(1)
              required UnifediApiAccessScopes scopes,
          @JsonKey(name: 'client_application')
          @HiveField(2)
              required UnifediApiClientApplication clientApplication,
          @HiveField(3)
          @JsonKey(name: 'oauth_token')
              required UnifediApiOAuthToken oauthToken}) =
      _$_UnifediApiAccessApplicationToken;
  const _UnifediApiAccessApplicationToken._() : super._();

  factory _UnifediApiAccessApplicationToken.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiAccessApplicationToken.fromJson;

  @override
  @HiveField(1)
  UnifediApiAccessScopes get scopes;
  @override
  @JsonKey(name: 'client_application')
  @HiveField(2)
  UnifediApiClientApplication get clientApplication;
  @override
  @HiveField(3)
  @JsonKey(name: 'oauth_token')
  UnifediApiOAuthToken get oauthToken;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessApplicationTokenCopyWith<_UnifediApiAccessApplicationToken>
      get copyWith => throw _privateConstructorUsedError;
}

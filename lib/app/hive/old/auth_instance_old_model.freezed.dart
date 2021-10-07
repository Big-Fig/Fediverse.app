// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_instance_old_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthInstanceOld _$AuthInstanceOldFromJson(Map<String, dynamic> json) {
  return _AuthInstanceOld.fromJson(json);
}

/// @nodoc
class _$AuthInstanceOldTearOff {
  const _$AuthInstanceOldTearOff();

  _AuthInstanceOld call(
      {@HiveField(0)
      @JsonKey(name: 'url_schema')
          required String? urlSchema,
      @HiveField(1)
      @JsonKey(name: 'url_host')
          required String urlHost,
      @HiveField(2)
          required String acct,
      @HiveField(3)
          required PleromaApiOAuthToken? token,
      @HiveField(4)
      @JsonKey(name: 'auth_code')
          required String? authCode,
      @HiveField(5)
      @JsonKey(name: 'is_pleroma_instance')
          required bool isPleroma,
      @HiveField(6)
          required PleromaApiClientApplication? application,
      @HiveField(7)
          required PleromaApiInstance? info}) {
    return _AuthInstanceOld(
      urlSchema: urlSchema,
      urlHost: urlHost,
      acct: acct,
      token: token,
      authCode: authCode,
      isPleroma: isPleroma,
      application: application,
      info: info,
    );
  }

  AuthInstanceOld fromJson(Map<String, Object> json) {
    return AuthInstanceOld.fromJson(json);
  }
}

/// @nodoc
const $AuthInstanceOld = _$AuthInstanceOldTearOff();

/// @nodoc
mixin _$AuthInstanceOld {
  @HiveField(0)
  @JsonKey(name: 'url_schema')
  String? get urlSchema => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'url_host')
  String get urlHost => throw _privateConstructorUsedError;
  @HiveField(2)
  String get acct => throw _privateConstructorUsedError;
  @HiveField(3)
  PleromaApiOAuthToken? get token => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'auth_code')
  String? get authCode => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'is_pleroma_instance')
  bool get isPleroma => throw _privateConstructorUsedError;
  @HiveField(6)
  PleromaApiClientApplication? get application =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  PleromaApiInstance? get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthInstanceOldCopyWith<AuthInstanceOld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInstanceOldCopyWith<$Res> {
  factory $AuthInstanceOldCopyWith(
          AuthInstanceOld value, $Res Function(AuthInstanceOld) then) =
      _$AuthInstanceOldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'url_schema') String? urlSchema,
      @HiveField(1) @JsonKey(name: 'url_host') String urlHost,
      @HiveField(2) String acct,
      @HiveField(3) PleromaApiOAuthToken? token,
      @HiveField(4) @JsonKey(name: 'auth_code') String? authCode,
      @HiveField(5) @JsonKey(name: 'is_pleroma_instance') bool isPleroma,
      @HiveField(6) PleromaApiClientApplication? application,
      @HiveField(7) PleromaApiInstance? info});

  $PleromaApiOAuthTokenCopyWith<$Res>? get token;
  $PleromaApiClientApplicationCopyWith<$Res>? get application;
  $PleromaApiInstanceCopyWith<$Res>? get info;
}

/// @nodoc
class _$AuthInstanceOldCopyWithImpl<$Res>
    implements $AuthInstanceOldCopyWith<$Res> {
  _$AuthInstanceOldCopyWithImpl(this._value, this._then);

  final AuthInstanceOld _value;
  // ignore: unused_field
  final $Res Function(AuthInstanceOld) _then;

  @override
  $Res call({
    Object? urlSchema = freezed,
    Object? urlHost = freezed,
    Object? acct = freezed,
    Object? token = freezed,
    Object? authCode = freezed,
    Object? isPleroma = freezed,
    Object? application = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      urlSchema: urlSchema == freezed
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String?,
      urlHost: urlHost == freezed
          ? _value.urlHost
          : urlHost // ignore: cast_nullable_to_non_nullable
              as String,
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken?,
      authCode: authCode == freezed
          ? _value.authCode
          : authCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPleroma: isPleroma == freezed
          ? _value.isPleroma
          : isPleroma // ignore: cast_nullable_to_non_nullable
              as bool,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as PleromaApiClientApplication?,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance?,
    ));
  }

  @override
  $PleromaApiOAuthTokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $PleromaApiOAuthTokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value));
    });
  }

  @override
  $PleromaApiClientApplicationCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $PleromaApiClientApplicationCopyWith<$Res>(_value.application!,
        (value) {
      return _then(_value.copyWith(application: value));
    });
  }

  @override
  $PleromaApiInstanceCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $PleromaApiInstanceCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc
abstract class _$AuthInstanceOldCopyWith<$Res>
    implements $AuthInstanceOldCopyWith<$Res> {
  factory _$AuthInstanceOldCopyWith(
          _AuthInstanceOld value, $Res Function(_AuthInstanceOld) then) =
      __$AuthInstanceOldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'url_schema') String? urlSchema,
      @HiveField(1) @JsonKey(name: 'url_host') String urlHost,
      @HiveField(2) String acct,
      @HiveField(3) PleromaApiOAuthToken? token,
      @HiveField(4) @JsonKey(name: 'auth_code') String? authCode,
      @HiveField(5) @JsonKey(name: 'is_pleroma_instance') bool isPleroma,
      @HiveField(6) PleromaApiClientApplication? application,
      @HiveField(7) PleromaApiInstance? info});

  @override
  $PleromaApiOAuthTokenCopyWith<$Res>? get token;
  @override
  $PleromaApiClientApplicationCopyWith<$Res>? get application;
  @override
  $PleromaApiInstanceCopyWith<$Res>? get info;
}

/// @nodoc
class __$AuthInstanceOldCopyWithImpl<$Res>
    extends _$AuthInstanceOldCopyWithImpl<$Res>
    implements _$AuthInstanceOldCopyWith<$Res> {
  __$AuthInstanceOldCopyWithImpl(
      _AuthInstanceOld _value, $Res Function(_AuthInstanceOld) _then)
      : super(_value, (v) => _then(v as _AuthInstanceOld));

  @override
  _AuthInstanceOld get _value => super._value as _AuthInstanceOld;

  @override
  $Res call({
    Object? urlSchema = freezed,
    Object? urlHost = freezed,
    Object? acct = freezed,
    Object? token = freezed,
    Object? authCode = freezed,
    Object? isPleroma = freezed,
    Object? application = freezed,
    Object? info = freezed,
  }) {
    return _then(_AuthInstanceOld(
      urlSchema: urlSchema == freezed
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String?,
      urlHost: urlHost == freezed
          ? _value.urlHost
          : urlHost // ignore: cast_nullable_to_non_nullable
              as String,
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken?,
      authCode: authCode == freezed
          ? _value.authCode
          : authCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPleroma: isPleroma == freezed
          ? _value.isPleroma
          : isPleroma // ignore: cast_nullable_to_non_nullable
              as bool,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as PleromaApiClientApplication?,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthInstanceOld extends _AuthInstanceOld {
  const _$_AuthInstanceOld(
      {@HiveField(0)
      @JsonKey(name: 'url_schema')
          required this.urlSchema,
      @HiveField(1)
      @JsonKey(name: 'url_host')
          required this.urlHost,
      @HiveField(2)
          required this.acct,
      @HiveField(3)
          required this.token,
      @HiveField(4)
      @JsonKey(name: 'auth_code')
          required this.authCode,
      @HiveField(5)
      @JsonKey(name: 'is_pleroma_instance')
          required this.isPleroma,
      @HiveField(6)
          required this.application,
      @HiveField(7)
          required this.info})
      : super._();

  factory _$_AuthInstanceOld.fromJson(Map<String, dynamic> json) =>
      _$$_AuthInstanceOldFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'url_schema')
  final String? urlSchema;
  @override
  @HiveField(1)
  @JsonKey(name: 'url_host')
  final String urlHost;
  @override
  @HiveField(2)
  final String acct;
  @override
  @HiveField(3)
  final PleromaApiOAuthToken? token;
  @override
  @HiveField(4)
  @JsonKey(name: 'auth_code')
  final String? authCode;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_pleroma_instance')
  final bool isPleroma;
  @override
  @HiveField(6)
  final PleromaApiClientApplication? application;
  @override
  @HiveField(7)
  final PleromaApiInstance? info;

  @override
  String toString() {
    return 'AuthInstanceOld(urlSchema: $urlSchema, urlHost: $urlHost, acct: $acct, token: $token, authCode: $authCode, isPleroma: $isPleroma, application: $application, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthInstanceOld &&
            (identical(other.urlSchema, urlSchema) ||
                const DeepCollectionEquality()
                    .equals(other.urlSchema, urlSchema)) &&
            (identical(other.urlHost, urlHost) ||
                const DeepCollectionEquality()
                    .equals(other.urlHost, urlHost)) &&
            (identical(other.acct, acct) ||
                const DeepCollectionEquality().equals(other.acct, acct)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.authCode, authCode) ||
                const DeepCollectionEquality()
                    .equals(other.authCode, authCode)) &&
            (identical(other.isPleroma, isPleroma) ||
                const DeepCollectionEquality()
                    .equals(other.isPleroma, isPleroma)) &&
            (identical(other.application, application) ||
                const DeepCollectionEquality()
                    .equals(other.application, application)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(urlSchema) ^
      const DeepCollectionEquality().hash(urlHost) ^
      const DeepCollectionEquality().hash(acct) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(authCode) ^
      const DeepCollectionEquality().hash(isPleroma) ^
      const DeepCollectionEquality().hash(application) ^
      const DeepCollectionEquality().hash(info);

  @JsonKey(ignore: true)
  @override
  _$AuthInstanceOldCopyWith<_AuthInstanceOld> get copyWith =>
      __$AuthInstanceOldCopyWithImpl<_AuthInstanceOld>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthInstanceOldToJson(this);
  }
}

abstract class _AuthInstanceOld extends AuthInstanceOld {
  const factory _AuthInstanceOld(
      {@HiveField(0)
      @JsonKey(name: 'url_schema')
          required String? urlSchema,
      @HiveField(1)
      @JsonKey(name: 'url_host')
          required String urlHost,
      @HiveField(2)
          required String acct,
      @HiveField(3)
          required PleromaApiOAuthToken? token,
      @HiveField(4)
      @JsonKey(name: 'auth_code')
          required String? authCode,
      @HiveField(5)
      @JsonKey(name: 'is_pleroma_instance')
          required bool isPleroma,
      @HiveField(6)
          required PleromaApiClientApplication? application,
      @HiveField(7)
          required PleromaApiInstance? info}) = _$_AuthInstanceOld;
  const _AuthInstanceOld._() : super._();

  factory _AuthInstanceOld.fromJson(Map<String, dynamic> json) =
      _$_AuthInstanceOld.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'url_schema')
  String? get urlSchema => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'url_host')
  String get urlHost => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get acct => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  PleromaApiOAuthToken? get token => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'auth_code')
  String? get authCode => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_pleroma_instance')
  bool get isPleroma => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  PleromaApiClientApplication? get application =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  PleromaApiInstance? get info => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthInstanceOldCopyWith<_AuthInstanceOld> get copyWith =>
      throw _privateConstructorUsedError;
}

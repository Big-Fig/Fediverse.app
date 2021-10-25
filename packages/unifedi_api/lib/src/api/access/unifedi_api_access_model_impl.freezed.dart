// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccess _$UnifediApiAccessFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccess.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessTearOff {
  const _$UnifediApiAccessTearOff();

  _UnifediApiAccess call(
      {@HiveField(0)
          required String url,
      @HiveField(1)
          required UnifediApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          required UnifediApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          required UnifediApiAccessUserToken? userAccessToken}) {
    return _UnifediApiAccess(
      url: url,
      instance: instance,
      applicationAccessToken: applicationAccessToken,
      userAccessToken: userAccessToken,
    );
  }

  UnifediApiAccess fromJson(Map<String, Object> json) {
    return UnifediApiAccess.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccess = _$UnifediApiAccessTearOff();

/// @nodoc
mixin _$UnifediApiAccess {
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiInstance? get instance => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  UnifediApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  UnifediApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessCopyWith<UnifediApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessCopyWith<$Res> {
  factory $UnifediApiAccessCopyWith(
          UnifediApiAccess value, $Res Function(UnifediApiAccess) then) =
      _$UnifediApiAccessCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          UnifediApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          UnifediApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          UnifediApiAccessUserToken? userAccessToken});

  $UnifediApiInstanceCopyWith<$Res>? get instance;
  $UnifediApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  $UnifediApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class _$UnifediApiAccessCopyWithImpl<$Res>
    implements $UnifediApiAccessCopyWith<$Res> {
  _$UnifediApiAccessCopyWithImpl(this._value, this._then);

  final UnifediApiAccess _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccess) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? instance = freezed,
    Object? applicationAccessToken = freezed,
    Object? userAccessToken = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessUserToken?,
    ));
  }

  @override
  $UnifediApiInstanceCopyWith<$Res>? get instance {
    if (_value.instance == null) {
      return null;
    }

    return $UnifediApiInstanceCopyWith<$Res>(_value.instance!, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $UnifediApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken {
    if (_value.applicationAccessToken == null) {
      return null;
    }

    return $UnifediApiAccessApplicationTokenCopyWith<$Res>(
        _value.applicationAccessToken!, (value) {
      return _then(_value.copyWith(applicationAccessToken: value));
    });
  }

  @override
  $UnifediApiAccessUserTokenCopyWith<$Res>? get userAccessToken {
    if (_value.userAccessToken == null) {
      return null;
    }

    return $UnifediApiAccessUserTokenCopyWith<$Res>(_value.userAccessToken!,
        (value) {
      return _then(_value.copyWith(userAccessToken: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessCopyWith<$Res>
    implements $UnifediApiAccessCopyWith<$Res> {
  factory _$UnifediApiAccessCopyWith(
          _UnifediApiAccess value, $Res Function(_UnifediApiAccess) then) =
      __$UnifediApiAccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          UnifediApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          UnifediApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          UnifediApiAccessUserToken? userAccessToken});

  @override
  $UnifediApiInstanceCopyWith<$Res>? get instance;
  @override
  $UnifediApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  @override
  $UnifediApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class __$UnifediApiAccessCopyWithImpl<$Res>
    extends _$UnifediApiAccessCopyWithImpl<$Res>
    implements _$UnifediApiAccessCopyWith<$Res> {
  __$UnifediApiAccessCopyWithImpl(
      _UnifediApiAccess _value, $Res Function(_UnifediApiAccess) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccess));

  @override
  _UnifediApiAccess get _value => super._value as _UnifediApiAccess;

  @override
  $Res call({
    Object? url = freezed,
    Object? instance = freezed,
    Object? applicationAccessToken = freezed,
    Object? userAccessToken = freezed,
  }) {
    return _then(_UnifediApiAccess(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccessUserToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccess extends _UnifediApiAccess {
  const _$_UnifediApiAccess(
      {@HiveField(0)
          required this.url,
      @HiveField(1)
          required this.instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          required this.applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          required this.userAccessToken})
      : super._();

  factory _$_UnifediApiAccess.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessFromJson(json);

  @override
  @HiveField(0)
  final String url;
  @override
  @HiveField(1)
  final UnifediApiInstance? instance;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  final UnifediApiAccessApplicationToken? applicationAccessToken;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  final UnifediApiAccessUserToken? userAccessToken;

  @override
  String toString() {
    return 'UnifediApiAccess(url: $url, instance: $instance, applicationAccessToken: $applicationAccessToken, userAccessToken: $userAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccess &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.instance, instance) ||
                const DeepCollectionEquality()
                    .equals(other.instance, instance)) &&
            (identical(other.applicationAccessToken, applicationAccessToken) ||
                const DeepCollectionEquality().equals(
                    other.applicationAccessToken, applicationAccessToken)) &&
            (identical(other.userAccessToken, userAccessToken) ||
                const DeepCollectionEquality()
                    .equals(other.userAccessToken, userAccessToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(instance) ^
      const DeepCollectionEquality().hash(applicationAccessToken) ^
      const DeepCollectionEquality().hash(userAccessToken);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessCopyWith<_UnifediApiAccess> get copyWith =>
      __$UnifediApiAccessCopyWithImpl<_UnifediApiAccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessToJson(this);
  }
}

abstract class _UnifediApiAccess extends UnifediApiAccess {
  const factory _UnifediApiAccess(
          {@HiveField(0)
              required String url,
          @HiveField(1)
              required UnifediApiInstance? instance,
          @HiveField(4)
          @JsonKey(name: 'application_access_token')
              required UnifediApiAccessApplicationToken? applicationAccessToken,
          @HiveField(5)
          @JsonKey(name: 'user_access_token')
              required UnifediApiAccessUserToken? userAccessToken}) =
      _$_UnifediApiAccess;
  const _UnifediApiAccess._() : super._();

  factory _UnifediApiAccess.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccess.fromJson;

  @override
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  UnifediApiInstance? get instance => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  UnifediApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  UnifediApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessCopyWith<_UnifediApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

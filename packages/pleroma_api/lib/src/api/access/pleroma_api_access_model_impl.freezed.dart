// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccess _$PleromaApiAccessFromJson(Map<String, dynamic> json) {
  return _PleromaApiAccess.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessTearOff {
  const _$PleromaApiAccessTearOff();

  _PleromaApiAccess call(
      {@HiveField(0)
          required String url,
      @HiveField(1)
          required PleromaApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          required PleromaApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          required PleromaApiAccessUserToken? userAccessToken}) {
    return _PleromaApiAccess(
      url: url,
      instance: instance,
      applicationAccessToken: applicationAccessToken,
      userAccessToken: userAccessToken,
    );
  }

  PleromaApiAccess fromJson(Map<String, Object> json) {
    return PleromaApiAccess.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccess = _$PleromaApiAccessTearOff();

/// @nodoc
mixin _$PleromaApiAccess {
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiInstance? get instance => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  PleromaApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  PleromaApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessCopyWith<PleromaApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessCopyWith<$Res> {
  factory $PleromaApiAccessCopyWith(
          PleromaApiAccess value, $Res Function(PleromaApiAccess) then) =
      _$PleromaApiAccessCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          PleromaApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          PleromaApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          PleromaApiAccessUserToken? userAccessToken});

  $PleromaApiInstanceCopyWith<$Res>? get instance;
  $PleromaApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  $PleromaApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class _$PleromaApiAccessCopyWithImpl<$Res>
    implements $PleromaApiAccessCopyWith<$Res> {
  _$PleromaApiAccessCopyWithImpl(this._value, this._then);

  final PleromaApiAccess _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccess) _then;

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
              as PleromaApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessUserToken?,
    ));
  }

  @override
  $PleromaApiInstanceCopyWith<$Res>? get instance {
    if (_value.instance == null) {
      return null;
    }

    return $PleromaApiInstanceCopyWith<$Res>(_value.instance!, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $PleromaApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken {
    if (_value.applicationAccessToken == null) {
      return null;
    }

    return $PleromaApiAccessApplicationTokenCopyWith<$Res>(
        _value.applicationAccessToken!, (value) {
      return _then(_value.copyWith(applicationAccessToken: value));
    });
  }

  @override
  $PleromaApiAccessUserTokenCopyWith<$Res>? get userAccessToken {
    if (_value.userAccessToken == null) {
      return null;
    }

    return $PleromaApiAccessUserTokenCopyWith<$Res>(_value.userAccessToken!,
        (value) {
      return _then(_value.copyWith(userAccessToken: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccessCopyWith<$Res>
    implements $PleromaApiAccessCopyWith<$Res> {
  factory _$PleromaApiAccessCopyWith(
          _PleromaApiAccess value, $Res Function(_PleromaApiAccess) then) =
      __$PleromaApiAccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          PleromaApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          PleromaApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          PleromaApiAccessUserToken? userAccessToken});

  @override
  $PleromaApiInstanceCopyWith<$Res>? get instance;
  @override
  $PleromaApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  @override
  $PleromaApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class __$PleromaApiAccessCopyWithImpl<$Res>
    extends _$PleromaApiAccessCopyWithImpl<$Res>
    implements _$PleromaApiAccessCopyWith<$Res> {
  __$PleromaApiAccessCopyWithImpl(
      _PleromaApiAccess _value, $Res Function(_PleromaApiAccess) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccess));

  @override
  _PleromaApiAccess get _value => super._value as _PleromaApiAccess;

  @override
  $Res call({
    Object? url = freezed,
    Object? instance = freezed,
    Object? applicationAccessToken = freezed,
    Object? userAccessToken = freezed,
  }) {
    return _then(_PleromaApiAccess(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessUserToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccess extends _PleromaApiAccess {
  const _$_PleromaApiAccess(
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

  factory _$_PleromaApiAccess.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessFromJson(json);

  @override
  @HiveField(0)
  final String url;
  @override
  @HiveField(1)
  final PleromaApiInstance? instance;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  final PleromaApiAccessApplicationToken? applicationAccessToken;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  final PleromaApiAccessUserToken? userAccessToken;

  @override
  String toString() {
    return 'PleromaApiAccess(url: $url, instance: $instance, applicationAccessToken: $applicationAccessToken, userAccessToken: $userAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccess &&
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
  _$PleromaApiAccessCopyWith<_PleromaApiAccess> get copyWith =>
      __$PleromaApiAccessCopyWithImpl<_PleromaApiAccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessToJson(this);
  }
}

abstract class _PleromaApiAccess extends PleromaApiAccess {
  const factory _PleromaApiAccess(
          {@HiveField(0)
              required String url,
          @HiveField(1)
              required PleromaApiInstance? instance,
          @HiveField(4)
          @JsonKey(name: 'application_access_token')
              required PleromaApiAccessApplicationToken? applicationAccessToken,
          @HiveField(5)
          @JsonKey(name: 'user_access_token')
              required PleromaApiAccessUserToken? userAccessToken}) =
      _$_PleromaApiAccess;
  const _PleromaApiAccess._() : super._();

  factory _PleromaApiAccess.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccess.fromJson;

  @override
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  PleromaApiInstance? get instance => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  PleromaApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  PleromaApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessCopyWith<_PleromaApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

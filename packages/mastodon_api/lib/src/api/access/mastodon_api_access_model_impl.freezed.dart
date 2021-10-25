// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccess _$MastodonApiAccessFromJson(Map<String, dynamic> json) {
  return _MastodonApiAccess.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessTearOff {
  const _$MastodonApiAccessTearOff();

  _MastodonApiAccess call(
      {@HiveField(0)
          required String url,
      @HiveField(1)
          required MastodonApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          required MastodonApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          required MastodonApiAccessUserToken? userAccessToken}) {
    return _MastodonApiAccess(
      url: url,
      instance: instance,
      applicationAccessToken: applicationAccessToken,
      userAccessToken: userAccessToken,
    );
  }

  MastodonApiAccess fromJson(Map<String, Object> json) {
    return MastodonApiAccess.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccess = _$MastodonApiAccessTearOff();

/// @nodoc
mixin _$MastodonApiAccess {
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiInstance? get instance => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  MastodonApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  MastodonApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessCopyWith<MastodonApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessCopyWith<$Res> {
  factory $MastodonApiAccessCopyWith(
          MastodonApiAccess value, $Res Function(MastodonApiAccess) then) =
      _$MastodonApiAccessCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          MastodonApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          MastodonApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          MastodonApiAccessUserToken? userAccessToken});

  $MastodonApiInstanceCopyWith<$Res>? get instance;
  $MastodonApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  $MastodonApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class _$MastodonApiAccessCopyWithImpl<$Res>
    implements $MastodonApiAccessCopyWith<$Res> {
  _$MastodonApiAccessCopyWithImpl(this._value, this._then);

  final MastodonApiAccess _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccess) _then;

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
              as MastodonApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessUserToken?,
    ));
  }

  @override
  $MastodonApiInstanceCopyWith<$Res>? get instance {
    if (_value.instance == null) {
      return null;
    }

    return $MastodonApiInstanceCopyWith<$Res>(_value.instance!, (value) {
      return _then(_value.copyWith(instance: value));
    });
  }

  @override
  $MastodonApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken {
    if (_value.applicationAccessToken == null) {
      return null;
    }

    return $MastodonApiAccessApplicationTokenCopyWith<$Res>(
        _value.applicationAccessToken!, (value) {
      return _then(_value.copyWith(applicationAccessToken: value));
    });
  }

  @override
  $MastodonApiAccessUserTokenCopyWith<$Res>? get userAccessToken {
    if (_value.userAccessToken == null) {
      return null;
    }

    return $MastodonApiAccessUserTokenCopyWith<$Res>(_value.userAccessToken!,
        (value) {
      return _then(_value.copyWith(userAccessToken: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiAccessCopyWith<$Res>
    implements $MastodonApiAccessCopyWith<$Res> {
  factory _$MastodonApiAccessCopyWith(
          _MastodonApiAccess value, $Res Function(_MastodonApiAccess) then) =
      __$MastodonApiAccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String url,
      @HiveField(1)
          MastodonApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          MastodonApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          MastodonApiAccessUserToken? userAccessToken});

  @override
  $MastodonApiInstanceCopyWith<$Res>? get instance;
  @override
  $MastodonApiAccessApplicationTokenCopyWith<$Res>? get applicationAccessToken;
  @override
  $MastodonApiAccessUserTokenCopyWith<$Res>? get userAccessToken;
}

/// @nodoc
class __$MastodonApiAccessCopyWithImpl<$Res>
    extends _$MastodonApiAccessCopyWithImpl<$Res>
    implements _$MastodonApiAccessCopyWith<$Res> {
  __$MastodonApiAccessCopyWithImpl(
      _MastodonApiAccess _value, $Res Function(_MastodonApiAccess) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccess));

  @override
  _MastodonApiAccess get _value => super._value as _MastodonApiAccess;

  @override
  $Res call({
    Object? url = freezed,
    Object? instance = freezed,
    Object? applicationAccessToken = freezed,
    Object? userAccessToken = freezed,
  }) {
    return _then(_MastodonApiAccess(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      instance: instance == freezed
          ? _value.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstance?,
      applicationAccessToken: applicationAccessToken == freezed
          ? _value.applicationAccessToken
          : applicationAccessToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessApplicationToken?,
      userAccessToken: userAccessToken == freezed
          ? _value.userAccessToken
          : userAccessToken // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessUserToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccess extends _MastodonApiAccess {
  const _$_MastodonApiAccess(
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

  factory _$_MastodonApiAccess.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessFromJson(json);

  @override
  @HiveField(0)
  final String url;
  @override
  @HiveField(1)
  final MastodonApiInstance? instance;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  final MastodonApiAccessApplicationToken? applicationAccessToken;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  final MastodonApiAccessUserToken? userAccessToken;

  @override
  String toString() {
    return 'MastodonApiAccess(url: $url, instance: $instance, applicationAccessToken: $applicationAccessToken, userAccessToken: $userAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccess &&
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
  _$MastodonApiAccessCopyWith<_MastodonApiAccess> get copyWith =>
      __$MastodonApiAccessCopyWithImpl<_MastodonApiAccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessToJson(this);
  }
}

abstract class _MastodonApiAccess extends MastodonApiAccess {
  const factory _MastodonApiAccess(
      {@HiveField(0)
          required String url,
      @HiveField(1)
          required MastodonApiInstance? instance,
      @HiveField(4)
      @JsonKey(name: 'application_access_token')
          required MastodonApiAccessApplicationToken? applicationAccessToken,
      @HiveField(5)
      @JsonKey(name: 'user_access_token')
          required MastodonApiAccessUserToken?
              userAccessToken}) = _$_MastodonApiAccess;
  const _MastodonApiAccess._() : super._();

  factory _MastodonApiAccess.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccess.fromJson;

  @override
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  MastodonApiInstance? get instance => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'application_access_token')
  MastodonApiAccessApplicationToken? get applicationAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'user_access_token')
  MastodonApiAccessUserToken? get userAccessToken =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessCopyWith<_MastodonApiAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

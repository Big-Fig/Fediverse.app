// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_push_subscription_keys_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPushSubscriptionKeys _$PleromaApiPushSubscriptionKeysFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPushSubscriptionKeys.fromJson(json);
}

/// @nodoc
class _$PleromaApiPushSubscriptionKeysTearOff {
  const _$PleromaApiPushSubscriptionKeysTearOff();

  _PleromaApiPushSubscriptionKeys call(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) {
    return _PleromaApiPushSubscriptionKeys(
      p256dh: p256dh,
      auth: auth,
    );
  }

  PleromaApiPushSubscriptionKeys fromJson(Map<String, Object?> json) {
    return PleromaApiPushSubscriptionKeys.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPushSubscriptionKeys =
    _$PleromaApiPushSubscriptionKeysTearOff();

/// @nodoc
mixin _$PleromaApiPushSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  String get p256dh => throw _privateConstructorUsedError;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  String get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPushSubscriptionKeysCopyWith<PleromaApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPushSubscriptionKeysCopyWith<$Res> {
  factory $PleromaApiPushSubscriptionKeysCopyWith(
          PleromaApiPushSubscriptionKeys value,
          $Res Function(PleromaApiPushSubscriptionKeys) then) =
      _$PleromaApiPushSubscriptionKeysCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class _$PleromaApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements $PleromaApiPushSubscriptionKeysCopyWith<$Res> {
  _$PleromaApiPushSubscriptionKeysCopyWithImpl(this._value, this._then);

  final PleromaApiPushSubscriptionKeys _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPushSubscriptionKeys) _then;

  @override
  $Res call({
    Object? p256dh = freezed,
    Object? auth = freezed,
  }) {
    return _then(_value.copyWith(
      p256dh: p256dh == freezed
          ? _value.p256dh
          : p256dh // ignore: cast_nullable_to_non_nullable
              as String,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiPushSubscriptionKeysCopyWith<$Res>
    implements $PleromaApiPushSubscriptionKeysCopyWith<$Res> {
  factory _$PleromaApiPushSubscriptionKeysCopyWith(
          _PleromaApiPushSubscriptionKeys value,
          $Res Function(_PleromaApiPushSubscriptionKeys) then) =
      __$PleromaApiPushSubscriptionKeysCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class __$PleromaApiPushSubscriptionKeysCopyWithImpl<$Res>
    extends _$PleromaApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements _$PleromaApiPushSubscriptionKeysCopyWith<$Res> {
  __$PleromaApiPushSubscriptionKeysCopyWithImpl(
      _PleromaApiPushSubscriptionKeys _value,
      $Res Function(_PleromaApiPushSubscriptionKeys) _then)
      : super(_value, (v) => _then(v as _PleromaApiPushSubscriptionKeys));

  @override
  _PleromaApiPushSubscriptionKeys get _value =>
      super._value as _PleromaApiPushSubscriptionKeys;

  @override
  $Res call({
    Object? p256dh = freezed,
    Object? auth = freezed,
  }) {
    return _then(_PleromaApiPushSubscriptionKeys(
      p256dh: p256dh == freezed
          ? _value.p256dh
          : p256dh // ignore: cast_nullable_to_non_nullable
              as String,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiPushSubscriptionKeys
    implements _PleromaApiPushSubscriptionKeys {
  const _$_PleromaApiPushSubscriptionKeys(
      {@HiveField(0) required this.p256dh, @HiveField(1) required this.auth});

  factory _$_PleromaApiPushSubscriptionKeys.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiPushSubscriptionKeysFromJson(json);

  @override

  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  final String p256dh;
  @override

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  final String auth;

  @override
  String toString() {
    return 'PleromaApiPushSubscriptionKeys(p256dh: $p256dh, auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiPushSubscriptionKeys &&
            (identical(other.p256dh, p256dh) || other.p256dh == p256dh) &&
            (identical(other.auth, auth) || other.auth == auth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p256dh, auth);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPushSubscriptionKeysCopyWith<_PleromaApiPushSubscriptionKeys>
      get copyWith => __$PleromaApiPushSubscriptionKeysCopyWithImpl<
          _PleromaApiPushSubscriptionKeys>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPushSubscriptionKeysToJson(this);
  }
}

abstract class _PleromaApiPushSubscriptionKeys
    implements PleromaApiPushSubscriptionKeys {
  const factory _PleromaApiPushSubscriptionKeys(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) = _$_PleromaApiPushSubscriptionKeys;

  factory _PleromaApiPushSubscriptionKeys.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPushSubscriptionKeys.fromJson;

  @override

  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  String get p256dh;
  @override

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  String get auth;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPushSubscriptionKeysCopyWith<_PleromaApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

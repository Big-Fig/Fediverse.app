// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_keys_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionKeys _$UnifediApiPushSubscriptionKeysFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionKeys.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysTearOff {
  const _$UnifediApiPushSubscriptionKeysTearOff();

  _UnifediApiPushSubscriptionKeys call(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) {
    return _UnifediApiPushSubscriptionKeys(
      p256dh: p256dh,
      auth: auth,
    );
  }

  UnifediApiPushSubscriptionKeys fromJson(Map<String, Object> json) {
    return UnifediApiPushSubscriptionKeys.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionKeys =
    _$UnifediApiPushSubscriptionKeysTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  String get p256dh => throw _privateConstructorUsedError;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  String get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionKeysCopyWith<UnifediApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionKeysCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionKeysCopyWith(
          UnifediApiPushSubscriptionKeys value,
          $Res Function(UnifediApiPushSubscriptionKeys) then) =
      _$UnifediApiPushSubscriptionKeysCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionKeysCopyWith<$Res> {
  _$UnifediApiPushSubscriptionKeysCopyWithImpl(this._value, this._then);

  final UnifediApiPushSubscriptionKeys _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionKeys) _then;

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
abstract class _$UnifediApiPushSubscriptionKeysCopyWith<$Res>
    implements $UnifediApiPushSubscriptionKeysCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionKeysCopyWith(
          _UnifediApiPushSubscriptionKeys value,
          $Res Function(_UnifediApiPushSubscriptionKeys) then) =
      __$UnifediApiPushSubscriptionKeysCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class __$UnifediApiPushSubscriptionKeysCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionKeysCopyWith<$Res> {
  __$UnifediApiPushSubscriptionKeysCopyWithImpl(
      _UnifediApiPushSubscriptionKeys _value,
      $Res Function(_UnifediApiPushSubscriptionKeys) _then)
      : super(_value, (v) => _then(v as _UnifediApiPushSubscriptionKeys));

  @override
  _UnifediApiPushSubscriptionKeys get _value =>
      super._value as _UnifediApiPushSubscriptionKeys;

  @override
  $Res call({
    Object? p256dh = freezed,
    Object? auth = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionKeys(
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
class _$_UnifediApiPushSubscriptionKeys
    implements _UnifediApiPushSubscriptionKeys {
  const _$_UnifediApiPushSubscriptionKeys(
      {@HiveField(0) required this.p256dh, @HiveField(1) required this.auth});

  factory _$_UnifediApiPushSubscriptionKeys.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionKeysFromJson(json);

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
    return 'UnifediApiPushSubscriptionKeys(p256dh: $p256dh, auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPushSubscriptionKeys &&
            (identical(other.p256dh, p256dh) ||
                const DeepCollectionEquality().equals(other.p256dh, p256dh)) &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(p256dh) ^
      const DeepCollectionEquality().hash(auth);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionKeysCopyWith<_UnifediApiPushSubscriptionKeys>
      get copyWith => __$UnifediApiPushSubscriptionKeysCopyWithImpl<
          _UnifediApiPushSubscriptionKeys>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionKeysToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionKeys
    implements UnifediApiPushSubscriptionKeys {
  const factory _UnifediApiPushSubscriptionKeys(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) = _$_UnifediApiPushSubscriptionKeys;

  factory _UnifediApiPushSubscriptionKeys.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionKeys.fromJson;

  @override

  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  String get p256dh => throw _privateConstructorUsedError;
  @override

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  String get auth => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionKeysCopyWith<_UnifediApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

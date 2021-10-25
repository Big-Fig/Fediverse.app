// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_push_subscription_keys_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPushSubscriptionKeys _$MastodonApiPushSubscriptionKeysFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPushSubscriptionKeys.fromJson(json);
}

/// @nodoc
class _$MastodonApiPushSubscriptionKeysTearOff {
  const _$MastodonApiPushSubscriptionKeysTearOff();

  _MastodonApiPushSubscriptionKeys call(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) {
    return _MastodonApiPushSubscriptionKeys(
      p256dh: p256dh,
      auth: auth,
    );
  }

  MastodonApiPushSubscriptionKeys fromJson(Map<String, Object> json) {
    return MastodonApiPushSubscriptionKeys.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPushSubscriptionKeys =
    _$MastodonApiPushSubscriptionKeysTearOff();

/// @nodoc
mixin _$MastodonApiPushSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  @HiveField(0)
  String get p256dh => throw _privateConstructorUsedError;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  @HiveField(1)
  String get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPushSubscriptionKeysCopyWith<MastodonApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPushSubscriptionKeysCopyWith<$Res> {
  factory $MastodonApiPushSubscriptionKeysCopyWith(
          MastodonApiPushSubscriptionKeys value,
          $Res Function(MastodonApiPushSubscriptionKeys) then) =
      _$MastodonApiPushSubscriptionKeysCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class _$MastodonApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements $MastodonApiPushSubscriptionKeysCopyWith<$Res> {
  _$MastodonApiPushSubscriptionKeysCopyWithImpl(this._value, this._then);

  final MastodonApiPushSubscriptionKeys _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPushSubscriptionKeys) _then;

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
abstract class _$MastodonApiPushSubscriptionKeysCopyWith<$Res>
    implements $MastodonApiPushSubscriptionKeysCopyWith<$Res> {
  factory _$MastodonApiPushSubscriptionKeysCopyWith(
          _MastodonApiPushSubscriptionKeys value,
          $Res Function(_MastodonApiPushSubscriptionKeys) then) =
      __$MastodonApiPushSubscriptionKeysCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String p256dh, @HiveField(1) String auth});
}

/// @nodoc
class __$MastodonApiPushSubscriptionKeysCopyWithImpl<$Res>
    extends _$MastodonApiPushSubscriptionKeysCopyWithImpl<$Res>
    implements _$MastodonApiPushSubscriptionKeysCopyWith<$Res> {
  __$MastodonApiPushSubscriptionKeysCopyWithImpl(
      _MastodonApiPushSubscriptionKeys _value,
      $Res Function(_MastodonApiPushSubscriptionKeys) _then)
      : super(_value, (v) => _then(v as _MastodonApiPushSubscriptionKeys));

  @override
  _MastodonApiPushSubscriptionKeys get _value =>
      super._value as _MastodonApiPushSubscriptionKeys;

  @override
  $Res call({
    Object? p256dh = freezed,
    Object? auth = freezed,
  }) {
    return _then(_MastodonApiPushSubscriptionKeys(
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
class _$_MastodonApiPushSubscriptionKeys
    implements _MastodonApiPushSubscriptionKeys {
  const _$_MastodonApiPushSubscriptionKeys(
      {@HiveField(0) required this.p256dh, @HiveField(1) required this.auth});

  factory _$_MastodonApiPushSubscriptionKeys.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiPushSubscriptionKeysFromJson(json);

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
    return 'MastodonApiPushSubscriptionKeys(p256dh: $p256dh, auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiPushSubscriptionKeys &&
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
  _$MastodonApiPushSubscriptionKeysCopyWith<_MastodonApiPushSubscriptionKeys>
      get copyWith => __$MastodonApiPushSubscriptionKeysCopyWithImpl<
          _MastodonApiPushSubscriptionKeys>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPushSubscriptionKeysToJson(this);
  }
}

abstract class _MastodonApiPushSubscriptionKeys
    implements MastodonApiPushSubscriptionKeys {
  const factory _MastodonApiPushSubscriptionKeys(
      {@HiveField(0) required String p256dh,
      @HiveField(1) required String auth}) = _$_MastodonApiPushSubscriptionKeys;

  factory _MastodonApiPushSubscriptionKeys.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPushSubscriptionKeys.fromJson;

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
  _$MastodonApiPushSubscriptionKeysCopyWith<_MastodonApiPushSubscriptionKeys>
      get copyWith => throw _privateConstructorUsedError;
}

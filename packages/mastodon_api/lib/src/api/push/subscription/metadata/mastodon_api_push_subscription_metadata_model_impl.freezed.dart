// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPushSubscriptionMetadata
    _$MastodonApiPushSubscriptionMetadataFromJson(Map<String, dynamic> json) {
  return _MastodonApiPushSubscribeRequestSubscription.fromJson(json);
}

/// @nodoc
class _$MastodonApiPushSubscriptionMetadataTearOff {
  const _$MastodonApiPushSubscriptionMetadataTearOff();

  _MastodonApiPushSubscribeRequestSubscription call(
      {@HiveField(0) required String endpoint,
      @HiveField(1) required MastodonApiPushSubscriptionKeys keys}) {
    return _MastodonApiPushSubscribeRequestSubscription(
      endpoint: endpoint,
      keys: keys,
    );
  }

  MastodonApiPushSubscriptionMetadata fromJson(Map<String, Object> json) {
    return MastodonApiPushSubscriptionMetadata.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPushSubscriptionMetadata =
    _$MastodonApiPushSubscriptionMetadataTearOff();

/// @nodoc
mixin _$MastodonApiPushSubscriptionMetadata {
  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String get endpoint => throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiPushSubscriptionKeys get keys =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPushSubscriptionMetadataCopyWith<
          MastodonApiPushSubscriptionMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPushSubscriptionMetadataCopyWith<$Res> {
  factory $MastodonApiPushSubscriptionMetadataCopyWith(
          MastodonApiPushSubscriptionMetadata value,
          $Res Function(MastodonApiPushSubscriptionMetadata) then) =
      _$MastodonApiPushSubscriptionMetadataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String endpoint,
      @HiveField(1) MastodonApiPushSubscriptionKeys keys});

  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get keys;
}

/// @nodoc
class _$MastodonApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements $MastodonApiPushSubscriptionMetadataCopyWith<$Res> {
  _$MastodonApiPushSubscriptionMetadataCopyWithImpl(this._value, this._then);

  final MastodonApiPushSubscriptionMetadata _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPushSubscriptionMetadata) _then;

  @override
  $Res call({
    Object? endpoint = freezed,
    Object? keys = freezed,
  }) {
    return _then(_value.copyWith(
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionKeys,
    ));
  }

  @override
  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get keys {
    return $MastodonApiPushSubscriptionKeysCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiPushSubscribeRequestSubscriptionCopyWith<$Res>
    implements $MastodonApiPushSubscriptionMetadataCopyWith<$Res> {
  factory _$MastodonApiPushSubscribeRequestSubscriptionCopyWith(
          _MastodonApiPushSubscribeRequestSubscription value,
          $Res Function(_MastodonApiPushSubscribeRequestSubscription) then) =
      __$MastodonApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String endpoint,
      @HiveField(1) MastodonApiPushSubscriptionKeys keys});

  @override
  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get keys;
}

/// @nodoc
class __$MastodonApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>
    extends _$MastodonApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements _$MastodonApiPushSubscribeRequestSubscriptionCopyWith<$Res> {
  __$MastodonApiPushSubscribeRequestSubscriptionCopyWithImpl(
      _MastodonApiPushSubscribeRequestSubscription _value,
      $Res Function(_MastodonApiPushSubscribeRequestSubscription) _then)
      : super(_value,
            (v) => _then(v as _MastodonApiPushSubscribeRequestSubscription));

  @override
  _MastodonApiPushSubscribeRequestSubscription get _value =>
      super._value as _MastodonApiPushSubscribeRequestSubscription;

  @override
  $Res call({
    Object? endpoint = freezed,
    Object? keys = freezed,
  }) {
    return _then(_MastodonApiPushSubscribeRequestSubscription(
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionKeys,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPushSubscribeRequestSubscription
    implements _MastodonApiPushSubscribeRequestSubscription {
  const _$_MastodonApiPushSubscribeRequestSubscription(
      {@HiveField(0) required this.endpoint, @HiveField(1) required this.keys});

  factory _$_MastodonApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiPushSubscribeRequestSubscriptionFromJson(json);

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  final String endpoint;
  @override
  @HiveField(1)
  final MastodonApiPushSubscriptionKeys keys;

  @override
  String toString() {
    return 'MastodonApiPushSubscriptionMetadata(endpoint: $endpoint, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiPushSubscribeRequestSubscription &&
            (identical(other.endpoint, endpoint) ||
                const DeepCollectionEquality()
                    .equals(other.endpoint, endpoint)) &&
            (identical(other.keys, keys) ||
                const DeepCollectionEquality().equals(other.keys, keys)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(endpoint) ^
      const DeepCollectionEquality().hash(keys);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPushSubscribeRequestSubscriptionCopyWith<
          _MastodonApiPushSubscribeRequestSubscription>
      get copyWith =>
          __$MastodonApiPushSubscribeRequestSubscriptionCopyWithImpl<
              _MastodonApiPushSubscribeRequestSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPushSubscribeRequestSubscriptionToJson(this);
  }
}

abstract class _MastodonApiPushSubscribeRequestSubscription
    implements MastodonApiPushSubscriptionMetadata {
  const factory _MastodonApiPushSubscribeRequestSubscription(
          {@HiveField(0) required String endpoint,
          @HiveField(1) required MastodonApiPushSubscriptionKeys keys}) =
      _$_MastodonApiPushSubscribeRequestSubscription;

  factory _MastodonApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiPushSubscribeRequestSubscription.fromJson;

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String get endpoint => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  MastodonApiPushSubscriptionKeys get keys =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPushSubscribeRequestSubscriptionCopyWith<
          _MastodonApiPushSubscribeRequestSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

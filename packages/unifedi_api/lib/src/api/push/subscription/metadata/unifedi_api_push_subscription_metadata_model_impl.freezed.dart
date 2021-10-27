// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionMetadata _$UnifediApiPushSubscriptionMetadataFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPushSubscribeRequestSubscription.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionMetadataTearOff {
  const _$UnifediApiPushSubscriptionMetadataTearOff();

  _UnifediApiPushSubscribeRequestSubscription call(
      {@HiveField(0) required String? endpoint,
      @HiveField(1) required UnifediApiPushSubscriptionKeys? keys}) {
    return _UnifediApiPushSubscribeRequestSubscription(
      endpoint: endpoint,
      keys: keys,
    );
  }

  UnifediApiPushSubscriptionMetadata fromJson(Map<String, Object?> json) {
    return UnifediApiPushSubscriptionMetadata.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionMetadata =
    _$UnifediApiPushSubscriptionMetadataTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionMetadata {
  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String? get endpoint => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiPushSubscriptionKeys? get keys =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionMetadataCopyWith<
          UnifediApiPushSubscriptionMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionMetadataCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionMetadataCopyWith(
          UnifediApiPushSubscriptionMetadata value,
          $Res Function(UnifediApiPushSubscriptionMetadata) then) =
      _$UnifediApiPushSubscriptionMetadataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? endpoint,
      @HiveField(1) UnifediApiPushSubscriptionKeys? keys});

  $UnifediApiPushSubscriptionKeysCopyWith<$Res>? get keys;
}

/// @nodoc
class _$UnifediApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionMetadataCopyWith<$Res> {
  _$UnifediApiPushSubscriptionMetadataCopyWithImpl(this._value, this._then);

  final UnifediApiPushSubscriptionMetadata _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionMetadata) _then;

  @override
  $Res call({
    Object? endpoint = freezed,
    Object? keys = freezed,
  }) {
    return _then(_value.copyWith(
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as UnifediApiPushSubscriptionKeys?,
    ));
  }

  @override
  $UnifediApiPushSubscriptionKeysCopyWith<$Res>? get keys {
    if (_value.keys == null) {
      return null;
    }

    return $UnifediApiPushSubscriptionKeysCopyWith<$Res>(_value.keys!, (value) {
      return _then(_value.copyWith(keys: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscribeRequestSubscriptionCopyWith<$Res>
    implements $UnifediApiPushSubscriptionMetadataCopyWith<$Res> {
  factory _$UnifediApiPushSubscribeRequestSubscriptionCopyWith(
          _UnifediApiPushSubscribeRequestSubscription value,
          $Res Function(_UnifediApiPushSubscribeRequestSubscription) then) =
      __$UnifediApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? endpoint,
      @HiveField(1) UnifediApiPushSubscriptionKeys? keys});

  @override
  $UnifediApiPushSubscriptionKeysCopyWith<$Res>? get keys;
}

/// @nodoc
class __$UnifediApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscribeRequestSubscriptionCopyWith<$Res> {
  __$UnifediApiPushSubscribeRequestSubscriptionCopyWithImpl(
      _UnifediApiPushSubscribeRequestSubscription _value,
      $Res Function(_UnifediApiPushSubscribeRequestSubscription) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscribeRequestSubscription));

  @override
  _UnifediApiPushSubscribeRequestSubscription get _value =>
      super._value as _UnifediApiPushSubscribeRequestSubscription;

  @override
  $Res call({
    Object? endpoint = freezed,
    Object? keys = freezed,
  }) {
    return _then(_UnifediApiPushSubscribeRequestSubscription(
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as UnifediApiPushSubscriptionKeys?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscribeRequestSubscription
    implements _UnifediApiPushSubscribeRequestSubscription {
  const _$_UnifediApiPushSubscribeRequestSubscription(
      {@HiveField(0) required this.endpoint, @HiveField(1) required this.keys});

  factory _$_UnifediApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscribeRequestSubscriptionFromJson(json);

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  final String? endpoint;
  @override
  @HiveField(1)
  final UnifediApiPushSubscriptionKeys? keys;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionMetadata(endpoint: $endpoint, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscribeRequestSubscription &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.keys, keys) || other.keys == keys));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint, keys);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscribeRequestSubscriptionCopyWith<
          _UnifediApiPushSubscribeRequestSubscription>
      get copyWith => __$UnifediApiPushSubscribeRequestSubscriptionCopyWithImpl<
          _UnifediApiPushSubscribeRequestSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscribeRequestSubscriptionToJson(this);
  }
}

abstract class _UnifediApiPushSubscribeRequestSubscription
    implements UnifediApiPushSubscriptionMetadata {
  const factory _UnifediApiPushSubscribeRequestSubscription(
          {@HiveField(0) required String? endpoint,
          @HiveField(1) required UnifediApiPushSubscriptionKeys? keys}) =
      _$_UnifediApiPushSubscribeRequestSubscription;

  factory _UnifediApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscribeRequestSubscription.fromJson;

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String? get endpoint;
  @override
  @HiveField(1)
  UnifediApiPushSubscriptionKeys? get keys;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscribeRequestSubscriptionCopyWith<
          _UnifediApiPushSubscribeRequestSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

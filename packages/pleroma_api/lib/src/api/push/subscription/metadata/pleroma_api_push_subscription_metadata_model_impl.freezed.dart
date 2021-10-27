// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPushSubscriptionMetadata _$PleromaApiPushSubscriptionMetadataFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPushSubscribeRequestSubscription.fromJson(json);
}

/// @nodoc
class _$PleromaApiPushSubscriptionMetadataTearOff {
  const _$PleromaApiPushSubscriptionMetadataTearOff();

  _PleromaApiPushSubscribeRequestSubscription call(
      {@HiveField(0) required String endpoint,
      @HiveField(1) required PleromaApiPushSubscriptionKeys keys}) {
    return _PleromaApiPushSubscribeRequestSubscription(
      endpoint: endpoint,
      keys: keys,
    );
  }

  PleromaApiPushSubscriptionMetadata fromJson(Map<String, Object?> json) {
    return PleromaApiPushSubscriptionMetadata.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPushSubscriptionMetadata =
    _$PleromaApiPushSubscriptionMetadataTearOff();

/// @nodoc
mixin _$PleromaApiPushSubscriptionMetadata {
  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String get endpoint => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiPushSubscriptionKeys get keys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPushSubscriptionMetadataCopyWith<
          PleromaApiPushSubscriptionMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPushSubscriptionMetadataCopyWith<$Res> {
  factory $PleromaApiPushSubscriptionMetadataCopyWith(
          PleromaApiPushSubscriptionMetadata value,
          $Res Function(PleromaApiPushSubscriptionMetadata) then) =
      _$PleromaApiPushSubscriptionMetadataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String endpoint,
      @HiveField(1) PleromaApiPushSubscriptionKeys keys});

  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get keys;
}

/// @nodoc
class _$PleromaApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements $PleromaApiPushSubscriptionMetadataCopyWith<$Res> {
  _$PleromaApiPushSubscriptionMetadataCopyWithImpl(this._value, this._then);

  final PleromaApiPushSubscriptionMetadata _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPushSubscriptionMetadata) _then;

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
              as PleromaApiPushSubscriptionKeys,
    ));
  }

  @override
  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get keys {
    return $PleromaApiPushSubscriptionKeysCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiPushSubscribeRequestSubscriptionCopyWith<$Res>
    implements $PleromaApiPushSubscriptionMetadataCopyWith<$Res> {
  factory _$PleromaApiPushSubscribeRequestSubscriptionCopyWith(
          _PleromaApiPushSubscribeRequestSubscription value,
          $Res Function(_PleromaApiPushSubscribeRequestSubscription) then) =
      __$PleromaApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String endpoint,
      @HiveField(1) PleromaApiPushSubscriptionKeys keys});

  @override
  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get keys;
}

/// @nodoc
class __$PleromaApiPushSubscribeRequestSubscriptionCopyWithImpl<$Res>
    extends _$PleromaApiPushSubscriptionMetadataCopyWithImpl<$Res>
    implements _$PleromaApiPushSubscribeRequestSubscriptionCopyWith<$Res> {
  __$PleromaApiPushSubscribeRequestSubscriptionCopyWithImpl(
      _PleromaApiPushSubscribeRequestSubscription _value,
      $Res Function(_PleromaApiPushSubscribeRequestSubscription) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiPushSubscribeRequestSubscription));

  @override
  _PleromaApiPushSubscribeRequestSubscription get _value =>
      super._value as _PleromaApiPushSubscribeRequestSubscription;

  @override
  $Res call({
    Object? endpoint = freezed,
    Object? keys = freezed,
  }) {
    return _then(_PleromaApiPushSubscribeRequestSubscription(
      endpoint: endpoint == freezed
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      keys: keys == freezed
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionKeys,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiPushSubscribeRequestSubscription
    implements _PleromaApiPushSubscribeRequestSubscription {
  const _$_PleromaApiPushSubscribeRequestSubscription(
      {@HiveField(0) required this.endpoint, @HiveField(1) required this.keys});

  factory _$_PleromaApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiPushSubscribeRequestSubscriptionFromJson(json);

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  final String endpoint;
  @override
  @HiveField(1)
  final PleromaApiPushSubscriptionKeys keys;

  @override
  String toString() {
    return 'PleromaApiPushSubscriptionMetadata(endpoint: $endpoint, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiPushSubscribeRequestSubscription &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.keys, keys) || other.keys == keys));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint, keys);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPushSubscribeRequestSubscriptionCopyWith<
          _PleromaApiPushSubscribeRequestSubscription>
      get copyWith => __$PleromaApiPushSubscribeRequestSubscriptionCopyWithImpl<
          _PleromaApiPushSubscribeRequestSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPushSubscribeRequestSubscriptionToJson(this);
  }
}

abstract class _PleromaApiPushSubscribeRequestSubscription
    implements PleromaApiPushSubscriptionMetadata {
  const factory _PleromaApiPushSubscribeRequestSubscription(
          {@HiveField(0) required String endpoint,
          @HiveField(1) required PleromaApiPushSubscriptionKeys keys}) =
      _$_PleromaApiPushSubscribeRequestSubscription;

  factory _PleromaApiPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiPushSubscribeRequestSubscription.fromJson;

  @override

  /// Endpoint URL that is called when a notification event occurs.
  @HiveField(0)
  String get endpoint;
  @override
  @HiveField(1)
  PleromaApiPushSubscriptionKeys get keys;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPushSubscribeRequestSubscriptionCopyWith<
          _PleromaApiPushSubscribeRequestSubscription>
      get copyWith => throw _privateConstructorUsedError;
}

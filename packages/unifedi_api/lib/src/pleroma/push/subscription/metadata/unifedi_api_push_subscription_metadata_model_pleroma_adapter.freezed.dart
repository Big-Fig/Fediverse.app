// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_metadata_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionMetadataPleromaAdapter
    _$UnifediApiPushSubscriptionMetadataPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionMetadataPleromaAdapterTearOff {
  const _$UnifediApiPushSubscriptionMetadataPleromaAdapterTearOff();

  _UnifediApiPushSubscriptionMetadataPleromaAdapter call(
      @HiveField(0) PleromaApiPushSubscriptionMetadata value) {
    return _UnifediApiPushSubscriptionMetadataPleromaAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionMetadataPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionMetadataPleromaAdapter =
    _$UnifediApiPushSubscriptionMetadataPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionMetadataPleromaAdapter {
  @HiveField(0)
  PleromaApiPushSubscriptionMetadata get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<
          UnifediApiPushSubscriptionMetadataPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith(
          UnifediApiPushSubscriptionMetadataPleromaAdapter value,
          $Res Function(UnifediApiPushSubscriptionMetadataPleromaAdapter)
              then) =
      _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPushSubscriptionMetadata value});

  $PleromaApiPushSubscriptionMetadataCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionMetadataPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionMetadataPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionMetadata,
    ));
  }

  @override
  $PleromaApiPushSubscriptionMetadataCopyWith<$Res> get value {
    return $PleromaApiPushSubscriptionMetadataCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith(
          _UnifediApiPushSubscriptionMetadataPleromaAdapter value,
          $Res Function(_UnifediApiPushSubscriptionMetadataPleromaAdapter)
              then) =
      __$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPushSubscriptionMetadata value});

  @override
  $PleromaApiPushSubscriptionMetadataCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<$Res>
    implements
        _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionMetadataPleromaAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionMetadataPleromaAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiPushSubscriptionMetadataPleromaAdapter));

  @override
  _UnifediApiPushSubscriptionMetadataPleromaAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionMetadataPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionMetadataPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionMetadata,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionMetadataPleromaAdapter
    extends _UnifediApiPushSubscriptionMetadataPleromaAdapter {
  const _$_UnifediApiPushSubscriptionMetadataPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionMetadataPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPushSubscriptionMetadata value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionMetadataPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPushSubscriptionMetadataPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionMetadataPleromaAdapter>
      get copyWith =>
          __$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWithImpl<
                  _UnifediApiPushSubscriptionMetadataPleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionMetadataPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionMetadataPleromaAdapter
    extends UnifediApiPushSubscriptionMetadataPleromaAdapter {
  const factory _UnifediApiPushSubscriptionMetadataPleromaAdapter(
          @HiveField(0) PleromaApiPushSubscriptionMetadata value) =
      _$_UnifediApiPushSubscriptionMetadataPleromaAdapter;
  const _UnifediApiPushSubscriptionMetadataPleromaAdapter._() : super._();

  factory _UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPushSubscriptionMetadata get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionMetadataPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionMetadataPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

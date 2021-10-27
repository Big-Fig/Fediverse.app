// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_payload_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushPayloadPleromaAdapter
    _$UnifediApiPushPayloadPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPushPayloadPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushPayloadPleromaAdapterTearOff {
  const _$UnifediApiPushPayloadPleromaAdapterTearOff();

  _UnifediApiPushPayloadPleromaAdapter call(
      @HiveField(0) PleromaApiPushPayload value) {
    return _UnifediApiPushPayloadPleromaAdapter(
      value,
    );
  }

  UnifediApiPushPayloadPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPushPayloadPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushPayloadPleromaAdapter =
    _$UnifediApiPushPayloadPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushPayloadPleromaAdapter {
  @HiveField(0)
  PleromaApiPushPayload get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushPayloadPleromaAdapterCopyWith<
          UnifediApiPushPayloadPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushPayloadPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPushPayloadPleromaAdapterCopyWith(
          UnifediApiPushPayloadPleromaAdapter value,
          $Res Function(UnifediApiPushPayloadPleromaAdapter) then) =
      _$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPushPayload value});

  $PleromaApiPushPayloadCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushPayloadPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPushPayloadPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPushPayloadPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushPayloadPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushPayload,
    ));
  }

  @override
  $PleromaApiPushPayloadCopyWith<$Res> get value {
    return $PleromaApiPushPayloadCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushPayloadPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPushPayloadPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPushPayloadPleromaAdapterCopyWith(
          _UnifediApiPushPayloadPleromaAdapter value,
          $Res Function(_UnifediApiPushPayloadPleromaAdapter) then) =
      __$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPushPayload value});

  @override
  $PleromaApiPushPayloadCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushPayloadPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPushPayloadPleromaAdapterCopyWithImpl(
      _UnifediApiPushPayloadPleromaAdapter _value,
      $Res Function(_UnifediApiPushPayloadPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPushPayloadPleromaAdapter));

  @override
  _UnifediApiPushPayloadPleromaAdapter get _value =>
      super._value as _UnifediApiPushPayloadPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushPayloadPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushPayload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushPayloadPleromaAdapter
    extends _UnifediApiPushPayloadPleromaAdapter {
  const _$_UnifediApiPushPayloadPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushPayloadPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushPayloadPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPushPayload value;

  @override
  String toString() {
    return 'UnifediApiPushPayloadPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushPayloadPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushPayloadPleromaAdapterCopyWith<
          _UnifediApiPushPayloadPleromaAdapter>
      get copyWith => __$UnifediApiPushPayloadPleromaAdapterCopyWithImpl<
          _UnifediApiPushPayloadPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushPayloadPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPushPayloadPleromaAdapter
    extends UnifediApiPushPayloadPleromaAdapter {
  const factory _UnifediApiPushPayloadPleromaAdapter(
          @HiveField(0) PleromaApiPushPayload value) =
      _$_UnifediApiPushPayloadPleromaAdapter;
  const _UnifediApiPushPayloadPleromaAdapter._() : super._();

  factory _UnifediApiPushPayloadPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushPayloadPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPushPayload get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushPayloadPleromaAdapterCopyWith<
          _UnifediApiPushPayloadPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

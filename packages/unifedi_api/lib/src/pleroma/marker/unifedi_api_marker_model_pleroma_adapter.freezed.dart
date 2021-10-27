// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_marker_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMarkerPleromaAdapter _$UnifediApiMarkerPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMarkerPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMarkerPleromaAdapterTearOff {
  const _$UnifediApiMarkerPleromaAdapterTearOff();

  _UnifediApiMarkerPleromaAdapter call(@HiveField(0) PleromaApiMarker value) {
    return _UnifediApiMarkerPleromaAdapter(
      value,
    );
  }

  UnifediApiMarkerPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiMarkerPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMarkerPleromaAdapter =
    _$UnifediApiMarkerPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMarkerPleromaAdapter {
  @HiveField(0)
  PleromaApiMarker get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMarkerPleromaAdapterCopyWith<UnifediApiMarkerPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMarkerPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMarkerPleromaAdapterCopyWith(
          UnifediApiMarkerPleromaAdapter value,
          $Res Function(UnifediApiMarkerPleromaAdapter) then) =
      _$UnifediApiMarkerPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMarker value});

  $PleromaApiMarkerCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMarkerPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMarkerPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMarkerPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMarkerPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMarkerPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMarker,
    ));
  }

  @override
  $PleromaApiMarkerCopyWith<$Res> get value {
    return $PleromaApiMarkerCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMarkerPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMarkerPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMarkerPleromaAdapterCopyWith(
          _UnifediApiMarkerPleromaAdapter value,
          $Res Function(_UnifediApiMarkerPleromaAdapter) then) =
      __$UnifediApiMarkerPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMarker value});

  @override
  $PleromaApiMarkerCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMarkerPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMarkerPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMarkerPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMarkerPleromaAdapterCopyWithImpl(
      _UnifediApiMarkerPleromaAdapter _value,
      $Res Function(_UnifediApiMarkerPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMarkerPleromaAdapter));

  @override
  _UnifediApiMarkerPleromaAdapter get _value =>
      super._value as _UnifediApiMarkerPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMarkerPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMarker,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMarkerPleromaAdapter
    extends _UnifediApiMarkerPleromaAdapter {
  const _$_UnifediApiMarkerPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiMarkerPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMarkerPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMarker value;

  @override
  String toString() {
    return 'UnifediApiMarkerPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMarkerPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMarkerPleromaAdapterCopyWith<_UnifediApiMarkerPleromaAdapter>
      get copyWith => __$UnifediApiMarkerPleromaAdapterCopyWithImpl<
          _UnifediApiMarkerPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMarkerPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMarkerPleromaAdapter
    extends UnifediApiMarkerPleromaAdapter {
  const factory _UnifediApiMarkerPleromaAdapter(
      @HiveField(0) PleromaApiMarker value) = _$_UnifediApiMarkerPleromaAdapter;
  const _UnifediApiMarkerPleromaAdapter._() : super._();

  factory _UnifediApiMarkerPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMarkerPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMarker get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMarkerPleromaAdapterCopyWith<_UnifediApiMarkerPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

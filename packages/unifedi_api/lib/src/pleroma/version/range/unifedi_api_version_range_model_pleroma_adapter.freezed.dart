// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_version_range_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiVersionRangePleromaAdapter
    _$UnifediApiVersionRangePleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiVersionRangePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiVersionRangePleromaAdapterTearOff {
  const _$UnifediApiVersionRangePleromaAdapterTearOff();

  _UnifediApiVersionRangePleromaAdapter call(
      @HiveField(0) PleromaApiVersionRange value) {
    return _UnifediApiVersionRangePleromaAdapter(
      value,
    );
  }

  UnifediApiVersionRangePleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiVersionRangePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiVersionRangePleromaAdapter =
    _$UnifediApiVersionRangePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiVersionRangePleromaAdapter {
  @HiveField(0)
  PleromaApiVersionRange get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiVersionRangePleromaAdapterCopyWith<
          UnifediApiVersionRangePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiVersionRangePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiVersionRangePleromaAdapterCopyWith(
          UnifediApiVersionRangePleromaAdapter value,
          $Res Function(UnifediApiVersionRangePleromaAdapter) then) =
      _$UnifediApiVersionRangePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiVersionRange value});

  $PleromaApiVersionRangeCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiVersionRangePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiVersionRangePleromaAdapterCopyWith<$Res> {
  _$UnifediApiVersionRangePleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiVersionRangePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiVersionRangePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersionRange,
    ));
  }

  @override
  $PleromaApiVersionRangeCopyWith<$Res> get value {
    return $PleromaApiVersionRangeCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiVersionRangePleromaAdapterCopyWith<$Res>
    implements $UnifediApiVersionRangePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiVersionRangePleromaAdapterCopyWith(
          _UnifediApiVersionRangePleromaAdapter value,
          $Res Function(_UnifediApiVersionRangePleromaAdapter) then) =
      __$UnifediApiVersionRangePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiVersionRange value});

  @override
  $PleromaApiVersionRangeCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiVersionRangePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiVersionRangePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiVersionRangePleromaAdapterCopyWith<$Res> {
  __$UnifediApiVersionRangePleromaAdapterCopyWithImpl(
      _UnifediApiVersionRangePleromaAdapter _value,
      $Res Function(_UnifediApiVersionRangePleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiVersionRangePleromaAdapter));

  @override
  _UnifediApiVersionRangePleromaAdapter get _value =>
      super._value as _UnifediApiVersionRangePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiVersionRangePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersionRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiVersionRangePleromaAdapter
    extends _UnifediApiVersionRangePleromaAdapter {
  const _$_UnifediApiVersionRangePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiVersionRangePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiVersionRangePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiVersionRange value;

  @override
  String toString() {
    return 'UnifediApiVersionRangePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiVersionRangePleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiVersionRangePleromaAdapterCopyWith<
          _UnifediApiVersionRangePleromaAdapter>
      get copyWith => __$UnifediApiVersionRangePleromaAdapterCopyWithImpl<
          _UnifediApiVersionRangePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiVersionRangePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiVersionRangePleromaAdapter
    extends UnifediApiVersionRangePleromaAdapter {
  const factory _UnifediApiVersionRangePleromaAdapter(
          @HiveField(0) PleromaApiVersionRange value) =
      _$_UnifediApiVersionRangePleromaAdapter;
  const _UnifediApiVersionRangePleromaAdapter._() : super._();

  factory _UnifediApiVersionRangePleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiVersionRangePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiVersionRange get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiVersionRangePleromaAdapterCopyWith<
          _UnifediApiVersionRangePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

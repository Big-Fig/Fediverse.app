// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_version_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiVersionPleromaAdapter _$UnifediApiVersionPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiVersionPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiVersionPleromaAdapterTearOff {
  const _$UnifediApiVersionPleromaAdapterTearOff();

  _UnifediApiVersionPleromaAdapter call(@HiveField(0) PleromaApiVersion value) {
    return _UnifediApiVersionPleromaAdapter(
      value,
    );
  }

  UnifediApiVersionPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiVersionPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiVersionPleromaAdapter =
    _$UnifediApiVersionPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiVersionPleromaAdapter {
  @HiveField(0)
  PleromaApiVersion get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiVersionPleromaAdapterCopyWith<UnifediApiVersionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiVersionPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiVersionPleromaAdapterCopyWith(
          UnifediApiVersionPleromaAdapter value,
          $Res Function(UnifediApiVersionPleromaAdapter) then) =
      _$UnifediApiVersionPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiVersion value});

  $PleromaApiVersionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiVersionPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiVersionPleromaAdapterCopyWith<$Res> {
  _$UnifediApiVersionPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiVersionPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiVersionPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion,
    ));
  }

  @override
  $PleromaApiVersionCopyWith<$Res> get value {
    return $PleromaApiVersionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiVersionPleromaAdapterCopyWith<$Res>
    implements $UnifediApiVersionPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiVersionPleromaAdapterCopyWith(
          _UnifediApiVersionPleromaAdapter value,
          $Res Function(_UnifediApiVersionPleromaAdapter) then) =
      __$UnifediApiVersionPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiVersion value});

  @override
  $PleromaApiVersionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiVersionPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiVersionPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiVersionPleromaAdapterCopyWith<$Res> {
  __$UnifediApiVersionPleromaAdapterCopyWithImpl(
      _UnifediApiVersionPleromaAdapter _value,
      $Res Function(_UnifediApiVersionPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiVersionPleromaAdapter));

  @override
  _UnifediApiVersionPleromaAdapter get _value =>
      super._value as _UnifediApiVersionPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiVersionPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiVersionPleromaAdapter
    extends _UnifediApiVersionPleromaAdapter {
  const _$_UnifediApiVersionPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiVersionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiVersionPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiVersion value;

  @override
  String toString() {
    return 'UnifediApiVersionPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiVersionPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiVersionPleromaAdapterCopyWith<_UnifediApiVersionPleromaAdapter>
      get copyWith => __$UnifediApiVersionPleromaAdapterCopyWithImpl<
          _UnifediApiVersionPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiVersionPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiVersionPleromaAdapter
    extends UnifediApiVersionPleromaAdapter {
  const factory _UnifediApiVersionPleromaAdapter(
          @HiveField(0) PleromaApiVersion value) =
      _$_UnifediApiVersionPleromaAdapter;
  const _UnifediApiVersionPleromaAdapter._() : super._();

  factory _UnifediApiVersionPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiVersionPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiVersion get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiVersionPleromaAdapterCopyWith<_UnifediApiVersionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

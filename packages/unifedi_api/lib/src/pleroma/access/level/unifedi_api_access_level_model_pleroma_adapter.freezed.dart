// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_level_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessLevelPleromaAdapter
    _$UnifediApiAccessLevelPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessLevelPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessLevelPleromaAdapterTearOff {
  const _$UnifediApiAccessLevelPleromaAdapterTearOff();

  _UnifediApiAccessLevelPleromaAdapter call(
      @HiveField(0) PleromaApiAccessLevel value) {
    return _UnifediApiAccessLevelPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessLevelPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccessLevelPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessLevelPleromaAdapter =
    _$UnifediApiAccessLevelPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessLevelPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessLevel get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessLevelPleromaAdapterCopyWith<
          UnifediApiAccessLevelPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessLevelPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessLevelPleromaAdapterCopyWith(
          UnifediApiAccessLevelPleromaAdapter value,
          $Res Function(UnifediApiAccessLevelPleromaAdapter) then) =
      _$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessLevel value});

  $PleromaApiAccessLevelCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessLevelPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessLevelPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessLevelPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessLevelPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevel,
    ));
  }

  @override
  $PleromaApiAccessLevelCopyWith<$Res> get value {
    return $PleromaApiAccessLevelCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessLevelPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessLevelPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessLevelPleromaAdapterCopyWith(
          _UnifediApiAccessLevelPleromaAdapter value,
          $Res Function(_UnifediApiAccessLevelPleromaAdapter) then) =
      __$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessLevel value});

  @override
  $PleromaApiAccessLevelCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessLevelPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessLevelPleromaAdapterCopyWithImpl(
      _UnifediApiAccessLevelPleromaAdapter _value,
      $Res Function(_UnifediApiAccessLevelPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessLevelPleromaAdapter));

  @override
  _UnifediApiAccessLevelPleromaAdapter get _value =>
      super._value as _UnifediApiAccessLevelPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessLevelPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessLevelPleromaAdapter
    extends _UnifediApiAccessLevelPleromaAdapter {
  const _$_UnifediApiAccessLevelPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessLevelPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessLevelPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessLevel value;

  @override
  String toString() {
    return 'UnifediApiAccessLevelPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessLevelPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessLevelPleromaAdapterCopyWith<
          _UnifediApiAccessLevelPleromaAdapter>
      get copyWith => __$UnifediApiAccessLevelPleromaAdapterCopyWithImpl<
          _UnifediApiAccessLevelPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessLevelPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessLevelPleromaAdapter
    extends UnifediApiAccessLevelPleromaAdapter {
  const factory _UnifediApiAccessLevelPleromaAdapter(
          @HiveField(0) PleromaApiAccessLevel value) =
      _$_UnifediApiAccessLevelPleromaAdapter;
  const _UnifediApiAccessLevelPleromaAdapter._() : super._();

  factory _UnifediApiAccessLevelPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessLevelPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessLevel get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessLevelPleromaAdapterCopyWith<
          _UnifediApiAccessLevelPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

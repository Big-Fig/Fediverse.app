// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_stats_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceStatsPleromaAdapter
    _$UnifediApiInstanceStatsPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiInstanceStatsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceStatsPleromaAdapterTearOff {
  const _$UnifediApiInstanceStatsPleromaAdapterTearOff();

  _UnifediApiInstanceStatsPleromaAdapter call(
      @HiveField(0) PleromaApiInstanceStats value) {
    return _UnifediApiInstanceStatsPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceStatsPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceStatsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceStatsPleromaAdapter =
    _$UnifediApiInstanceStatsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceStatsPleromaAdapter {
  @HiveField(0)
  PleromaApiInstanceStats get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceStatsPleromaAdapterCopyWith<
          UnifediApiInstanceStatsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceStatsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceStatsPleromaAdapterCopyWith(
          UnifediApiInstanceStatsPleromaAdapter value,
          $Res Function(UnifediApiInstanceStatsPleromaAdapter) then) =
      _$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstanceStats value});

  $PleromaApiInstanceStatsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceStatsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceStatsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceStatsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceStats,
    ));
  }

  @override
  $PleromaApiInstanceStatsCopyWith<$Res> get value {
    return $PleromaApiInstanceStatsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceStatsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceStatsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceStatsPleromaAdapterCopyWith(
          _UnifediApiInstanceStatsPleromaAdapter value,
          $Res Function(_UnifediApiInstanceStatsPleromaAdapter) then) =
      __$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstanceStats value});

  @override
  $PleromaApiInstanceStatsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceStatsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceStatsPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceStatsPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiInstanceStatsPleromaAdapter));

  @override
  _UnifediApiInstanceStatsPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceStatsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceStatsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceStatsPleromaAdapter
    extends _UnifediApiInstanceStatsPleromaAdapter {
  const _$_UnifediApiInstanceStatsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceStatsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceStatsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstanceStats value;

  @override
  String toString() {
    return 'UnifediApiInstanceStatsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceStatsPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceStatsPleromaAdapterCopyWith<
          _UnifediApiInstanceStatsPleromaAdapter>
      get copyWith => __$UnifediApiInstanceStatsPleromaAdapterCopyWithImpl<
          _UnifediApiInstanceStatsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceStatsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceStatsPleromaAdapter
    extends UnifediApiInstanceStatsPleromaAdapter {
  const factory _UnifediApiInstanceStatsPleromaAdapter(
          @HiveField(0) PleromaApiInstanceStats value) =
      _$_UnifediApiInstanceStatsPleromaAdapter;
  const _UnifediApiInstanceStatsPleromaAdapter._() : super._();

  factory _UnifediApiInstanceStatsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceStatsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstanceStats get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceStatsPleromaAdapterCopyWith<
          _UnifediApiInstanceStatsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

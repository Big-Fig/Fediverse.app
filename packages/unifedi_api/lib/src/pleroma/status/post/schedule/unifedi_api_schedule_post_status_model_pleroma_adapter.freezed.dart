// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_schedule_post_status_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiSchedulePostStatusPleromaAdapter
    _$UnifediApiSchedulePostStatusPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiSchedulePostStatusPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiSchedulePostStatusPleromaAdapterTearOff {
  const _$UnifediApiSchedulePostStatusPleromaAdapterTearOff();

  _UnifediApiSchedulePostStatusPleromaAdapter call(
      @HiveField(0) PleromaApiSchedulePostStatus value) {
    return _UnifediApiSchedulePostStatusPleromaAdapter(
      value,
    );
  }

  UnifediApiSchedulePostStatusPleromaAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiSchedulePostStatusPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiSchedulePostStatusPleromaAdapter =
    _$UnifediApiSchedulePostStatusPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiSchedulePostStatusPleromaAdapter {
  @HiveField(0)
  PleromaApiSchedulePostStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiSchedulePostStatusPleromaAdapterCopyWith<
          UnifediApiSchedulePostStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiSchedulePostStatusPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiSchedulePostStatusPleromaAdapterCopyWith(
          UnifediApiSchedulePostStatusPleromaAdapter value,
          $Res Function(UnifediApiSchedulePostStatusPleromaAdapter) then) =
      _$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiSchedulePostStatus value});

  $PleromaApiSchedulePostStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiSchedulePostStatusPleromaAdapterCopyWith<$Res> {
  _$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiSchedulePostStatusPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiSchedulePostStatusPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiSchedulePostStatus,
    ));
  }

  @override
  $PleromaApiSchedulePostStatusCopyWith<$Res> get value {
    return $PleromaApiSchedulePostStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiSchedulePostStatusPleromaAdapterCopyWith<$Res>
    implements $UnifediApiSchedulePostStatusPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiSchedulePostStatusPleromaAdapterCopyWith(
          _UnifediApiSchedulePostStatusPleromaAdapter value,
          $Res Function(_UnifediApiSchedulePostStatusPleromaAdapter) then) =
      __$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiSchedulePostStatus value});

  @override
  $PleromaApiSchedulePostStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiSchedulePostStatusPleromaAdapterCopyWith<$Res> {
  __$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl(
      _UnifediApiSchedulePostStatusPleromaAdapter _value,
      $Res Function(_UnifediApiSchedulePostStatusPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiSchedulePostStatusPleromaAdapter));

  @override
  _UnifediApiSchedulePostStatusPleromaAdapter get _value =>
      super._value as _UnifediApiSchedulePostStatusPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiSchedulePostStatusPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiSchedulePostStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiSchedulePostStatusPleromaAdapter
    extends _UnifediApiSchedulePostStatusPleromaAdapter {
  const _$_UnifediApiSchedulePostStatusPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiSchedulePostStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiSchedulePostStatusPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiSchedulePostStatus value;

  @override
  String toString() {
    return 'UnifediApiSchedulePostStatusPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiSchedulePostStatusPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiSchedulePostStatusPleromaAdapterCopyWith<
          _UnifediApiSchedulePostStatusPleromaAdapter>
      get copyWith => __$UnifediApiSchedulePostStatusPleromaAdapterCopyWithImpl<
          _UnifediApiSchedulePostStatusPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiSchedulePostStatusPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiSchedulePostStatusPleromaAdapter
    extends UnifediApiSchedulePostStatusPleromaAdapter {
  const factory _UnifediApiSchedulePostStatusPleromaAdapter(
          @HiveField(0) PleromaApiSchedulePostStatus value) =
      _$_UnifediApiSchedulePostStatusPleromaAdapter;
  const _UnifediApiSchedulePostStatusPleromaAdapter._() : super._();

  factory _UnifediApiSchedulePostStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiSchedulePostStatusPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiSchedulePostStatus get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiSchedulePostStatusPleromaAdapterCopyWith<
          _UnifediApiSchedulePostStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

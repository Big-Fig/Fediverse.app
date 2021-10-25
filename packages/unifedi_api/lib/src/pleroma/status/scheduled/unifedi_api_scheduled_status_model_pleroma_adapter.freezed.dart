// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatusPleromaAdapter
    _$UnifediApiScheduledStatusPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiScheduledStatusPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusPleromaAdapterTearOff {
  const _$UnifediApiScheduledStatusPleromaAdapterTearOff();

  _UnifediApiScheduledStatusPleromaAdapter call(
      @HiveField(0) PleromaApiScheduledStatus value) {
    return _UnifediApiScheduledStatusPleromaAdapter(
      value,
    );
  }

  UnifediApiScheduledStatusPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiScheduledStatusPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatusPleromaAdapter =
    _$UnifediApiScheduledStatusPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatusPleromaAdapter {
  @HiveField(0)
  PleromaApiScheduledStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusPleromaAdapterCopyWith<
          UnifediApiScheduledStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiScheduledStatusPleromaAdapterCopyWith(
          UnifediApiScheduledStatusPleromaAdapter value,
          $Res Function(UnifediApiScheduledStatusPleromaAdapter) then) =
      _$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiScheduledStatus value});

  $PleromaApiScheduledStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusPleromaAdapterCopyWith<$Res> {
  _$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiScheduledStatusPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatusPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatus,
    ));
  }

  @override
  $PleromaApiScheduledStatusCopyWith<$Res> get value {
    return $PleromaApiScheduledStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusPleromaAdapterCopyWith<$Res>
    implements $UnifediApiScheduledStatusPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusPleromaAdapterCopyWith(
          _UnifediApiScheduledStatusPleromaAdapter value,
          $Res Function(_UnifediApiScheduledStatusPleromaAdapter) then) =
      __$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiScheduledStatus value});

  @override
  $PleromaApiScheduledStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusPleromaAdapterCopyWith<$Res> {
  __$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl(
      _UnifediApiScheduledStatusPleromaAdapter _value,
      $Res Function(_UnifediApiScheduledStatusPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiScheduledStatusPleromaAdapter));

  @override
  _UnifediApiScheduledStatusPleromaAdapter get _value =>
      super._value as _UnifediApiScheduledStatusPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiScheduledStatusPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatusPleromaAdapter
    extends _UnifediApiScheduledStatusPleromaAdapter {
  const _$_UnifediApiScheduledStatusPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiScheduledStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiScheduledStatus value;

  @override
  String toString() {
    return 'UnifediApiScheduledStatusPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiScheduledStatusPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusPleromaAdapterCopyWith<
          _UnifediApiScheduledStatusPleromaAdapter>
      get copyWith => __$UnifediApiScheduledStatusPleromaAdapterCopyWithImpl<
          _UnifediApiScheduledStatusPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiScheduledStatusPleromaAdapter
    extends UnifediApiScheduledStatusPleromaAdapter {
  const factory _UnifediApiScheduledStatusPleromaAdapter(
          @HiveField(0) PleromaApiScheduledStatus value) =
      _$_UnifediApiScheduledStatusPleromaAdapter;
  const _UnifediApiScheduledStatusPleromaAdapter._() : super._();

  factory _UnifediApiScheduledStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatusPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiScheduledStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusPleromaAdapterCopyWith<
          _UnifediApiScheduledStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

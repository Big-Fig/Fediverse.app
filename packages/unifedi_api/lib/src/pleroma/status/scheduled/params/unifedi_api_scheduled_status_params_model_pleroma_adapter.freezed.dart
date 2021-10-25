// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_params_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatusParamsPleromaAdapter
    _$UnifediApiScheduledStatusParamsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiScheduledStatusParamsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsPleromaAdapterTearOff {
  const _$UnifediApiScheduledStatusParamsPleromaAdapterTearOff();

  _UnifediApiScheduledStatusParamsPleromaAdapter call(
      @HiveField(0) PleromaApiScheduledStatusParams value) {
    return _UnifediApiScheduledStatusParamsPleromaAdapter(
      value,
    );
  }

  UnifediApiScheduledStatusParamsPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiScheduledStatusParamsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatusParamsPleromaAdapter =
    _$UnifediApiScheduledStatusParamsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatusParamsPleromaAdapter {
  @HiveField(0)
  PleromaApiScheduledStatusParams get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<
          UnifediApiScheduledStatusParamsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiScheduledStatusParamsPleromaAdapterCopyWith(
          UnifediApiScheduledStatusParamsPleromaAdapter value,
          $Res Function(UnifediApiScheduledStatusParamsPleromaAdapter) then) =
      _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiScheduledStatusParams value});

  $PleromaApiScheduledStatusParamsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiScheduledStatusParamsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatusParamsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatusParams,
    ));
  }

  @override
  $PleromaApiScheduledStatusParamsCopyWith<$Res> get value {
    return $PleromaApiScheduledStatusParamsCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWith(
          _UnifediApiScheduledStatusParamsPleromaAdapter value,
          $Res Function(_UnifediApiScheduledStatusParamsPleromaAdapter) then) =
      __$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiScheduledStatusParams value});

  @override
  $PleromaApiScheduledStatusParamsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl(
      _UnifediApiScheduledStatusParamsPleromaAdapter _value,
      $Res Function(_UnifediApiScheduledStatusParamsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiScheduledStatusParamsPleromaAdapter));

  @override
  _UnifediApiScheduledStatusParamsPleromaAdapter get _value =>
      super._value as _UnifediApiScheduledStatusParamsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiScheduledStatusParamsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatusParams,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatusParamsPleromaAdapter
    extends _UnifediApiScheduledStatusParamsPleromaAdapter {
  const _$_UnifediApiScheduledStatusParamsPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiScheduledStatusParamsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusParamsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiScheduledStatusParams value;

  @override
  String toString() {
    return 'UnifediApiScheduledStatusParamsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiScheduledStatusParamsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<
          _UnifediApiScheduledStatusParamsPleromaAdapter>
      get copyWith =>
          __$UnifediApiScheduledStatusParamsPleromaAdapterCopyWithImpl<
              _UnifediApiScheduledStatusParamsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusParamsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiScheduledStatusParamsPleromaAdapter
    extends UnifediApiScheduledStatusParamsPleromaAdapter {
  const factory _UnifediApiScheduledStatusParamsPleromaAdapter(
          @HiveField(0) PleromaApiScheduledStatusParams value) =
      _$_UnifediApiScheduledStatusParamsPleromaAdapter;
  const _UnifediApiScheduledStatusParamsPleromaAdapter._() : super._();

  factory _UnifediApiScheduledStatusParamsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatusParamsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiScheduledStatusParams get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusParamsPleromaAdapterCopyWith<
          _UnifediApiScheduledStatusParamsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

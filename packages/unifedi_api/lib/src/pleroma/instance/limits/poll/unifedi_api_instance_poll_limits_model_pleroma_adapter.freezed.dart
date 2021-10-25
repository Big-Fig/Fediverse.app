// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_poll_limits_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstancePollLimitsPleromaAdapter
    _$UnifediApiInstancePollLimitsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstancePollLimitsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstancePollLimitsPleromaAdapterTearOff {
  const _$UnifediApiInstancePollLimitsPleromaAdapterTearOff();

  _UnifediApiInstancePollLimitsPleromaAdapter call(
      @HiveField(0) PleromaApiInstancePollLimits value) {
    return _UnifediApiInstancePollLimitsPleromaAdapter(
      value,
    );
  }

  UnifediApiInstancePollLimitsPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiInstancePollLimitsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstancePollLimitsPleromaAdapter =
    _$UnifediApiInstancePollLimitsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstancePollLimitsPleromaAdapter {
  @HiveField(0)
  PleromaApiInstancePollLimits get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstancePollLimitsPleromaAdapterCopyWith<
          UnifediApiInstancePollLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstancePollLimitsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstancePollLimitsPleromaAdapterCopyWith(
          UnifediApiInstancePollLimitsPleromaAdapter value,
          $Res Function(UnifediApiInstancePollLimitsPleromaAdapter) then) =
      _$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstancePollLimits value});

  $PleromaApiInstancePollLimitsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstancePollLimitsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstancePollLimitsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstancePollLimitsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePollLimits,
    ));
  }

  @override
  $PleromaApiInstancePollLimitsCopyWith<$Res> get value {
    return $PleromaApiInstancePollLimitsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstancePollLimitsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstancePollLimitsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstancePollLimitsPleromaAdapterCopyWith(
          _UnifediApiInstancePollLimitsPleromaAdapter value,
          $Res Function(_UnifediApiInstancePollLimitsPleromaAdapter) then) =
      __$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstancePollLimits value});

  @override
  $PleromaApiInstancePollLimitsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstancePollLimitsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl(
      _UnifediApiInstancePollLimitsPleromaAdapter _value,
      $Res Function(_UnifediApiInstancePollLimitsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstancePollLimitsPleromaAdapter));

  @override
  _UnifediApiInstancePollLimitsPleromaAdapter get _value =>
      super._value as _UnifediApiInstancePollLimitsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstancePollLimitsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePollLimits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstancePollLimitsPleromaAdapter
    extends _UnifediApiInstancePollLimitsPleromaAdapter {
  const _$_UnifediApiInstancePollLimitsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstancePollLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstancePollLimitsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstancePollLimits value;

  @override
  String toString() {
    return 'UnifediApiInstancePollLimitsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstancePollLimitsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstancePollLimitsPleromaAdapterCopyWith<
          _UnifediApiInstancePollLimitsPleromaAdapter>
      get copyWith => __$UnifediApiInstancePollLimitsPleromaAdapterCopyWithImpl<
          _UnifediApiInstancePollLimitsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstancePollLimitsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstancePollLimitsPleromaAdapter
    extends UnifediApiInstancePollLimitsPleromaAdapter {
  const factory _UnifediApiInstancePollLimitsPleromaAdapter(
          @HiveField(0) PleromaApiInstancePollLimits value) =
      _$_UnifediApiInstancePollLimitsPleromaAdapter;
  const _UnifediApiInstancePollLimitsPleromaAdapter._() : super._();

  factory _UnifediApiInstancePollLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstancePollLimitsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstancePollLimits get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstancePollLimitsPleromaAdapterCopyWith<
          _UnifediApiInstancePollLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

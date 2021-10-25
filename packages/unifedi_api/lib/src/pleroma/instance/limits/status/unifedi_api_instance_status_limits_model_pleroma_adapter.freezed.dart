// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_status_limits_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceStatusLimitsPleromaAdapter
    _$UnifediApiInstanceStatusLimitsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceStatusLimitsPleromaAdapterTearOff {
  const _$UnifediApiInstanceStatusLimitsPleromaAdapterTearOff();

  _UnifediApiInstanceStatusLimitsPleromaAdapter call(
      @HiveField(0) PleromaApiInstance value) {
    return _UnifediApiInstanceStatusLimitsPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceStatusLimitsPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceStatusLimitsPleromaAdapter =
    _$UnifediApiInstanceStatusLimitsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceStatusLimitsPleromaAdapter {
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<
          UnifediApiInstanceStatusLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith(
          UnifediApiInstanceStatusLimitsPleromaAdapter value,
          $Res Function(UnifediApiInstanceStatusLimitsPleromaAdapter) then) =
      _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstance value});

  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstanceStatusLimitsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceStatusLimitsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance,
    ));
  }

  @override
  $PleromaApiInstanceCopyWith<$Res> get value {
    return $PleromaApiInstanceCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith(
          _UnifediApiInstanceStatusLimitsPleromaAdapter value,
          $Res Function(_UnifediApiInstanceStatusLimitsPleromaAdapter) then) =
      __$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstance value});

  @override
  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceStatusLimitsPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceStatusLimitsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstanceStatusLimitsPleromaAdapter));

  @override
  _UnifediApiInstanceStatusLimitsPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceStatusLimitsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceStatusLimitsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceStatusLimitsPleromaAdapter
    extends _UnifediApiInstanceStatusLimitsPleromaAdapter {
  const _$_UnifediApiInstanceStatusLimitsPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceStatusLimitsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstance value;

  @override
  String toString() {
    return 'UnifediApiInstanceStatusLimitsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceStatusLimitsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<
          _UnifediApiInstanceStatusLimitsPleromaAdapter>
      get copyWith =>
          __$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWithImpl<
              _UnifediApiInstanceStatusLimitsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceStatusLimitsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceStatusLimitsPleromaAdapter
    extends UnifediApiInstanceStatusLimitsPleromaAdapter {
  const factory _UnifediApiInstanceStatusLimitsPleromaAdapter(
          @HiveField(0) PleromaApiInstance value) =
      _$_UnifediApiInstanceStatusLimitsPleromaAdapter;
  const _UnifediApiInstanceStatusLimitsPleromaAdapter._() : super._();

  factory _UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceStatusLimitsPleromaAdapterCopyWith<
          _UnifediApiInstanceStatusLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

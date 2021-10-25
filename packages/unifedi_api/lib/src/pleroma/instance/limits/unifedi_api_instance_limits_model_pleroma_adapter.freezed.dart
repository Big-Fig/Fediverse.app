// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_limits_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceLimitsPleromaAdapter
    _$UnifediApiInstanceLimitsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceLimitsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceLimitsPleromaAdapterTearOff {
  const _$UnifediApiInstanceLimitsPleromaAdapterTearOff();

  _UnifediApiInstanceLimitsPleromaAdapter call(
      @HiveField(0) PleromaApiInstance value) {
    return _UnifediApiInstanceLimitsPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceLimitsPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiInstanceLimitsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceLimitsPleromaAdapter =
    _$UnifediApiInstanceLimitsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceLimitsPleromaAdapter {
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceLimitsPleromaAdapterCopyWith<
          UnifediApiInstanceLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceLimitsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceLimitsPleromaAdapterCopyWith(
          UnifediApiInstanceLimitsPleromaAdapter value,
          $Res Function(UnifediApiInstanceLimitsPleromaAdapter) then) =
      _$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstance value});

  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceLimitsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceLimitsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceLimitsPleromaAdapter) _then;

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
abstract class _$UnifediApiInstanceLimitsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceLimitsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceLimitsPleromaAdapterCopyWith(
          _UnifediApiInstanceLimitsPleromaAdapter value,
          $Res Function(_UnifediApiInstanceLimitsPleromaAdapter) then) =
      __$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstance value});

  @override
  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceLimitsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceLimitsPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceLimitsPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiInstanceLimitsPleromaAdapter));

  @override
  _UnifediApiInstanceLimitsPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceLimitsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceLimitsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceLimitsPleromaAdapter
    extends _UnifediApiInstanceLimitsPleromaAdapter {
  const _$_UnifediApiInstanceLimitsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceLimitsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstance value;

  @override
  String toString() {
    return 'UnifediApiInstanceLimitsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceLimitsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceLimitsPleromaAdapterCopyWith<
          _UnifediApiInstanceLimitsPleromaAdapter>
      get copyWith => __$UnifediApiInstanceLimitsPleromaAdapterCopyWithImpl<
          _UnifediApiInstanceLimitsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceLimitsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceLimitsPleromaAdapter
    extends UnifediApiInstanceLimitsPleromaAdapter {
  const factory _UnifediApiInstanceLimitsPleromaAdapter(
          @HiveField(0) PleromaApiInstance value) =
      _$_UnifediApiInstanceLimitsPleromaAdapter;
  const _UnifediApiInstanceLimitsPleromaAdapter._() : super._();

  factory _UnifediApiInstanceLimitsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceLimitsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceLimitsPleromaAdapterCopyWith<
          _UnifediApiInstanceLimitsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

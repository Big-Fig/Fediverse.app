// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_frontend_configurations_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFrontendConfigurationsPleromaAdapter
    _$UnifediApiFrontendConfigurationsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiFrontendConfigurationsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFrontendConfigurationsPleromaAdapterTearOff {
  const _$UnifediApiFrontendConfigurationsPleromaAdapterTearOff();

  _UnifediApiFrontendConfigurationsPleromaAdapter call(
      @HiveField(0) PleromaApiFrontendConfigurations value) {
    return _UnifediApiFrontendConfigurationsPleromaAdapter(
      value,
    );
  }

  UnifediApiFrontendConfigurationsPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiFrontendConfigurationsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFrontendConfigurationsPleromaAdapter =
    _$UnifediApiFrontendConfigurationsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFrontendConfigurationsPleromaAdapter {
  @HiveField(0)
  PleromaApiFrontendConfigurations get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<
          UnifediApiFrontendConfigurationsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiFrontendConfigurationsPleromaAdapterCopyWith(
          UnifediApiFrontendConfigurationsPleromaAdapter value,
          $Res Function(UnifediApiFrontendConfigurationsPleromaAdapter) then) =
      _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiFrontendConfigurations value});

  $PleromaApiFrontendConfigurationsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiFrontendConfigurationsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFrontendConfigurationsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurations,
    ));
  }

  @override
  $PleromaApiFrontendConfigurationsCopyWith<$Res> get value {
    return $PleromaApiFrontendConfigurationsCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWith(
          _UnifediApiFrontendConfigurationsPleromaAdapter value,
          $Res Function(_UnifediApiFrontendConfigurationsPleromaAdapter) then) =
      __$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiFrontendConfigurations value});

  @override
  $PleromaApiFrontendConfigurationsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl(
      _UnifediApiFrontendConfigurationsPleromaAdapter _value,
      $Res Function(_UnifediApiFrontendConfigurationsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiFrontendConfigurationsPleromaAdapter));

  @override
  _UnifediApiFrontendConfigurationsPleromaAdapter get _value =>
      super._value as _UnifediApiFrontendConfigurationsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFrontendConfigurationsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurations,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFrontendConfigurationsPleromaAdapter
    extends _UnifediApiFrontendConfigurationsPleromaAdapter {
  const _$_UnifediApiFrontendConfigurationsPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiFrontendConfigurationsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFrontendConfigurationsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiFrontendConfigurations value;

  @override
  String toString() {
    return 'UnifediApiFrontendConfigurationsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFrontendConfigurationsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<
          _UnifediApiFrontendConfigurationsPleromaAdapter>
      get copyWith =>
          __$UnifediApiFrontendConfigurationsPleromaAdapterCopyWithImpl<
                  _UnifediApiFrontendConfigurationsPleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFrontendConfigurationsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiFrontendConfigurationsPleromaAdapter
    extends UnifediApiFrontendConfigurationsPleromaAdapter {
  const factory _UnifediApiFrontendConfigurationsPleromaAdapter(
          @HiveField(0) PleromaApiFrontendConfigurations value) =
      _$_UnifediApiFrontendConfigurationsPleromaAdapter;
  const _UnifediApiFrontendConfigurationsPleromaAdapter._() : super._();

  factory _UnifediApiFrontendConfigurationsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiFrontendConfigurationsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiFrontendConfigurations get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFrontendConfigurationsPleromaAdapterCopyWith<
          _UnifediApiFrontendConfigurationsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_level_requirement_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessLevelRequirementPleromaAdapter
    _$UnifediApiAccessLevelRequirementPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessLevelRequirementPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessLevelRequirementPleromaAdapterTearOff {
  const _$UnifediApiAccessLevelRequirementPleromaAdapterTearOff();

  _UnifediApiAccessLevelRequirementPleromaAdapter call(
      @HiveField(0) PleromaApiAccessLevelRequirement value) {
    return _UnifediApiAccessLevelRequirementPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessLevelRequirementPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiAccessLevelRequirementPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessLevelRequirementPleromaAdapter =
    _$UnifediApiAccessLevelRequirementPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessLevelRequirementPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessLevelRequirement get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<
          UnifediApiAccessLevelRequirementPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessLevelRequirementPleromaAdapterCopyWith(
          UnifediApiAccessLevelRequirementPleromaAdapter value,
          $Res Function(UnifediApiAccessLevelRequirementPleromaAdapter) then) =
      _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessLevelRequirement value});

  $PleromaApiAccessLevelRequirementCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessLevelRequirementPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessLevelRequirementPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevelRequirement,
    ));
  }

  @override
  $PleromaApiAccessLevelRequirementCopyWith<$Res> get value {
    return $PleromaApiAccessLevelRequirementCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWith(
          _UnifediApiAccessLevelRequirementPleromaAdapter value,
          $Res Function(_UnifediApiAccessLevelRequirementPleromaAdapter) then) =
      __$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessLevelRequirement value});

  @override
  $PleromaApiAccessLevelRequirementCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl(
      _UnifediApiAccessLevelRequirementPleromaAdapter _value,
      $Res Function(_UnifediApiAccessLevelRequirementPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessLevelRequirementPleromaAdapter));

  @override
  _UnifediApiAccessLevelRequirementPleromaAdapter get _value =>
      super._value as _UnifediApiAccessLevelRequirementPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessLevelRequirementPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessLevelRequirement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessLevelRequirementPleromaAdapter
    extends _UnifediApiAccessLevelRequirementPleromaAdapter {
  const _$_UnifediApiAccessLevelRequirementPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessLevelRequirementPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessLevelRequirementPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessLevelRequirement value;

  @override
  String toString() {
    return 'UnifediApiAccessLevelRequirementPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessLevelRequirementPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<
          _UnifediApiAccessLevelRequirementPleromaAdapter>
      get copyWith =>
          __$UnifediApiAccessLevelRequirementPleromaAdapterCopyWithImpl<
                  _UnifediApiAccessLevelRequirementPleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessLevelRequirementPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessLevelRequirementPleromaAdapter
    extends UnifediApiAccessLevelRequirementPleromaAdapter {
  const factory _UnifediApiAccessLevelRequirementPleromaAdapter(
          @HiveField(0) PleromaApiAccessLevelRequirement value) =
      _$_UnifediApiAccessLevelRequirementPleromaAdapter;
  const _UnifediApiAccessLevelRequirementPleromaAdapter._() : super._();

  factory _UnifediApiAccessLevelRequirementPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessLevelRequirementPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessLevelRequirement get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessLevelRequirementPleromaAdapterCopyWith<
          _UnifediApiAccessLevelRequirementPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

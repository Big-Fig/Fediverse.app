// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_level_requirement_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessLevelRequirementMastodonAdapter
    _$UnifediApiAccessLevelRequirementMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessLevelRequirementMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessLevelRequirementMastodonAdapterTearOff {
  const _$UnifediApiAccessLevelRequirementMastodonAdapterTearOff();

  _UnifediApiAccessLevelRequirementMastodonAdapter call(
      @HiveField(0) MastodonApiAccessLevelRequirement value) {
    return _UnifediApiAccessLevelRequirementMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessLevelRequirementMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiAccessLevelRequirementMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessLevelRequirementMastodonAdapter =
    _$UnifediApiAccessLevelRequirementMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessLevelRequirementMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessLevelRequirement get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<
          UnifediApiAccessLevelRequirementMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessLevelRequirementMastodonAdapterCopyWith(
          UnifediApiAccessLevelRequirementMastodonAdapter value,
          $Res Function(UnifediApiAccessLevelRequirementMastodonAdapter) then) =
      _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessLevelRequirement value});

  $MastodonApiAccessLevelRequirementCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessLevelRequirementMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessLevelRequirementMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevelRequirement,
    ));
  }

  @override
  $MastodonApiAccessLevelRequirementCopyWith<$Res> get value {
    return $MastodonApiAccessLevelRequirementCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWith(
          _UnifediApiAccessLevelRequirementMastodonAdapter value,
          $Res Function(_UnifediApiAccessLevelRequirementMastodonAdapter)
              then) =
      __$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessLevelRequirement value});

  @override
  $MastodonApiAccessLevelRequirementCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl(
      _UnifediApiAccessLevelRequirementMastodonAdapter _value,
      $Res Function(_UnifediApiAccessLevelRequirementMastodonAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiAccessLevelRequirementMastodonAdapter));

  @override
  _UnifediApiAccessLevelRequirementMastodonAdapter get _value =>
      super._value as _UnifediApiAccessLevelRequirementMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessLevelRequirementMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevelRequirement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessLevelRequirementMastodonAdapter
    extends _UnifediApiAccessLevelRequirementMastodonAdapter {
  const _$_UnifediApiAccessLevelRequirementMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessLevelRequirementMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessLevelRequirementMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessLevelRequirement value;

  @override
  String toString() {
    return 'UnifediApiAccessLevelRequirementMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessLevelRequirementMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<
          _UnifediApiAccessLevelRequirementMastodonAdapter>
      get copyWith =>
          __$UnifediApiAccessLevelRequirementMastodonAdapterCopyWithImpl<
                  _UnifediApiAccessLevelRequirementMastodonAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessLevelRequirementMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessLevelRequirementMastodonAdapter
    extends UnifediApiAccessLevelRequirementMastodonAdapter {
  const factory _UnifediApiAccessLevelRequirementMastodonAdapter(
          @HiveField(0) MastodonApiAccessLevelRequirement value) =
      _$_UnifediApiAccessLevelRequirementMastodonAdapter;
  const _UnifediApiAccessLevelRequirementMastodonAdapter._() : super._();

  factory _UnifediApiAccessLevelRequirementMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessLevelRequirementMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessLevelRequirement get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessLevelRequirementMastodonAdapterCopyWith<
          _UnifediApiAccessLevelRequirementMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

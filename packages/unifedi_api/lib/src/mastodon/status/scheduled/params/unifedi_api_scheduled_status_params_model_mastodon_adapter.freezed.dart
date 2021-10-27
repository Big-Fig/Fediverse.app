// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_params_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatusParamsMastodonAdapter
    _$UnifediApiScheduledStatusParamsMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiScheduledStatusParamsMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsMastodonAdapterTearOff {
  const _$UnifediApiScheduledStatusParamsMastodonAdapterTearOff();

  _UnifediApiScheduledStatusParamsMastodonAdapter call(
      @HiveField(0) MastodonApiScheduledStatusParams value) {
    return _UnifediApiScheduledStatusParamsMastodonAdapter(
      value,
    );
  }

  UnifediApiScheduledStatusParamsMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiScheduledStatusParamsMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatusParamsMastodonAdapter =
    _$UnifediApiScheduledStatusParamsMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatusParamsMastodonAdapter {
  @HiveField(0)
  MastodonApiScheduledStatusParams get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<
          UnifediApiScheduledStatusParamsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiScheduledStatusParamsMastodonAdapterCopyWith(
          UnifediApiScheduledStatusParamsMastodonAdapter value,
          $Res Function(UnifediApiScheduledStatusParamsMastodonAdapter) then) =
      _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiScheduledStatusParams value});

  $MastodonApiScheduledStatusParamsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<$Res> {
  _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiScheduledStatusParamsMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatusParamsMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatusParams,
    ));
  }

  @override
  $MastodonApiScheduledStatusParamsCopyWith<$Res> get value {
    return $MastodonApiScheduledStatusParamsCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<$Res>
    implements $UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWith(
          _UnifediApiScheduledStatusParamsMastodonAdapter value,
          $Res Function(_UnifediApiScheduledStatusParamsMastodonAdapter) then) =
      __$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiScheduledStatusParams value});

  @override
  $MastodonApiScheduledStatusParamsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<$Res> {
  __$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl(
      _UnifediApiScheduledStatusParamsMastodonAdapter _value,
      $Res Function(_UnifediApiScheduledStatusParamsMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiScheduledStatusParamsMastodonAdapter));

  @override
  _UnifediApiScheduledStatusParamsMastodonAdapter get _value =>
      super._value as _UnifediApiScheduledStatusParamsMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiScheduledStatusParamsMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatusParams,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatusParamsMastodonAdapter
    extends _UnifediApiScheduledStatusParamsMastodonAdapter {
  const _$_UnifediApiScheduledStatusParamsMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiScheduledStatusParamsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusParamsMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiScheduledStatusParams value;

  @override
  String toString() {
    return 'UnifediApiScheduledStatusParamsMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiScheduledStatusParamsMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<
          _UnifediApiScheduledStatusParamsMastodonAdapter>
      get copyWith =>
          __$UnifediApiScheduledStatusParamsMastodonAdapterCopyWithImpl<
                  _UnifediApiScheduledStatusParamsMastodonAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusParamsMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiScheduledStatusParamsMastodonAdapter
    extends UnifediApiScheduledStatusParamsMastodonAdapter {
  const factory _UnifediApiScheduledStatusParamsMastodonAdapter(
          @HiveField(0) MastodonApiScheduledStatusParams value) =
      _$_UnifediApiScheduledStatusParamsMastodonAdapter;
  const _UnifediApiScheduledStatusParamsMastodonAdapter._() : super._();

  factory _UnifediApiScheduledStatusParamsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatusParamsMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiScheduledStatusParams get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusParamsMastodonAdapterCopyWith<
          _UnifediApiScheduledStatusParamsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

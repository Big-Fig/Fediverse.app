// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_version_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiVersionMastodonAdapter _$UnifediApiVersionMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiVersionMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiVersionMastodonAdapterTearOff {
  const _$UnifediApiVersionMastodonAdapterTearOff();

  _UnifediApiVersionMastodonAdapter call(
      @HiveField(0) MastodonApiVersion value) {
    return _UnifediApiVersionMastodonAdapter(
      value,
    );
  }

  UnifediApiVersionMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiVersionMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiVersionMastodonAdapter =
    _$UnifediApiVersionMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiVersionMastodonAdapter {
  @HiveField(0)
  MastodonApiVersion get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiVersionMastodonAdapterCopyWith<UnifediApiVersionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiVersionMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiVersionMastodonAdapterCopyWith(
          UnifediApiVersionMastodonAdapter value,
          $Res Function(UnifediApiVersionMastodonAdapter) then) =
      _$UnifediApiVersionMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiVersion value});

  $MastodonApiVersionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiVersionMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiVersionMastodonAdapterCopyWith<$Res> {
  _$UnifediApiVersionMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiVersionMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiVersionMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion,
    ));
  }

  @override
  $MastodonApiVersionCopyWith<$Res> get value {
    return $MastodonApiVersionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiVersionMastodonAdapterCopyWith<$Res>
    implements $UnifediApiVersionMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiVersionMastodonAdapterCopyWith(
          _UnifediApiVersionMastodonAdapter value,
          $Res Function(_UnifediApiVersionMastodonAdapter) then) =
      __$UnifediApiVersionMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiVersion value});

  @override
  $MastodonApiVersionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiVersionMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiVersionMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiVersionMastodonAdapterCopyWith<$Res> {
  __$UnifediApiVersionMastodonAdapterCopyWithImpl(
      _UnifediApiVersionMastodonAdapter _value,
      $Res Function(_UnifediApiVersionMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiVersionMastodonAdapter));

  @override
  _UnifediApiVersionMastodonAdapter get _value =>
      super._value as _UnifediApiVersionMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiVersionMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiVersionMastodonAdapter
    extends _UnifediApiVersionMastodonAdapter {
  const _$_UnifediApiVersionMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiVersionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiVersionMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiVersion value;

  @override
  String toString() {
    return 'UnifediApiVersionMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiVersionMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiVersionMastodonAdapterCopyWith<_UnifediApiVersionMastodonAdapter>
      get copyWith => __$UnifediApiVersionMastodonAdapterCopyWithImpl<
          _UnifediApiVersionMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiVersionMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiVersionMastodonAdapter
    extends UnifediApiVersionMastodonAdapter {
  const factory _UnifediApiVersionMastodonAdapter(
          @HiveField(0) MastodonApiVersion value) =
      _$_UnifediApiVersionMastodonAdapter;
  const _UnifediApiVersionMastodonAdapter._() : super._();

  factory _UnifediApiVersionMastodonAdapter.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiVersionMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiVersion get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiVersionMastodonAdapterCopyWith<_UnifediApiVersionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

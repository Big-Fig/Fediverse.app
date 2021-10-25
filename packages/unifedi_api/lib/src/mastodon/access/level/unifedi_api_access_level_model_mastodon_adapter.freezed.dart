// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_level_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessLevelMastodonAdapter
    _$UnifediApiAccessLevelMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessLevelMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessLevelMastodonAdapterTearOff {
  const _$UnifediApiAccessLevelMastodonAdapterTearOff();

  _UnifediApiAccessLevelMastodonAdapter call(
      @HiveField(0) MastodonApiAccessLevel value) {
    return _UnifediApiAccessLevelMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessLevelMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessLevelMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessLevelMastodonAdapter =
    _$UnifediApiAccessLevelMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessLevelMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessLevel get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessLevelMastodonAdapterCopyWith<
          UnifediApiAccessLevelMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessLevelMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessLevelMastodonAdapterCopyWith(
          UnifediApiAccessLevelMastodonAdapter value,
          $Res Function(UnifediApiAccessLevelMastodonAdapter) then) =
      _$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessLevel value});

  $MastodonApiAccessLevelCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessLevelMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessLevelMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessLevelMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessLevelMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevel,
    ));
  }

  @override
  $MastodonApiAccessLevelCopyWith<$Res> get value {
    return $MastodonApiAccessLevelCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessLevelMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessLevelMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessLevelMastodonAdapterCopyWith(
          _UnifediApiAccessLevelMastodonAdapter value,
          $Res Function(_UnifediApiAccessLevelMastodonAdapter) then) =
      __$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessLevel value});

  @override
  $MastodonApiAccessLevelCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessLevelMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessLevelMastodonAdapterCopyWithImpl(
      _UnifediApiAccessLevelMastodonAdapter _value,
      $Res Function(_UnifediApiAccessLevelMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessLevelMastodonAdapter));

  @override
  _UnifediApiAccessLevelMastodonAdapter get _value =>
      super._value as _UnifediApiAccessLevelMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessLevelMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessLevelMastodonAdapter
    extends _UnifediApiAccessLevelMastodonAdapter {
  const _$_UnifediApiAccessLevelMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessLevelMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessLevelMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessLevel value;

  @override
  String toString() {
    return 'UnifediApiAccessLevelMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessLevelMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessLevelMastodonAdapterCopyWith<
          _UnifediApiAccessLevelMastodonAdapter>
      get copyWith => __$UnifediApiAccessLevelMastodonAdapterCopyWithImpl<
          _UnifediApiAccessLevelMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessLevelMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessLevelMastodonAdapter
    extends UnifediApiAccessLevelMastodonAdapter {
  const factory _UnifediApiAccessLevelMastodonAdapter(
          @HiveField(0) MastodonApiAccessLevel value) =
      _$_UnifediApiAccessLevelMastodonAdapter;
  const _UnifediApiAccessLevelMastodonAdapter._() : super._();

  factory _UnifediApiAccessLevelMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessLevelMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessLevel get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessLevelMastodonAdapterCopyWith<
          _UnifediApiAccessLevelMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

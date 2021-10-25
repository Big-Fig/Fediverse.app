// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_stats_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceStatsMastodonAdapter
    _$UnifediApiInstanceStatsMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceStatsMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceStatsMastodonAdapterTearOff {
  const _$UnifediApiInstanceStatsMastodonAdapterTearOff();

  _UnifediApiInstanceStatsMastodonAdapter call(
      @HiveField(0) MastodonApiInstanceStats value) {
    return _UnifediApiInstanceStatsMastodonAdapter(
      value,
    );
  }

  UnifediApiInstanceStatsMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiInstanceStatsMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceStatsMastodonAdapter =
    _$UnifediApiInstanceStatsMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceStatsMastodonAdapter {
  @HiveField(0)
  MastodonApiInstanceStats get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceStatsMastodonAdapterCopyWith<
          UnifediApiInstanceStatsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceStatsMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceStatsMastodonAdapterCopyWith(
          UnifediApiInstanceStatsMastodonAdapter value,
          $Res Function(UnifediApiInstanceStatsMastodonAdapter) then) =
      _$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiInstanceStats value});

  $MastodonApiInstanceStatsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceStatsMastodonAdapterCopyWith<$Res> {
  _$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceStatsMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceStatsMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceStats,
    ));
  }

  @override
  $MastodonApiInstanceStatsCopyWith<$Res> get value {
    return $MastodonApiInstanceStatsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceStatsMastodonAdapterCopyWith<$Res>
    implements $UnifediApiInstanceStatsMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceStatsMastodonAdapterCopyWith(
          _UnifediApiInstanceStatsMastodonAdapter value,
          $Res Function(_UnifediApiInstanceStatsMastodonAdapter) then) =
      __$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiInstanceStats value});

  @override
  $MastodonApiInstanceStatsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceStatsMastodonAdapterCopyWith<$Res> {
  __$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl(
      _UnifediApiInstanceStatsMastodonAdapter _value,
      $Res Function(_UnifediApiInstanceStatsMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiInstanceStatsMastodonAdapter));

  @override
  _UnifediApiInstanceStatsMastodonAdapter get _value =>
      super._value as _UnifediApiInstanceStatsMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceStatsMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceStatsMastodonAdapter
    extends _UnifediApiInstanceStatsMastodonAdapter {
  const _$_UnifediApiInstanceStatsMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceStatsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceStatsMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiInstanceStats value;

  @override
  String toString() {
    return 'UnifediApiInstanceStatsMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceStatsMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceStatsMastodonAdapterCopyWith<
          _UnifediApiInstanceStatsMastodonAdapter>
      get copyWith => __$UnifediApiInstanceStatsMastodonAdapterCopyWithImpl<
          _UnifediApiInstanceStatsMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceStatsMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceStatsMastodonAdapter
    extends UnifediApiInstanceStatsMastodonAdapter {
  const factory _UnifediApiInstanceStatsMastodonAdapter(
          @HiveField(0) MastodonApiInstanceStats value) =
      _$_UnifediApiInstanceStatsMastodonAdapter;
  const _UnifediApiInstanceStatsMastodonAdapter._() : super._();

  factory _UnifediApiInstanceStatsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceStatsMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiInstanceStats get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceStatsMastodonAdapterCopyWith<
          _UnifediApiInstanceStatsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

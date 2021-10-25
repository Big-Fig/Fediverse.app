// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_filter_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFilterMastodonAdapter _$UnifediApiFilterMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFilterMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFilterMastodonAdapterTearOff {
  const _$UnifediApiFilterMastodonAdapterTearOff();

  _UnifediApiFilterMastodonAdapter call(@HiveField(0) MastodonApiFilter value) {
    return _UnifediApiFilterMastodonAdapter(
      value,
    );
  }

  UnifediApiFilterMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFilterMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFilterMastodonAdapter =
    _$UnifediApiFilterMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFilterMastodonAdapter {
  @HiveField(0)
  MastodonApiFilter get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFilterMastodonAdapterCopyWith<UnifediApiFilterMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFilterMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiFilterMastodonAdapterCopyWith(
          UnifediApiFilterMastodonAdapter value,
          $Res Function(UnifediApiFilterMastodonAdapter) then) =
      _$UnifediApiFilterMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiFilter value});

  $MastodonApiFilterCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFilterMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiFilterMastodonAdapterCopyWith<$Res> {
  _$UnifediApiFilterMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFilterMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFilterMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiFilter,
    ));
  }

  @override
  $MastodonApiFilterCopyWith<$Res> get value {
    return $MastodonApiFilterCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFilterMastodonAdapterCopyWith<$Res>
    implements $UnifediApiFilterMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiFilterMastodonAdapterCopyWith(
          _UnifediApiFilterMastodonAdapter value,
          $Res Function(_UnifediApiFilterMastodonAdapter) then) =
      __$UnifediApiFilterMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiFilter value});

  @override
  $MastodonApiFilterCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFilterMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFilterMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFilterMastodonAdapterCopyWith<$Res> {
  __$UnifediApiFilterMastodonAdapterCopyWithImpl(
      _UnifediApiFilterMastodonAdapter _value,
      $Res Function(_UnifediApiFilterMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFilterMastodonAdapter));

  @override
  _UnifediApiFilterMastodonAdapter get _value =>
      super._value as _UnifediApiFilterMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFilterMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiFilter,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFilterMastodonAdapter
    extends _UnifediApiFilterMastodonAdapter {
  const _$_UnifediApiFilterMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiFilterMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFilterMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiFilter value;

  @override
  String toString() {
    return 'UnifediApiFilterMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFilterMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFilterMastodonAdapterCopyWith<_UnifediApiFilterMastodonAdapter>
      get copyWith => __$UnifediApiFilterMastodonAdapterCopyWithImpl<
          _UnifediApiFilterMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFilterMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiFilterMastodonAdapter
    extends UnifediApiFilterMastodonAdapter {
  const factory _UnifediApiFilterMastodonAdapter(
          @HiveField(0) MastodonApiFilter value) =
      _$_UnifediApiFilterMastodonAdapter;
  const _UnifediApiFilterMastodonAdapter._() : super._();

  factory _UnifediApiFilterMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFilterMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiFilter get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFilterMastodonAdapterCopyWith<_UnifediApiFilterMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

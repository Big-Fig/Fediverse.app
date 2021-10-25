// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_version_range_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiVersionRangeMastodonAdapter
    _$UnifediApiVersionRangeMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiVersionRangeMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiVersionRangeMastodonAdapterTearOff {
  const _$UnifediApiVersionRangeMastodonAdapterTearOff();

  _UnifediApiVersionRangeMastodonAdapter call(
      @HiveField(0) MastodonApiVersionRange value) {
    return _UnifediApiVersionRangeMastodonAdapter(
      value,
    );
  }

  UnifediApiVersionRangeMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiVersionRangeMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiVersionRangeMastodonAdapter =
    _$UnifediApiVersionRangeMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiVersionRangeMastodonAdapter {
  @HiveField(0)
  MastodonApiVersionRange get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiVersionRangeMastodonAdapterCopyWith<
          UnifediApiVersionRangeMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiVersionRangeMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiVersionRangeMastodonAdapterCopyWith(
          UnifediApiVersionRangeMastodonAdapter value,
          $Res Function(UnifediApiVersionRangeMastodonAdapter) then) =
      _$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiVersionRange value});

  $MastodonApiVersionRangeCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiVersionRangeMastodonAdapterCopyWith<$Res> {
  _$UnifediApiVersionRangeMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiVersionRangeMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiVersionRangeMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersionRange,
    ));
  }

  @override
  $MastodonApiVersionRangeCopyWith<$Res> get value {
    return $MastodonApiVersionRangeCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiVersionRangeMastodonAdapterCopyWith<$Res>
    implements $UnifediApiVersionRangeMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiVersionRangeMastodonAdapterCopyWith(
          _UnifediApiVersionRangeMastodonAdapter value,
          $Res Function(_UnifediApiVersionRangeMastodonAdapter) then) =
      __$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiVersionRange value});

  @override
  $MastodonApiVersionRangeCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiVersionRangeMastodonAdapterCopyWith<$Res> {
  __$UnifediApiVersionRangeMastodonAdapterCopyWithImpl(
      _UnifediApiVersionRangeMastodonAdapter _value,
      $Res Function(_UnifediApiVersionRangeMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiVersionRangeMastodonAdapter));

  @override
  _UnifediApiVersionRangeMastodonAdapter get _value =>
      super._value as _UnifediApiVersionRangeMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiVersionRangeMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersionRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiVersionRangeMastodonAdapter
    extends _UnifediApiVersionRangeMastodonAdapter {
  const _$_UnifediApiVersionRangeMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiVersionRangeMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiVersionRangeMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiVersionRange value;

  @override
  String toString() {
    return 'UnifediApiVersionRangeMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiVersionRangeMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiVersionRangeMastodonAdapterCopyWith<
          _UnifediApiVersionRangeMastodonAdapter>
      get copyWith => __$UnifediApiVersionRangeMastodonAdapterCopyWithImpl<
          _UnifediApiVersionRangeMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiVersionRangeMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiVersionRangeMastodonAdapter
    extends UnifediApiVersionRangeMastodonAdapter {
  const factory _UnifediApiVersionRangeMastodonAdapter(
          @HiveField(0) MastodonApiVersionRange value) =
      _$_UnifediApiVersionRangeMastodonAdapter;
  const _UnifediApiVersionRangeMastodonAdapter._() : super._();

  factory _UnifediApiVersionRangeMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiVersionRangeMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiVersionRange get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiVersionRangeMastodonAdapterCopyWith<
          _UnifediApiVersionRangeMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

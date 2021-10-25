// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_marker_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMarkerMastodonAdapter _$UnifediApiMarkerMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMarkerMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMarkerMastodonAdapterTearOff {
  const _$UnifediApiMarkerMastodonAdapterTearOff();

  _UnifediApiMarkerMastodonAdapter call(@HiveField(0) MastodonApiMarker value) {
    return _UnifediApiMarkerMastodonAdapter(
      value,
    );
  }

  UnifediApiMarkerMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiMarkerMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMarkerMastodonAdapter =
    _$UnifediApiMarkerMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMarkerMastodonAdapter {
  @HiveField(0)
  MastodonApiMarker get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMarkerMastodonAdapterCopyWith<UnifediApiMarkerMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMarkerMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMarkerMastodonAdapterCopyWith(
          UnifediApiMarkerMastodonAdapter value,
          $Res Function(UnifediApiMarkerMastodonAdapter) then) =
      _$UnifediApiMarkerMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMarker value});

  $MastodonApiMarkerCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMarkerMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMarkerMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMarkerMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMarkerMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMarkerMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMarker,
    ));
  }

  @override
  $MastodonApiMarkerCopyWith<$Res> get value {
    return $MastodonApiMarkerCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMarkerMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMarkerMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMarkerMastodonAdapterCopyWith(
          _UnifediApiMarkerMastodonAdapter value,
          $Res Function(_UnifediApiMarkerMastodonAdapter) then) =
      __$UnifediApiMarkerMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMarker value});

  @override
  $MastodonApiMarkerCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMarkerMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMarkerMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMarkerMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMarkerMastodonAdapterCopyWithImpl(
      _UnifediApiMarkerMastodonAdapter _value,
      $Res Function(_UnifediApiMarkerMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMarkerMastodonAdapter));

  @override
  _UnifediApiMarkerMastodonAdapter get _value =>
      super._value as _UnifediApiMarkerMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMarkerMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMarker,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMarkerMastodonAdapter
    extends _UnifediApiMarkerMastodonAdapter {
  const _$_UnifediApiMarkerMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMarkerMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMarkerMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMarker value;

  @override
  String toString() {
    return 'UnifediApiMarkerMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMarkerMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMarkerMastodonAdapterCopyWith<_UnifediApiMarkerMastodonAdapter>
      get copyWith => __$UnifediApiMarkerMastodonAdapterCopyWithImpl<
          _UnifediApiMarkerMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMarkerMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMarkerMastodonAdapter
    extends UnifediApiMarkerMastodonAdapter {
  const factory _UnifediApiMarkerMastodonAdapter(
          @HiveField(0) MastodonApiMarker value) =
      _$_UnifediApiMarkerMastodonAdapter;
  const _UnifediApiMarkerMastodonAdapter._() : super._();

  factory _UnifediApiMarkerMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMarkerMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMarker get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMarkerMastodonAdapterCopyWith<_UnifediApiMarkerMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

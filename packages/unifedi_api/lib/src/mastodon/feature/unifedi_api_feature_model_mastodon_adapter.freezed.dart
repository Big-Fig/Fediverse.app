// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_feature_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFeatureMastodonAdapter _$UnifediApiFeatureMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFeatureMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFeatureMastodonAdapterTearOff {
  const _$UnifediApiFeatureMastodonAdapterTearOff();

  _UnifediApiFeatureMastodonAdapter call(
      @HiveField(0) MastodonApiFeature value) {
    return _UnifediApiFeatureMastodonAdapter(
      value,
    );
  }

  UnifediApiFeatureMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFeatureMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFeatureMastodonAdapter =
    _$UnifediApiFeatureMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFeatureMastodonAdapter {
  @HiveField(0)
  MastodonApiFeature get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFeatureMastodonAdapterCopyWith<UnifediApiFeatureMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFeatureMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiFeatureMastodonAdapterCopyWith(
          UnifediApiFeatureMastodonAdapter value,
          $Res Function(UnifediApiFeatureMastodonAdapter) then) =
      _$UnifediApiFeatureMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiFeature value});

  $MastodonApiFeatureCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFeatureMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiFeatureMastodonAdapterCopyWith<$Res> {
  _$UnifediApiFeatureMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFeatureMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFeatureMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiFeature,
    ));
  }

  @override
  $MastodonApiFeatureCopyWith<$Res> get value {
    return $MastodonApiFeatureCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFeatureMastodonAdapterCopyWith<$Res>
    implements $UnifediApiFeatureMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiFeatureMastodonAdapterCopyWith(
          _UnifediApiFeatureMastodonAdapter value,
          $Res Function(_UnifediApiFeatureMastodonAdapter) then) =
      __$UnifediApiFeatureMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiFeature value});

  @override
  $MastodonApiFeatureCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFeatureMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFeatureMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFeatureMastodonAdapterCopyWith<$Res> {
  __$UnifediApiFeatureMastodonAdapterCopyWithImpl(
      _UnifediApiFeatureMastodonAdapter _value,
      $Res Function(_UnifediApiFeatureMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFeatureMastodonAdapter));

  @override
  _UnifediApiFeatureMastodonAdapter get _value =>
      super._value as _UnifediApiFeatureMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFeatureMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiFeature,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFeatureMastodonAdapter
    extends _UnifediApiFeatureMastodonAdapter {
  const _$_UnifediApiFeatureMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiFeatureMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFeatureMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiFeature value;

  @override
  String toString() {
    return 'UnifediApiFeatureMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFeatureMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFeatureMastodonAdapterCopyWith<_UnifediApiFeatureMastodonAdapter>
      get copyWith => __$UnifediApiFeatureMastodonAdapterCopyWithImpl<
          _UnifediApiFeatureMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFeatureMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiFeatureMastodonAdapter
    extends UnifediApiFeatureMastodonAdapter {
  const factory _UnifediApiFeatureMastodonAdapter(
          @HiveField(0) MastodonApiFeature value) =
      _$_UnifediApiFeatureMastodonAdapter;
  const _UnifediApiFeatureMastodonAdapter._() : super._();

  factory _UnifediApiFeatureMastodonAdapter.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiFeatureMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiFeature get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFeatureMastodonAdapterCopyWith<_UnifediApiFeatureMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_token_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessTokenMastodonAdapter
    _$UnifediApiAccessTokenMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessTokenMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessTokenMastodonAdapterTearOff {
  const _$UnifediApiAccessTokenMastodonAdapterTearOff();

  _UnifediApiAccessTokenMastodonAdapter call(
      @HiveField(0) MastodonApiAccessToken value) {
    return _UnifediApiAccessTokenMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessTokenMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccessTokenMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessTokenMastodonAdapter =
    _$UnifediApiAccessTokenMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessTokenMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessTokenMastodonAdapterCopyWith<
          UnifediApiAccessTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessTokenMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessTokenMastodonAdapterCopyWith(
          UnifediApiAccessTokenMastodonAdapter value,
          $Res Function(UnifediApiAccessTokenMastodonAdapter) then) =
      _$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessToken value});

  $MastodonApiAccessTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessTokenMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessTokenMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessTokenMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessTokenMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessToken,
    ));
  }

  @override
  $MastodonApiAccessTokenCopyWith<$Res> get value {
    return $MastodonApiAccessTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessTokenMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessTokenMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessTokenMastodonAdapterCopyWith(
          _UnifediApiAccessTokenMastodonAdapter value,
          $Res Function(_UnifediApiAccessTokenMastodonAdapter) then) =
      __$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessToken value});

  @override
  $MastodonApiAccessTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessTokenMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessTokenMastodonAdapterCopyWithImpl(
      _UnifediApiAccessTokenMastodonAdapter _value,
      $Res Function(_UnifediApiAccessTokenMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessTokenMastodonAdapter));

  @override
  _UnifediApiAccessTokenMastodonAdapter get _value =>
      super._value as _UnifediApiAccessTokenMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessTokenMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessTokenMastodonAdapter
    extends _UnifediApiAccessTokenMastodonAdapter {
  const _$_UnifediApiAccessTokenMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessTokenMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessToken value;

  @override
  String toString() {
    return 'UnifediApiAccessTokenMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessTokenMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessTokenMastodonAdapterCopyWith<
          _UnifediApiAccessTokenMastodonAdapter>
      get copyWith => __$UnifediApiAccessTokenMastodonAdapterCopyWithImpl<
          _UnifediApiAccessTokenMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessTokenMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessTokenMastodonAdapter
    extends UnifediApiAccessTokenMastodonAdapter {
  const factory _UnifediApiAccessTokenMastodonAdapter(
          @HiveField(0) MastodonApiAccessToken value) =
      _$_UnifediApiAccessTokenMastodonAdapter;
  const _UnifediApiAccessTokenMastodonAdapter._() : super._();

  factory _UnifediApiAccessTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessTokenMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessToken get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessTokenMastodonAdapterCopyWith<
          _UnifediApiAccessTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

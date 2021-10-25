// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_oauth_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiOAuthTokenMastodonAdapter
    _$UnifediApiOAuthTokenMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiOAuthTokenMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiOAuthTokenMastodonAdapterTearOff {
  const _$UnifediApiOAuthTokenMastodonAdapterTearOff();

  _UnifediApiOAuthTokenMastodonAdapter call(
      @HiveField(0) MastodonApiOAuthToken value) {
    return _UnifediApiOAuthTokenMastodonAdapter(
      value,
    );
  }

  UnifediApiOAuthTokenMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiOAuthTokenMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiOAuthTokenMastodonAdapter =
    _$UnifediApiOAuthTokenMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiOAuthTokenMastodonAdapter {
  @HiveField(0)
  MastodonApiOAuthToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiOAuthTokenMastodonAdapterCopyWith<
          UnifediApiOAuthTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiOAuthTokenMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiOAuthTokenMastodonAdapterCopyWith(
          UnifediApiOAuthTokenMastodonAdapter value,
          $Res Function(UnifediApiOAuthTokenMastodonAdapter) then) =
      _$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiOAuthToken value});

  $MastodonApiOAuthTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiOAuthTokenMastodonAdapterCopyWith<$Res> {
  _$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiOAuthTokenMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiOAuthTokenMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
    ));
  }

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get value {
    return $MastodonApiOAuthTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiOAuthTokenMastodonAdapterCopyWith<$Res>
    implements $UnifediApiOAuthTokenMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiOAuthTokenMastodonAdapterCopyWith(
          _UnifediApiOAuthTokenMastodonAdapter value,
          $Res Function(_UnifediApiOAuthTokenMastodonAdapter) then) =
      __$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiOAuthToken value});

  @override
  $MastodonApiOAuthTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiOAuthTokenMastodonAdapterCopyWith<$Res> {
  __$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl(
      _UnifediApiOAuthTokenMastodonAdapter _value,
      $Res Function(_UnifediApiOAuthTokenMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiOAuthTokenMastodonAdapter));

  @override
  _UnifediApiOAuthTokenMastodonAdapter get _value =>
      super._value as _UnifediApiOAuthTokenMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiOAuthTokenMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiOAuthToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiOAuthTokenMastodonAdapter
    extends _UnifediApiOAuthTokenMastodonAdapter {
  const _$_UnifediApiOAuthTokenMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiOAuthTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiOAuthTokenMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiOAuthToken value;

  @override
  String toString() {
    return 'UnifediApiOAuthTokenMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiOAuthTokenMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiOAuthTokenMastodonAdapterCopyWith<
          _UnifediApiOAuthTokenMastodonAdapter>
      get copyWith => __$UnifediApiOAuthTokenMastodonAdapterCopyWithImpl<
          _UnifediApiOAuthTokenMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiOAuthTokenMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiOAuthTokenMastodonAdapter
    extends UnifediApiOAuthTokenMastodonAdapter {
  const factory _UnifediApiOAuthTokenMastodonAdapter(
          @HiveField(0) MastodonApiOAuthToken value) =
      _$_UnifediApiOAuthTokenMastodonAdapter;
  const _UnifediApiOAuthTokenMastodonAdapter._() : super._();

  factory _UnifediApiOAuthTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiOAuthTokenMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiOAuthToken get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiOAuthTokenMastodonAdapterCopyWith<
          _UnifediApiOAuthTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_user_token_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessUserTokenMastodonAdapter
    _$UnifediApiAccessUserTokenMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessUserTokenMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessUserTokenMastodonAdapterTearOff {
  const _$UnifediApiAccessUserTokenMastodonAdapterTearOff();

  _UnifediApiAccessUserTokenMastodonAdapter call(
      @HiveField(0) MastodonApiAccessUserToken value) {
    return _UnifediApiAccessUserTokenMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessUserTokenMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessUserTokenMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessUserTokenMastodonAdapter =
    _$UnifediApiAccessUserTokenMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessUserTokenMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessUserToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessUserTokenMastodonAdapterCopyWith<
          UnifediApiAccessUserTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessUserTokenMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessUserTokenMastodonAdapterCopyWith(
          UnifediApiAccessUserTokenMastodonAdapter value,
          $Res Function(UnifediApiAccessUserTokenMastodonAdapter) then) =
      _$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessUserToken value});

  $MastodonApiAccessUserTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessUserTokenMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessUserTokenMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessUserTokenMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessUserToken,
    ));
  }

  @override
  $MastodonApiAccessUserTokenCopyWith<$Res> get value {
    return $MastodonApiAccessUserTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessUserTokenMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessUserTokenMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessUserTokenMastodonAdapterCopyWith(
          _UnifediApiAccessUserTokenMastodonAdapter value,
          $Res Function(_UnifediApiAccessUserTokenMastodonAdapter) then) =
      __$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessUserToken value});

  @override
  $MastodonApiAccessUserTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessUserTokenMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl(
      _UnifediApiAccessUserTokenMastodonAdapter _value,
      $Res Function(_UnifediApiAccessUserTokenMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessUserTokenMastodonAdapter));

  @override
  _UnifediApiAccessUserTokenMastodonAdapter get _value =>
      super._value as _UnifediApiAccessUserTokenMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessUserTokenMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessUserToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessUserTokenMastodonAdapter
    extends _UnifediApiAccessUserTokenMastodonAdapter {
  const _$_UnifediApiAccessUserTokenMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessUserTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessUserTokenMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessUserToken value;

  @override
  String toString() {
    return 'UnifediApiAccessUserTokenMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessUserTokenMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessUserTokenMastodonAdapterCopyWith<
          _UnifediApiAccessUserTokenMastodonAdapter>
      get copyWith => __$UnifediApiAccessUserTokenMastodonAdapterCopyWithImpl<
          _UnifediApiAccessUserTokenMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessUserTokenMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessUserTokenMastodonAdapter
    extends UnifediApiAccessUserTokenMastodonAdapter {
  const factory _UnifediApiAccessUserTokenMastodonAdapter(
          @HiveField(0) MastodonApiAccessUserToken value) =
      _$_UnifediApiAccessUserTokenMastodonAdapter;
  const _UnifediApiAccessUserTokenMastodonAdapter._() : super._();

  factory _UnifediApiAccessUserTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessUserTokenMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessUserToken get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessUserTokenMastodonAdapterCopyWith<
          _UnifediApiAccessUserTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

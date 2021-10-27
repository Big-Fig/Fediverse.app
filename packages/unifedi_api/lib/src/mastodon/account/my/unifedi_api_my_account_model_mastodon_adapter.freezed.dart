// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_my_account_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMyAccountMastodonAdapter _$UnifediApiMyAccountMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMyAccountMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMyAccountMastodonAdapterTearOff {
  const _$UnifediApiMyAccountMastodonAdapterTearOff();

  _UnifediApiMyAccountMastodonAdapter call(
      @HiveField(0) MastodonApiMyAccount value) {
    return _UnifediApiMyAccountMastodonAdapter(
      value,
    );
  }

  UnifediApiMyAccountMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiMyAccountMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMyAccountMastodonAdapter =
    _$UnifediApiMyAccountMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMyAccountMastodonAdapter {
  @HiveField(0)
  MastodonApiMyAccount get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMyAccountMastodonAdapterCopyWith<
          UnifediApiMyAccountMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMyAccountMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMyAccountMastodonAdapterCopyWith(
          UnifediApiMyAccountMastodonAdapter value,
          $Res Function(UnifediApiMyAccountMastodonAdapter) then) =
      _$UnifediApiMyAccountMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMyAccount value});

  $MastodonApiMyAccountCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMyAccountMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMyAccountMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMyAccountMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMyAccountMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMyAccountMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccount,
    ));
  }

  @override
  $MastodonApiMyAccountCopyWith<$Res> get value {
    return $MastodonApiMyAccountCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMyAccountMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMyAccountMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMyAccountMastodonAdapterCopyWith(
          _UnifediApiMyAccountMastodonAdapter value,
          $Res Function(_UnifediApiMyAccountMastodonAdapter) then) =
      __$UnifediApiMyAccountMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMyAccount value});

  @override
  $MastodonApiMyAccountCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMyAccountMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMyAccountMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMyAccountMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMyAccountMastodonAdapterCopyWithImpl(
      _UnifediApiMyAccountMastodonAdapter _value,
      $Res Function(_UnifediApiMyAccountMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMyAccountMastodonAdapter));

  @override
  _UnifediApiMyAccountMastodonAdapter get _value =>
      super._value as _UnifediApiMyAccountMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMyAccountMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMyAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMyAccountMastodonAdapter
    extends _UnifediApiMyAccountMastodonAdapter {
  const _$_UnifediApiMyAccountMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMyAccountMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMyAccountMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMyAccount value;

  @override
  String toString() {
    return 'UnifediApiMyAccountMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMyAccountMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMyAccountMastodonAdapterCopyWith<
          _UnifediApiMyAccountMastodonAdapter>
      get copyWith => __$UnifediApiMyAccountMastodonAdapterCopyWithImpl<
          _UnifediApiMyAccountMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMyAccountMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMyAccountMastodonAdapter
    extends UnifediApiMyAccountMastodonAdapter {
  const factory _UnifediApiMyAccountMastodonAdapter(
          @HiveField(0) MastodonApiMyAccount value) =
      _$_UnifediApiMyAccountMastodonAdapter;
  const _UnifediApiMyAccountMastodonAdapter._() : super._();

  factory _UnifediApiMyAccountMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMyAccountMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMyAccount get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMyAccountMastodonAdapterCopyWith<
          _UnifediApiMyAccountMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

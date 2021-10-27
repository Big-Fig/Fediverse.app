// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountMastodonAdapter _$UnifediApiAccountMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccountMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountMastodonAdapterTearOff {
  const _$UnifediApiAccountMastodonAdapterTearOff();

  _UnifediApiAccountMastodonAdapter call(
      @HiveField(0) MastodonApiAccount value) {
    return _UnifediApiAccountMastodonAdapter(
      value,
    );
  }

  UnifediApiAccountMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccountMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountMastodonAdapter =
    _$UnifediApiAccountMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountMastodonAdapter {
  @HiveField(0)
  MastodonApiAccount get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountMastodonAdapterCopyWith<UnifediApiAccountMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccountMastodonAdapterCopyWith(
          UnifediApiAccountMastodonAdapter value,
          $Res Function(UnifediApiAccountMastodonAdapter) then) =
      _$UnifediApiAccountMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccount value});

  $MastodonApiAccountCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccountMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccountMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount,
    ));
  }

  @override
  $MastodonApiAccountCopyWith<$Res> get value {
    return $MastodonApiAccountCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccountMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountMastodonAdapterCopyWith(
          _UnifediApiAccountMastodonAdapter value,
          $Res Function(_UnifediApiAccountMastodonAdapter) then) =
      __$UnifediApiAccountMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccount value});

  @override
  $MastodonApiAccountCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccountMastodonAdapterCopyWithImpl(
      _UnifediApiAccountMastodonAdapter _value,
      $Res Function(_UnifediApiAccountMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccountMastodonAdapter));

  @override
  _UnifediApiAccountMastodonAdapter get _value =>
      super._value as _UnifediApiAccountMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountMastodonAdapter
    extends _UnifediApiAccountMastodonAdapter {
  const _$_UnifediApiAccountMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccount value;

  @override
  String toString() {
    return 'UnifediApiAccountMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccountMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountMastodonAdapterCopyWith<_UnifediApiAccountMastodonAdapter>
      get copyWith => __$UnifediApiAccountMastodonAdapterCopyWithImpl<
          _UnifediApiAccountMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountMastodonAdapter
    extends UnifediApiAccountMastodonAdapter {
  const factory _UnifediApiAccountMastodonAdapter(
          @HiveField(0) MastodonApiAccount value) =
      _$_UnifediApiAccountMastodonAdapter;
  const _UnifediApiAccountMastodonAdapter._() : super._();

  factory _UnifediApiAccountMastodonAdapter.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiAccountMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccount get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountMastodonAdapterCopyWith<_UnifediApiAccountMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

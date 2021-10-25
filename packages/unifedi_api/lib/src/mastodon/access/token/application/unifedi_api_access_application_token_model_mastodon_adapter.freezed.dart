// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_application_token_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessApplicationTokenMastodonAdapter
    _$UnifediApiAccessApplicationTokenMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessApplicationTokenMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenMastodonAdapterTearOff {
  const _$UnifediApiAccessApplicationTokenMastodonAdapterTearOff();

  _UnifediApiAccessApplicationTokenMastodonAdapter call(
      @HiveField(0) MastodonApiAccessApplicationToken value) {
    return _UnifediApiAccessApplicationTokenMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessApplicationTokenMastodonAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiAccessApplicationTokenMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessApplicationTokenMastodonAdapter =
    _$UnifediApiAccessApplicationTokenMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessApplicationTokenMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessApplicationToken get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<
          UnifediApiAccessApplicationTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessApplicationTokenMastodonAdapterCopyWith(
          UnifediApiAccessApplicationTokenMastodonAdapter value,
          $Res Function(UnifediApiAccessApplicationTokenMastodonAdapter) then) =
      _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessApplicationToken value});

  $MastodonApiAccessApplicationTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessApplicationTokenMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessApplicationTokenMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessApplicationToken,
    ));
  }

  @override
  $MastodonApiAccessApplicationTokenCopyWith<$Res> get value {
    return $MastodonApiAccessApplicationTokenCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWith(
          _UnifediApiAccessApplicationTokenMastodonAdapter value,
          $Res Function(_UnifediApiAccessApplicationTokenMastodonAdapter)
              then) =
      __$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessApplicationToken value});

  @override
  $MastodonApiAccessApplicationTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl(
      _UnifediApiAccessApplicationTokenMastodonAdapter _value,
      $Res Function(_UnifediApiAccessApplicationTokenMastodonAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiAccessApplicationTokenMastodonAdapter));

  @override
  _UnifediApiAccessApplicationTokenMastodonAdapter get _value =>
      super._value as _UnifediApiAccessApplicationTokenMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessApplicationTokenMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessApplicationToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessApplicationTokenMastodonAdapter
    extends _UnifediApiAccessApplicationTokenMastodonAdapter {
  const _$_UnifediApiAccessApplicationTokenMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessApplicationTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessApplicationTokenMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessApplicationToken value;

  @override
  String toString() {
    return 'UnifediApiAccessApplicationTokenMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessApplicationTokenMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<
          _UnifediApiAccessApplicationTokenMastodonAdapter>
      get copyWith =>
          __$UnifediApiAccessApplicationTokenMastodonAdapterCopyWithImpl<
                  _UnifediApiAccessApplicationTokenMastodonAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessApplicationTokenMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessApplicationTokenMastodonAdapter
    extends UnifediApiAccessApplicationTokenMastodonAdapter {
  const factory _UnifediApiAccessApplicationTokenMastodonAdapter(
          @HiveField(0) MastodonApiAccessApplicationToken value) =
      _$_UnifediApiAccessApplicationTokenMastodonAdapter;
  const _UnifediApiAccessApplicationTokenMastodonAdapter._() : super._();

  factory _UnifediApiAccessApplicationTokenMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessApplicationTokenMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessApplicationToken get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessApplicationTokenMastodonAdapterCopyWith<
          _UnifediApiAccessApplicationTokenMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

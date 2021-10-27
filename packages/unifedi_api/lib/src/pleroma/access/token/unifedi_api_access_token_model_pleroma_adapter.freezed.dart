// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_token_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessTokenPleromaAdapter
    _$UnifediApiAccessTokenPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessTokenPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessTokenPleromaAdapterTearOff {
  const _$UnifediApiAccessTokenPleromaAdapterTearOff();

  _UnifediApiAccessTokenPleromaAdapter call(
      @HiveField(0) PleromaApiAccessToken value) {
    return _UnifediApiAccessTokenPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessTokenPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccessTokenPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessTokenPleromaAdapter =
    _$UnifediApiAccessTokenPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessTokenPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessTokenPleromaAdapterCopyWith<
          UnifediApiAccessTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessTokenPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessTokenPleromaAdapterCopyWith(
          UnifediApiAccessTokenPleromaAdapter value,
          $Res Function(UnifediApiAccessTokenPleromaAdapter) then) =
      _$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessToken value});

  $PleromaApiAccessTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessTokenPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessTokenPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessTokenPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessTokenPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessToken,
    ));
  }

  @override
  $PleromaApiAccessTokenCopyWith<$Res> get value {
    return $PleromaApiAccessTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessTokenPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessTokenPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessTokenPleromaAdapterCopyWith(
          _UnifediApiAccessTokenPleromaAdapter value,
          $Res Function(_UnifediApiAccessTokenPleromaAdapter) then) =
      __$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessToken value});

  @override
  $PleromaApiAccessTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessTokenPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessTokenPleromaAdapterCopyWithImpl(
      _UnifediApiAccessTokenPleromaAdapter _value,
      $Res Function(_UnifediApiAccessTokenPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessTokenPleromaAdapter));

  @override
  _UnifediApiAccessTokenPleromaAdapter get _value =>
      super._value as _UnifediApiAccessTokenPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessTokenPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessTokenPleromaAdapter
    extends _UnifediApiAccessTokenPleromaAdapter {
  const _$_UnifediApiAccessTokenPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessTokenPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessToken value;

  @override
  String toString() {
    return 'UnifediApiAccessTokenPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessTokenPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessTokenPleromaAdapterCopyWith<
          _UnifediApiAccessTokenPleromaAdapter>
      get copyWith => __$UnifediApiAccessTokenPleromaAdapterCopyWithImpl<
          _UnifediApiAccessTokenPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessTokenPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessTokenPleromaAdapter
    extends UnifediApiAccessTokenPleromaAdapter {
  const factory _UnifediApiAccessTokenPleromaAdapter(
          @HiveField(0) PleromaApiAccessToken value) =
      _$_UnifediApiAccessTokenPleromaAdapter;
  const _UnifediApiAccessTokenPleromaAdapter._() : super._();

  factory _UnifediApiAccessTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessTokenPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessToken get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessTokenPleromaAdapterCopyWith<
          _UnifediApiAccessTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

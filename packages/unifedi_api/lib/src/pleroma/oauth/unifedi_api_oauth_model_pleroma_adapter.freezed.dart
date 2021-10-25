// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_oauth_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiOAuthTokenPleromaAdapter _$UnifediApiOAuthTokenPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiOAuthTokenPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiOAuthTokenPleromaAdapterTearOff {
  const _$UnifediApiOAuthTokenPleromaAdapterTearOff();

  _UnifediApiOAuthTokenPleromaAdapter call(
      @HiveField(0) PleromaApiOAuthToken value) {
    return _UnifediApiOAuthTokenPleromaAdapter(
      value,
    );
  }

  UnifediApiOAuthTokenPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiOAuthTokenPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiOAuthTokenPleromaAdapter =
    _$UnifediApiOAuthTokenPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiOAuthTokenPleromaAdapter {
  @HiveField(0)
  PleromaApiOAuthToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiOAuthTokenPleromaAdapterCopyWith<
          UnifediApiOAuthTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiOAuthTokenPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiOAuthTokenPleromaAdapterCopyWith(
          UnifediApiOAuthTokenPleromaAdapter value,
          $Res Function(UnifediApiOAuthTokenPleromaAdapter) then) =
      _$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiOAuthToken value});

  $PleromaApiOAuthTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiOAuthTokenPleromaAdapterCopyWith<$Res> {
  _$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiOAuthTokenPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiOAuthTokenPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
    ));
  }

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get value {
    return $PleromaApiOAuthTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiOAuthTokenPleromaAdapterCopyWith<$Res>
    implements $UnifediApiOAuthTokenPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiOAuthTokenPleromaAdapterCopyWith(
          _UnifediApiOAuthTokenPleromaAdapter value,
          $Res Function(_UnifediApiOAuthTokenPleromaAdapter) then) =
      __$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiOAuthToken value});

  @override
  $PleromaApiOAuthTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiOAuthTokenPleromaAdapterCopyWith<$Res> {
  __$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl(
      _UnifediApiOAuthTokenPleromaAdapter _value,
      $Res Function(_UnifediApiOAuthTokenPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiOAuthTokenPleromaAdapter));

  @override
  _UnifediApiOAuthTokenPleromaAdapter get _value =>
      super._value as _UnifediApiOAuthTokenPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiOAuthTokenPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiOAuthToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiOAuthTokenPleromaAdapter
    extends _UnifediApiOAuthTokenPleromaAdapter {
  const _$_UnifediApiOAuthTokenPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiOAuthTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiOAuthTokenPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiOAuthToken value;

  @override
  String toString() {
    return 'UnifediApiOAuthTokenPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiOAuthTokenPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiOAuthTokenPleromaAdapterCopyWith<
          _UnifediApiOAuthTokenPleromaAdapter>
      get copyWith => __$UnifediApiOAuthTokenPleromaAdapterCopyWithImpl<
          _UnifediApiOAuthTokenPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiOAuthTokenPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiOAuthTokenPleromaAdapter
    extends UnifediApiOAuthTokenPleromaAdapter {
  const factory _UnifediApiOAuthTokenPleromaAdapter(
          @HiveField(0) PleromaApiOAuthToken value) =
      _$_UnifediApiOAuthTokenPleromaAdapter;
  const _UnifediApiOAuthTokenPleromaAdapter._() : super._();

  factory _UnifediApiOAuthTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiOAuthTokenPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiOAuthToken get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiOAuthTokenPleromaAdapterCopyWith<
          _UnifediApiOAuthTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

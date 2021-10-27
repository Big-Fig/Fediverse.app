// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_header_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestHeaderTearOff {
  const _$RestHeaderTearOff();

  _RestHeader call({required String key, required String value}) {
    return _RestHeader(
      key: key,
      value: value,
    );
  }
}

/// @nodoc
const $RestHeader = _$RestHeaderTearOff();

/// @nodoc
mixin _$RestHeader {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestHeaderCopyWith<RestHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestHeaderCopyWith<$Res> {
  factory $RestHeaderCopyWith(
          RestHeader value, $Res Function(RestHeader) then) =
      _$RestHeaderCopyWithImpl<$Res>;
  $Res call({String key, String value});
}

/// @nodoc
class _$RestHeaderCopyWithImpl<$Res> implements $RestHeaderCopyWith<$Res> {
  _$RestHeaderCopyWithImpl(this._value, this._then);

  final RestHeader _value;
  // ignore: unused_field
  final $Res Function(RestHeader) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RestHeaderCopyWith<$Res> implements $RestHeaderCopyWith<$Res> {
  factory _$RestHeaderCopyWith(
          _RestHeader value, $Res Function(_RestHeader) then) =
      __$RestHeaderCopyWithImpl<$Res>;
  @override
  $Res call({String key, String value});
}

/// @nodoc
class __$RestHeaderCopyWithImpl<$Res> extends _$RestHeaderCopyWithImpl<$Res>
    implements _$RestHeaderCopyWith<$Res> {
  __$RestHeaderCopyWithImpl(
      _RestHeader _value, $Res Function(_RestHeader) _then)
      : super(_value, (v) => _then(v as _RestHeader));

  @override
  _RestHeader get _value => super._value as _RestHeader;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_RestHeader(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestHeader implements _RestHeader {
  const _$_RestHeader({required this.key, required this.value});

  @override
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'RestHeader(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RestHeader &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  _$RestHeaderCopyWith<_RestHeader> get copyWith =>
      __$RestHeaderCopyWithImpl<_RestHeader>(this, _$identity);
}

abstract class _RestHeader implements RestHeader {
  const factory _RestHeader({required String key, required String value}) =
      _$_RestHeader;

  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$RestHeaderCopyWith<_RestHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

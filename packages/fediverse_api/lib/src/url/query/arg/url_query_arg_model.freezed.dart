// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'url_query_arg_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UrlQueryArgTearOff {
  const _$UrlQueryArgTearOff();

  _UrlQueryArg call({required String key, required String value}) {
    return _UrlQueryArg(
      key: key,
      value: value,
    );
  }
}

/// @nodoc
const $UrlQueryArg = _$UrlQueryArgTearOff();

/// @nodoc
mixin _$UrlQueryArg {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UrlQueryArgCopyWith<UrlQueryArg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlQueryArgCopyWith<$Res> {
  factory $UrlQueryArgCopyWith(
          UrlQueryArg value, $Res Function(UrlQueryArg) then) =
      _$UrlQueryArgCopyWithImpl<$Res>;
  $Res call({String key, String value});
}

/// @nodoc
class _$UrlQueryArgCopyWithImpl<$Res> implements $UrlQueryArgCopyWith<$Res> {
  _$UrlQueryArgCopyWithImpl(this._value, this._then);

  final UrlQueryArg _value;
  // ignore: unused_field
  final $Res Function(UrlQueryArg) _then;

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
abstract class _$UrlQueryArgCopyWith<$Res>
    implements $UrlQueryArgCopyWith<$Res> {
  factory _$UrlQueryArgCopyWith(
          _UrlQueryArg value, $Res Function(_UrlQueryArg) then) =
      __$UrlQueryArgCopyWithImpl<$Res>;
  @override
  $Res call({String key, String value});
}

/// @nodoc
class __$UrlQueryArgCopyWithImpl<$Res> extends _$UrlQueryArgCopyWithImpl<$Res>
    implements _$UrlQueryArgCopyWith<$Res> {
  __$UrlQueryArgCopyWithImpl(
      _UrlQueryArg _value, $Res Function(_UrlQueryArg) _then)
      : super(_value, (v) => _then(v as _UrlQueryArg));

  @override
  _UrlQueryArg get _value => super._value as _UrlQueryArg;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_UrlQueryArg(
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

class _$_UrlQueryArg implements _UrlQueryArg {
  const _$_UrlQueryArg({required this.key, required this.value});

  @override
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'UrlQueryArg(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UrlQueryArg &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  _$UrlQueryArgCopyWith<_UrlQueryArg> get copyWith =>
      __$UrlQueryArgCopyWithImpl<_UrlQueryArg>(this, _$identity);
}

abstract class _UrlQueryArg implements UrlQueryArg {
  const factory _UrlQueryArg({required String key, required String value}) =
      _$_UrlQueryArg;

  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$UrlQueryArgCopyWith<_UrlQueryArg> get copyWith =>
      throw _privateConstructorUsedError;
}

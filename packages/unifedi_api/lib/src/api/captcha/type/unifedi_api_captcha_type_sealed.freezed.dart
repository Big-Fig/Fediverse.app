// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_captcha_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiCaptchaTypeTearOff {
  const _$UnifediApiCaptchaTypeTearOff();

  _Native native(
      {String stringValue = UnifediApiCaptchaType.nativeStringValue}) {
    return _Native(
      stringValue: stringValue,
    );
  }

  _Kocaptcha kocaptcha(
      {String stringValue = UnifediApiCaptchaType.kocaptchaStringValue}) {
    return _Kocaptcha(
      stringValue: stringValue,
    );
  }

  _None none({String stringValue = UnifediApiCaptchaType.noneStringValue}) {
    return _None(
      stringValue: stringValue,
    );
  }

  _Unknown unknown({required String stringValue}) {
    return _Unknown(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $UnifediApiCaptchaType = _$UnifediApiCaptchaTypeTearOff();

/// @nodoc
mixin _$UnifediApiCaptchaType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) native,
    required TResult Function(String stringValue) kocaptcha,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Native value) native,
    required TResult Function(_Kocaptcha value) kocaptcha,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiCaptchaTypeCopyWith<UnifediApiCaptchaType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCaptchaTypeCopyWith<$Res> {
  factory $UnifediApiCaptchaTypeCopyWith(UnifediApiCaptchaType value,
          $Res Function(UnifediApiCaptchaType) then) =
      _$UnifediApiCaptchaTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$UnifediApiCaptchaTypeCopyWithImpl<$Res>
    implements $UnifediApiCaptchaTypeCopyWith<$Res> {
  _$UnifediApiCaptchaTypeCopyWithImpl(this._value, this._then);

  final UnifediApiCaptchaType _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCaptchaType) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NativeCopyWith<$Res>
    implements $UnifediApiCaptchaTypeCopyWith<$Res> {
  factory _$NativeCopyWith(_Native value, $Res Function(_Native) then) =
      __$NativeCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NativeCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaTypeCopyWithImpl<$Res>
    implements _$NativeCopyWith<$Res> {
  __$NativeCopyWithImpl(_Native _value, $Res Function(_Native) _then)
      : super(_value, (v) => _then(v as _Native));

  @override
  _Native get _value => super._value as _Native;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Native(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Native implements _Native {
  const _$_Native({this.stringValue = UnifediApiCaptchaType.nativeStringValue});

  @JsonKey(defaultValue: UnifediApiCaptchaType.nativeStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCaptchaType.native(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Native &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$NativeCopyWith<_Native> get copyWith =>
      __$NativeCopyWithImpl<_Native>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) native,
    required TResult Function(String stringValue) kocaptcha,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return native(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return native?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (native != null) {
      return native(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Native value) native,
    required TResult Function(_Kocaptcha value) kocaptcha,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return native(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return native?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (native != null) {
      return native(this);
    }
    return orElse();
  }
}

abstract class _Native implements UnifediApiCaptchaType {
  const factory _Native({String stringValue}) = _$_Native;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NativeCopyWith<_Native> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$KocaptchaCopyWith<$Res>
    implements $UnifediApiCaptchaTypeCopyWith<$Res> {
  factory _$KocaptchaCopyWith(
          _Kocaptcha value, $Res Function(_Kocaptcha) then) =
      __$KocaptchaCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$KocaptchaCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaTypeCopyWithImpl<$Res>
    implements _$KocaptchaCopyWith<$Res> {
  __$KocaptchaCopyWithImpl(_Kocaptcha _value, $Res Function(_Kocaptcha) _then)
      : super(_value, (v) => _then(v as _Kocaptcha));

  @override
  _Kocaptcha get _value => super._value as _Kocaptcha;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Kocaptcha(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Kocaptcha implements _Kocaptcha {
  const _$_Kocaptcha(
      {this.stringValue = UnifediApiCaptchaType.kocaptchaStringValue});

  @JsonKey(defaultValue: UnifediApiCaptchaType.kocaptchaStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCaptchaType.kocaptcha(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Kocaptcha &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$KocaptchaCopyWith<_Kocaptcha> get copyWith =>
      __$KocaptchaCopyWithImpl<_Kocaptcha>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) native,
    required TResult Function(String stringValue) kocaptcha,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return kocaptcha(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return kocaptcha?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (kocaptcha != null) {
      return kocaptcha(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Native value) native,
    required TResult Function(_Kocaptcha value) kocaptcha,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return kocaptcha(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return kocaptcha?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (kocaptcha != null) {
      return kocaptcha(this);
    }
    return orElse();
  }
}

abstract class _Kocaptcha implements UnifediApiCaptchaType {
  const factory _Kocaptcha({String stringValue}) = _$_Kocaptcha;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KocaptchaCopyWith<_Kocaptcha> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoneCopyWith<$Res>
    implements $UnifediApiCaptchaTypeCopyWith<$Res> {
  factory _$NoneCopyWith(_None value, $Res Function(_None) then) =
      __$NoneCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NoneCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaTypeCopyWithImpl<$Res>
    implements _$NoneCopyWith<$Res> {
  __$NoneCopyWithImpl(_None _value, $Res Function(_None) _then)
      : super(_value, (v) => _then(v as _None));

  @override
  _None get _value => super._value as _None;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_None(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_None implements _None {
  const _$_None({this.stringValue = UnifediApiCaptchaType.noneStringValue});

  @JsonKey(defaultValue: UnifediApiCaptchaType.noneStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCaptchaType.none(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _None &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$NoneCopyWith<_None> get copyWith =>
      __$NoneCopyWithImpl<_None>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) native,
    required TResult Function(String stringValue) kocaptcha,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return none(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return none?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Native value) native,
    required TResult Function(_Kocaptcha value) kocaptcha,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None implements UnifediApiCaptchaType {
  const factory _None({String stringValue}) = _$_None;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoneCopyWith<_None> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $UnifediApiCaptchaTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaTypeCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(_Unknown _value, $Res Function(_Unknown) _then)
      : super(_value, (v) => _then(v as _Unknown));

  @override
  _Unknown get _value => super._value as _Unknown;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Unknown(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Unknown implements _Unknown {
  const _$_Unknown({required this.stringValue});

  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCaptchaType.unknown(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unknown &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) native,
    required TResult Function(String stringValue) kocaptcha,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? native,
    TResult Function(String stringValue)? kocaptcha,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Native value) native,
    required TResult Function(_Kocaptcha value) kocaptcha,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Native value)? native,
    TResult Function(_Kocaptcha value)? kocaptcha,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements UnifediApiCaptchaType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

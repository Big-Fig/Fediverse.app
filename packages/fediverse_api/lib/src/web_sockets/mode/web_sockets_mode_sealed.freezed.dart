// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_sockets_mode_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WebSocketsModeTearOff {
  const _$WebSocketsModeTearOff();

  _Disabled disabled(
      {String stringValue = WebSocketsMode.disabledStringValue}) {
    return _Disabled(
      stringValue: stringValue,
    );
  }

  _OnlyForeground onlyForeground(
      {String stringValue = WebSocketsMode.onlyForegroundStringValue}) {
    return _OnlyForeground(
      stringValue: stringValue,
    );
  }

  _ForegroundAndBackground foregroundAndBackground(
      {String stringValue =
          WebSocketsMode.foregroundAndBackgroundStringValue}) {
    return _ForegroundAndBackground(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $WebSocketsMode = _$WebSocketsModeTearOff();

/// @nodoc
mixin _$WebSocketsMode {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) disabled,
    required TResult Function(String stringValue) onlyForeground,
    required TResult Function(String stringValue) foregroundAndBackground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_OnlyForeground value) onlyForeground,
    required TResult Function(_ForegroundAndBackground value)
        foregroundAndBackground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebSocketsModeCopyWith<WebSocketsMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketsModeCopyWith<$Res> {
  factory $WebSocketsModeCopyWith(
          WebSocketsMode value, $Res Function(WebSocketsMode) then) =
      _$WebSocketsModeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$WebSocketsModeCopyWithImpl<$Res>
    implements $WebSocketsModeCopyWith<$Res> {
  _$WebSocketsModeCopyWithImpl(this._value, this._then);

  final WebSocketsMode _value;
  // ignore: unused_field
  final $Res Function(WebSocketsMode) _then;

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
abstract class _$DisabledCopyWith<$Res>
    implements $WebSocketsModeCopyWith<$Res> {
  factory _$DisabledCopyWith(_Disabled value, $Res Function(_Disabled) then) =
      __$DisabledCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$DisabledCopyWithImpl<$Res> extends _$WebSocketsModeCopyWithImpl<$Res>
    implements _$DisabledCopyWith<$Res> {
  __$DisabledCopyWithImpl(_Disabled _value, $Res Function(_Disabled) _then)
      : super(_value, (v) => _then(v as _Disabled));

  @override
  _Disabled get _value => super._value as _Disabled;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Disabled(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Disabled implements _Disabled {
  const _$_Disabled({this.stringValue = WebSocketsMode.disabledStringValue});

  @JsonKey(defaultValue: WebSocketsMode.disabledStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'WebSocketsMode.disabled(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Disabled &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$DisabledCopyWith<_Disabled> get copyWith =>
      __$DisabledCopyWithImpl<_Disabled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) disabled,
    required TResult Function(String stringValue) onlyForeground,
    required TResult Function(String stringValue) foregroundAndBackground,
  }) {
    return disabled(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
  }) {
    return disabled?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_OnlyForeground value) onlyForeground,
    required TResult Function(_ForegroundAndBackground value)
        foregroundAndBackground,
  }) {
    return disabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
  }) {
    return disabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled(this);
    }
    return orElse();
  }
}

abstract class _Disabled implements WebSocketsMode {
  const factory _Disabled({String stringValue}) = _$_Disabled;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$DisabledCopyWith<_Disabled> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnlyForegroundCopyWith<$Res>
    implements $WebSocketsModeCopyWith<$Res> {
  factory _$OnlyForegroundCopyWith(
          _OnlyForeground value, $Res Function(_OnlyForeground) then) =
      __$OnlyForegroundCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$OnlyForegroundCopyWithImpl<$Res>
    extends _$WebSocketsModeCopyWithImpl<$Res>
    implements _$OnlyForegroundCopyWith<$Res> {
  __$OnlyForegroundCopyWithImpl(
      _OnlyForeground _value, $Res Function(_OnlyForeground) _then)
      : super(_value, (v) => _then(v as _OnlyForeground));

  @override
  _OnlyForeground get _value => super._value as _OnlyForeground;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_OnlyForeground(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnlyForeground implements _OnlyForeground {
  const _$_OnlyForeground(
      {this.stringValue = WebSocketsMode.onlyForegroundStringValue});

  @JsonKey(defaultValue: WebSocketsMode.onlyForegroundStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'WebSocketsMode.onlyForeground(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnlyForeground &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$OnlyForegroundCopyWith<_OnlyForeground> get copyWith =>
      __$OnlyForegroundCopyWithImpl<_OnlyForeground>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) disabled,
    required TResult Function(String stringValue) onlyForeground,
    required TResult Function(String stringValue) foregroundAndBackground,
  }) {
    return onlyForeground(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
  }) {
    return onlyForeground?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (onlyForeground != null) {
      return onlyForeground(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_OnlyForeground value) onlyForeground,
    required TResult Function(_ForegroundAndBackground value)
        foregroundAndBackground,
  }) {
    return onlyForeground(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
  }) {
    return onlyForeground?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (onlyForeground != null) {
      return onlyForeground(this);
    }
    return orElse();
  }
}

abstract class _OnlyForeground implements WebSocketsMode {
  const factory _OnlyForeground({String stringValue}) = _$_OnlyForeground;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$OnlyForegroundCopyWith<_OnlyForeground> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ForegroundAndBackgroundCopyWith<$Res>
    implements $WebSocketsModeCopyWith<$Res> {
  factory _$ForegroundAndBackgroundCopyWith(_ForegroundAndBackground value,
          $Res Function(_ForegroundAndBackground) then) =
      __$ForegroundAndBackgroundCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ForegroundAndBackgroundCopyWithImpl<$Res>
    extends _$WebSocketsModeCopyWithImpl<$Res>
    implements _$ForegroundAndBackgroundCopyWith<$Res> {
  __$ForegroundAndBackgroundCopyWithImpl(_ForegroundAndBackground _value,
      $Res Function(_ForegroundAndBackground) _then)
      : super(_value, (v) => _then(v as _ForegroundAndBackground));

  @override
  _ForegroundAndBackground get _value =>
      super._value as _ForegroundAndBackground;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_ForegroundAndBackground(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForegroundAndBackground implements _ForegroundAndBackground {
  const _$_ForegroundAndBackground(
      {this.stringValue = WebSocketsMode.foregroundAndBackgroundStringValue});

  @JsonKey(defaultValue: WebSocketsMode.foregroundAndBackgroundStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'WebSocketsMode.foregroundAndBackground(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForegroundAndBackground &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$ForegroundAndBackgroundCopyWith<_ForegroundAndBackground> get copyWith =>
      __$ForegroundAndBackgroundCopyWithImpl<_ForegroundAndBackground>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) disabled,
    required TResult Function(String stringValue) onlyForeground,
    required TResult Function(String stringValue) foregroundAndBackground,
  }) {
    return foregroundAndBackground(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
  }) {
    return foregroundAndBackground?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? disabled,
    TResult Function(String stringValue)? onlyForeground,
    TResult Function(String stringValue)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (foregroundAndBackground != null) {
      return foregroundAndBackground(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Disabled value) disabled,
    required TResult Function(_OnlyForeground value) onlyForeground,
    required TResult Function(_ForegroundAndBackground value)
        foregroundAndBackground,
  }) {
    return foregroundAndBackground(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
  }) {
    return foregroundAndBackground?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Disabled value)? disabled,
    TResult Function(_OnlyForeground value)? onlyForeground,
    TResult Function(_ForegroundAndBackground value)? foregroundAndBackground,
    required TResult orElse(),
  }) {
    if (foregroundAndBackground != null) {
      return foregroundAndBackground(this);
    }
    return orElse();
  }
}

abstract class _ForegroundAndBackground implements WebSocketsMode {
  const factory _ForegroundAndBackground({String stringValue}) =
      _$_ForegroundAndBackground;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$ForegroundAndBackgroundCopyWith<_ForegroundAndBackground> get copyWith =>
      throw _privateConstructorUsedError;
}

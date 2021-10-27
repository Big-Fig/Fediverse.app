// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'websockets_channel_handler_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WebSocketsChannelHandlerTypeTearOff {
  const _$WebSocketsChannelHandlerTypeTearOff();

  _Background background(
      {String stringValue =
          WebSocketsChannelHandlerType.backgroundStringValue}) {
    return _Background(
      stringValue: stringValue,
    );
  }

  _Foreground foreground(
      {String stringValue =
          WebSocketsChannelHandlerType.foregroundStringValue}) {
    return _Foreground(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $WebSocketsChannelHandlerType = _$WebSocketsChannelHandlerTypeTearOff();

/// @nodoc
mixin _$WebSocketsChannelHandlerType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) background,
    required TResult Function(String stringValue) foreground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Background value) background,
    required TResult Function(_Foreground value) foreground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebSocketsChannelHandlerTypeCopyWith<WebSocketsChannelHandlerType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketsChannelHandlerTypeCopyWith<$Res> {
  factory $WebSocketsChannelHandlerTypeCopyWith(
          WebSocketsChannelHandlerType value,
          $Res Function(WebSocketsChannelHandlerType) then) =
      _$WebSocketsChannelHandlerTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$WebSocketsChannelHandlerTypeCopyWithImpl<$Res>
    implements $WebSocketsChannelHandlerTypeCopyWith<$Res> {
  _$WebSocketsChannelHandlerTypeCopyWithImpl(this._value, this._then);

  final WebSocketsChannelHandlerType _value;
  // ignore: unused_field
  final $Res Function(WebSocketsChannelHandlerType) _then;

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
abstract class _$BackgroundCopyWith<$Res>
    implements $WebSocketsChannelHandlerTypeCopyWith<$Res> {
  factory _$BackgroundCopyWith(
          _Background value, $Res Function(_Background) then) =
      __$BackgroundCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$BackgroundCopyWithImpl<$Res>
    extends _$WebSocketsChannelHandlerTypeCopyWithImpl<$Res>
    implements _$BackgroundCopyWith<$Res> {
  __$BackgroundCopyWithImpl(
      _Background _value, $Res Function(_Background) _then)
      : super(_value, (v) => _then(v as _Background));

  @override
  _Background get _value => super._value as _Background;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Background(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Background implements _Background {
  const _$_Background(
      {this.stringValue = WebSocketsChannelHandlerType.backgroundStringValue});

  @JsonKey(defaultValue: WebSocketsChannelHandlerType.backgroundStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'WebSocketsChannelHandlerType.background(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Background &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$BackgroundCopyWith<_Background> get copyWith =>
      __$BackgroundCopyWithImpl<_Background>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) background,
    required TResult Function(String stringValue) foreground,
  }) {
    return background(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
  }) {
    return background?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
    required TResult orElse(),
  }) {
    if (background != null) {
      return background(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Background value) background,
    required TResult Function(_Foreground value) foreground,
  }) {
    return background(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
  }) {
    return background?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
    required TResult orElse(),
  }) {
    if (background != null) {
      return background(this);
    }
    return orElse();
  }
}

abstract class _Background implements WebSocketsChannelHandlerType {
  const factory _Background({String stringValue}) = _$_Background;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$BackgroundCopyWith<_Background> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ForegroundCopyWith<$Res>
    implements $WebSocketsChannelHandlerTypeCopyWith<$Res> {
  factory _$ForegroundCopyWith(
          _Foreground value, $Res Function(_Foreground) then) =
      __$ForegroundCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ForegroundCopyWithImpl<$Res>
    extends _$WebSocketsChannelHandlerTypeCopyWithImpl<$Res>
    implements _$ForegroundCopyWith<$Res> {
  __$ForegroundCopyWithImpl(
      _Foreground _value, $Res Function(_Foreground) _then)
      : super(_value, (v) => _then(v as _Foreground));

  @override
  _Foreground get _value => super._value as _Foreground;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Foreground(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Foreground implements _Foreground {
  const _$_Foreground(
      {this.stringValue = WebSocketsChannelHandlerType.foregroundStringValue});

  @JsonKey(defaultValue: WebSocketsChannelHandlerType.foregroundStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'WebSocketsChannelHandlerType.foreground(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Foreground &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$ForegroundCopyWith<_Foreground> get copyWith =>
      __$ForegroundCopyWithImpl<_Foreground>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) background,
    required TResult Function(String stringValue) foreground,
  }) {
    return foreground(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
  }) {
    return foreground?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? background,
    TResult Function(String stringValue)? foreground,
    required TResult orElse(),
  }) {
    if (foreground != null) {
      return foreground(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Background value) background,
    required TResult Function(_Foreground value) foreground,
  }) {
    return foreground(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
  }) {
    return foreground?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Background value)? background,
    TResult Function(_Foreground value)? foreground,
    required TResult orElse(),
  }) {
    if (foreground != null) {
      return foreground(this);
    }
    return orElse();
  }
}

abstract class _Foreground implements WebSocketsChannelHandlerType {
  const factory _Foreground({String stringValue}) = _$_Foreground;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$ForegroundCopyWith<_Foreground> get copyWith =>
      throw _privateConstructorUsedError;
}

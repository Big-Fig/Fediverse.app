// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_timeline_reply_visibility_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiReplyVisibilityFilterTearOff {
  const _$PleromaApiReplyVisibilityFilterTearOff();

  _Following following(
      {String stringValue =
          PleromaApiReplyVisibilityFilter.followingStringValue}) {
    return _Following(
      stringValue: stringValue,
    );
  }

  _Self self(
      {String stringValue = PleromaApiReplyVisibilityFilter.selfStringValue}) {
    return _Self(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $PleromaApiReplyVisibilityFilter =
    _$PleromaApiReplyVisibilityFilterTearOff();

/// @nodoc
mixin _$PleromaApiReplyVisibilityFilter {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) following,
    required TResult Function(String stringValue) self,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Following value) following,
    required TResult Function(_Self value) self,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiReplyVisibilityFilterCopyWith<PleromaApiReplyVisibilityFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiReplyVisibilityFilterCopyWith<$Res> {
  factory $PleromaApiReplyVisibilityFilterCopyWith(
          PleromaApiReplyVisibilityFilter value,
          $Res Function(PleromaApiReplyVisibilityFilter) then) =
      _$PleromaApiReplyVisibilityFilterCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$PleromaApiReplyVisibilityFilterCopyWithImpl<$Res>
    implements $PleromaApiReplyVisibilityFilterCopyWith<$Res> {
  _$PleromaApiReplyVisibilityFilterCopyWithImpl(this._value, this._then);

  final PleromaApiReplyVisibilityFilter _value;
  // ignore: unused_field
  final $Res Function(PleromaApiReplyVisibilityFilter) _then;

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
abstract class _$FollowingCopyWith<$Res>
    implements $PleromaApiReplyVisibilityFilterCopyWith<$Res> {
  factory _$FollowingCopyWith(
          _Following value, $Res Function(_Following) then) =
      __$FollowingCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$FollowingCopyWithImpl<$Res>
    extends _$PleromaApiReplyVisibilityFilterCopyWithImpl<$Res>
    implements _$FollowingCopyWith<$Res> {
  __$FollowingCopyWithImpl(_Following _value, $Res Function(_Following) _then)
      : super(_value, (v) => _then(v as _Following));

  @override
  _Following get _value => super._value as _Following;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Following(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Following implements _Following {
  const _$_Following(
      {this.stringValue =
          PleromaApiReplyVisibilityFilter.followingStringValue});

  @JsonKey(defaultValue: PleromaApiReplyVisibilityFilter.followingStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiReplyVisibilityFilter.following(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Following &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$FollowingCopyWith<_Following> get copyWith =>
      __$FollowingCopyWithImpl<_Following>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) following,
    required TResult Function(String stringValue) self,
  }) {
    return following(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
  }) {
    return following?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
    required TResult orElse(),
  }) {
    if (following != null) {
      return following(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Following value) following,
    required TResult Function(_Self value) self,
  }) {
    return following(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
  }) {
    return following?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
    required TResult orElse(),
  }) {
    if (following != null) {
      return following(this);
    }
    return orElse();
  }
}

abstract class _Following implements PleromaApiReplyVisibilityFilter {
  const factory _Following({String stringValue}) = _$_Following;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$FollowingCopyWith<_Following> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SelfCopyWith<$Res>
    implements $PleromaApiReplyVisibilityFilterCopyWith<$Res> {
  factory _$SelfCopyWith(_Self value, $Res Function(_Self) then) =
      __$SelfCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$SelfCopyWithImpl<$Res>
    extends _$PleromaApiReplyVisibilityFilterCopyWithImpl<$Res>
    implements _$SelfCopyWith<$Res> {
  __$SelfCopyWithImpl(_Self _value, $Res Function(_Self) _then)
      : super(_value, (v) => _then(v as _Self));

  @override
  _Self get _value => super._value as _Self;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Self(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Self implements _Self {
  const _$_Self(
      {this.stringValue = PleromaApiReplyVisibilityFilter.selfStringValue});

  @JsonKey(defaultValue: PleromaApiReplyVisibilityFilter.selfStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiReplyVisibilityFilter.self(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Self &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$SelfCopyWith<_Self> get copyWith =>
      __$SelfCopyWithImpl<_Self>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) following,
    required TResult Function(String stringValue) self,
  }) {
    return self(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
  }) {
    return self?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? following,
    TResult Function(String stringValue)? self,
    required TResult orElse(),
  }) {
    if (self != null) {
      return self(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Following value) following,
    required TResult Function(_Self value) self,
  }) {
    return self(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
  }) {
    return self?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Following value)? following,
    TResult Function(_Self value)? self,
    required TResult orElse(),
  }) {
    if (self != null) {
      return self(this);
    }
    return orElse();
  }
}

abstract class _Self implements PleromaApiReplyVisibilityFilter {
  const factory _Self({String stringValue}) = _$_Self;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$SelfCopyWith<_Self> get copyWith => throw _privateConstructorUsedError;
}

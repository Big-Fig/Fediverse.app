// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_rest_error_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiRestErrorTypeTearOff {
  const _$MastodonApiRestErrorTypeTearOff();

  _InvalidGrant invalidGrant(
      {String stringValue = MastodonApiRestErrorType.invalidGrantStringValue}) {
    return _InvalidGrant(
      stringValue: stringValue,
    );
  }

  _AccessTokenRevoked accessTokenRevoked(
      {String stringValue =
          MastodonApiRestErrorType.accessTokenRevokedStringValue}) {
    return _AccessTokenRevoked(
      stringValue: stringValue,
    );
  }

  _EmailConfirmationRequired emailConfirmationRequired(
      {String stringValue =
          MastodonApiRestErrorType.emailConfirmationRequiredStringValue}) {
    return _EmailConfirmationRequired(
      stringValue: stringValue,
    );
  }

  _TooShort tooShort(
      {String stringValue = MastodonApiRestErrorType.tooShortStringValue}) {
    return _TooShort(
      stringValue: stringValue,
    );
  }

  _NotIncluded notIncluded(
      {String stringValue = MastodonApiRestErrorType.notIncludedStringValue}) {
    return _NotIncluded(
      stringValue: stringValue,
    );
  }

  _Unreachable unreachable(
      {String stringValue = MastodonApiRestErrorType.unreachableStringValue}) {
    return _Unreachable(
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
const $MastodonApiRestErrorType = _$MastodonApiRestErrorTypeTearOff();

/// @nodoc
mixin _$MastodonApiRestErrorType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiRestErrorTypeCopyWith<MastodonApiRestErrorType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory $MastodonApiRestErrorTypeCopyWith(MastodonApiRestErrorType value,
          $Res Function(MastodonApiRestErrorType) then) =
      _$MastodonApiRestErrorTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  _$MastodonApiRestErrorTypeCopyWithImpl(this._value, this._then);

  final MastodonApiRestErrorType _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRestErrorType) _then;

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
abstract class _$InvalidGrantCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$InvalidGrantCopyWith(
          _InvalidGrant value, $Res Function(_InvalidGrant) then) =
      __$InvalidGrantCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$InvalidGrantCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$InvalidGrantCopyWith<$Res> {
  __$InvalidGrantCopyWithImpl(
      _InvalidGrant _value, $Res Function(_InvalidGrant) _then)
      : super(_value, (v) => _then(v as _InvalidGrant));

  @override
  _InvalidGrant get _value => super._value as _InvalidGrant;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_InvalidGrant(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvalidGrant implements _InvalidGrant {
  const _$_InvalidGrant(
      {this.stringValue = MastodonApiRestErrorType.invalidGrantStringValue});

  @JsonKey(defaultValue: MastodonApiRestErrorType.invalidGrantStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.invalidGrant(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvalidGrant &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$InvalidGrantCopyWith<_InvalidGrant> get copyWith =>
      __$InvalidGrantCopyWithImpl<_InvalidGrant>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return invalidGrant(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return invalidGrant?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (invalidGrant != null) {
      return invalidGrant(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return invalidGrant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return invalidGrant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidGrant != null) {
      return invalidGrant(this);
    }
    return orElse();
  }
}

abstract class _InvalidGrant implements MastodonApiRestErrorType {
  const factory _InvalidGrant({String stringValue}) = _$_InvalidGrant;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$InvalidGrantCopyWith<_InvalidGrant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AccessTokenRevokedCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$AccessTokenRevokedCopyWith(
          _AccessTokenRevoked value, $Res Function(_AccessTokenRevoked) then) =
      __$AccessTokenRevokedCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AccessTokenRevokedCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$AccessTokenRevokedCopyWith<$Res> {
  __$AccessTokenRevokedCopyWithImpl(
      _AccessTokenRevoked _value, $Res Function(_AccessTokenRevoked) _then)
      : super(_value, (v) => _then(v as _AccessTokenRevoked));

  @override
  _AccessTokenRevoked get _value => super._value as _AccessTokenRevoked;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_AccessTokenRevoked(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccessTokenRevoked implements _AccessTokenRevoked {
  const _$_AccessTokenRevoked(
      {this.stringValue =
          MastodonApiRestErrorType.accessTokenRevokedStringValue});

  @JsonKey(defaultValue: MastodonApiRestErrorType.accessTokenRevokedStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.accessTokenRevoked(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccessTokenRevoked &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$AccessTokenRevokedCopyWith<_AccessTokenRevoked> get copyWith =>
      __$AccessTokenRevokedCopyWithImpl<_AccessTokenRevoked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return accessTokenRevoked(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return accessTokenRevoked?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (accessTokenRevoked != null) {
      return accessTokenRevoked(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return accessTokenRevoked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return accessTokenRevoked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (accessTokenRevoked != null) {
      return accessTokenRevoked(this);
    }
    return orElse();
  }
}

abstract class _AccessTokenRevoked implements MastodonApiRestErrorType {
  const factory _AccessTokenRevoked({String stringValue}) =
      _$_AccessTokenRevoked;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$AccessTokenRevokedCopyWith<_AccessTokenRevoked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EmailConfirmationRequiredCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$EmailConfirmationRequiredCopyWith(_EmailConfirmationRequired value,
          $Res Function(_EmailConfirmationRequired) then) =
      __$EmailConfirmationRequiredCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$EmailConfirmationRequiredCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$EmailConfirmationRequiredCopyWith<$Res> {
  __$EmailConfirmationRequiredCopyWithImpl(_EmailConfirmationRequired _value,
      $Res Function(_EmailConfirmationRequired) _then)
      : super(_value, (v) => _then(v as _EmailConfirmationRequired));

  @override
  _EmailConfirmationRequired get _value =>
      super._value as _EmailConfirmationRequired;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_EmailConfirmationRequired(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailConfirmationRequired implements _EmailConfirmationRequired {
  const _$_EmailConfirmationRequired(
      {this.stringValue =
          MastodonApiRestErrorType.emailConfirmationRequiredStringValue});

  @JsonKey(
      defaultValue:
          MastodonApiRestErrorType.emailConfirmationRequiredStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.emailConfirmationRequired(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailConfirmationRequired &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$EmailConfirmationRequiredCopyWith<_EmailConfirmationRequired>
      get copyWith =>
          __$EmailConfirmationRequiredCopyWithImpl<_EmailConfirmationRequired>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return emailConfirmationRequired(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return emailConfirmationRequired?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (emailConfirmationRequired != null) {
      return emailConfirmationRequired(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return emailConfirmationRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return emailConfirmationRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (emailConfirmationRequired != null) {
      return emailConfirmationRequired(this);
    }
    return orElse();
  }
}

abstract class _EmailConfirmationRequired implements MastodonApiRestErrorType {
  const factory _EmailConfirmationRequired({String stringValue}) =
      _$_EmailConfirmationRequired;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$EmailConfirmationRequiredCopyWith<_EmailConfirmationRequired>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TooShortCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$TooShortCopyWith(_TooShort value, $Res Function(_TooShort) then) =
      __$TooShortCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$TooShortCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$TooShortCopyWith<$Res> {
  __$TooShortCopyWithImpl(_TooShort _value, $Res Function(_TooShort) _then)
      : super(_value, (v) => _then(v as _TooShort));

  @override
  _TooShort get _value => super._value as _TooShort;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_TooShort(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TooShort implements _TooShort {
  const _$_TooShort(
      {this.stringValue = MastodonApiRestErrorType.tooShortStringValue});

  @JsonKey(defaultValue: MastodonApiRestErrorType.tooShortStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.tooShort(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TooShort &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$TooShortCopyWith<_TooShort> get copyWith =>
      __$TooShortCopyWithImpl<_TooShort>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return tooShort(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return tooShort?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return tooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return tooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class _TooShort implements MastodonApiRestErrorType {
  const factory _TooShort({String stringValue}) = _$_TooShort;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$TooShortCopyWith<_TooShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NotIncludedCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$NotIncludedCopyWith(
          _NotIncluded value, $Res Function(_NotIncluded) then) =
      __$NotIncludedCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NotIncludedCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$NotIncludedCopyWith<$Res> {
  __$NotIncludedCopyWithImpl(
      _NotIncluded _value, $Res Function(_NotIncluded) _then)
      : super(_value, (v) => _then(v as _NotIncluded));

  @override
  _NotIncluded get _value => super._value as _NotIncluded;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_NotIncluded(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotIncluded implements _NotIncluded {
  const _$_NotIncluded(
      {this.stringValue = MastodonApiRestErrorType.notIncludedStringValue});

  @JsonKey(defaultValue: MastodonApiRestErrorType.notIncludedStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.notIncluded(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotIncluded &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$NotIncludedCopyWith<_NotIncluded> get copyWith =>
      __$NotIncludedCopyWithImpl<_NotIncluded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return notIncluded(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return notIncluded?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (notIncluded != null) {
      return notIncluded(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return notIncluded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return notIncluded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notIncluded != null) {
      return notIncluded(this);
    }
    return orElse();
  }
}

abstract class _NotIncluded implements MastodonApiRestErrorType {
  const factory _NotIncluded({String stringValue}) = _$_NotIncluded;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$NotIncludedCopyWith<_NotIncluded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnreachableCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$UnreachableCopyWith(
          _Unreachable value, $Res Function(_Unreachable) then) =
      __$UnreachableCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnreachableCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
    implements _$UnreachableCopyWith<$Res> {
  __$UnreachableCopyWithImpl(
      _Unreachable _value, $Res Function(_Unreachable) _then)
      : super(_value, (v) => _then(v as _Unreachable));

  @override
  _Unreachable get _value => super._value as _Unreachable;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Unreachable(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Unreachable implements _Unreachable {
  const _$_Unreachable(
      {this.stringValue = MastodonApiRestErrorType.unreachableStringValue});

  @JsonKey(defaultValue: MastodonApiRestErrorType.unreachableStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiRestErrorType.unreachable(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unreachable &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnreachableCopyWith<_Unreachable> get copyWith =>
      __$UnreachableCopyWithImpl<_Unreachable>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return unreachable(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return unreachable?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (unreachable != null) {
      return unreachable(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unreachable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unreachable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unreachable != null) {
      return unreachable(this);
    }
    return orElse();
  }
}

abstract class _Unreachable implements MastodonApiRestErrorType {
  const factory _Unreachable({String stringValue}) = _$_Unreachable;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnreachableCopyWith<_Unreachable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $MastodonApiRestErrorTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorTypeCopyWithImpl<$Res>
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
    return 'MastodonApiRestErrorType.unknown(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unknown &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) invalidGrant,
    required TResult Function(String stringValue) accessTokenRevoked,
    required TResult Function(String stringValue) emailConfirmationRequired,
    required TResult Function(String stringValue) tooShort,
    required TResult Function(String stringValue) notIncluded,
    required TResult Function(String stringValue) unreachable,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? invalidGrant,
    TResult Function(String stringValue)? accessTokenRevoked,
    TResult Function(String stringValue)? emailConfirmationRequired,
    TResult Function(String stringValue)? tooShort,
    TResult Function(String stringValue)? notIncluded,
    TResult Function(String stringValue)? unreachable,
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
    required TResult Function(_InvalidGrant value) invalidGrant,
    required TResult Function(_AccessTokenRevoked value) accessTokenRevoked,
    required TResult Function(_EmailConfirmationRequired value)
        emailConfirmationRequired,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_NotIncluded value) notIncluded,
    required TResult Function(_Unreachable value) unreachable,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidGrant value)? invalidGrant,
    TResult Function(_AccessTokenRevoked value)? accessTokenRevoked,
    TResult Function(_EmailConfirmationRequired value)?
        emailConfirmationRequired,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_NotIncluded value)? notIncluded,
    TResult Function(_Unreachable value)? unreachable,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements MastodonApiRestErrorType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_rest_error_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiRestErrorTypeTearOff {
  const _$PleromaApiRestErrorTypeTearOff();

  _MissingConfirmedEmail missingConfirmedEmail(
      {String stringValue =
          PleromaApiRestErrorType.missingConfirmedEmailStringValue}) {
    return _MissingConfirmedEmail(
      stringValue: stringValue,
    );
  }

  _AwaitingApproval awaitingApproval(
      {String stringValue =
          PleromaApiRestErrorType.awaitingApprovalStringValue}) {
    return _AwaitingApproval(
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
const $PleromaApiRestErrorType = _$PleromaApiRestErrorTypeTearOff();

/// @nodoc
mixin _$PleromaApiRestErrorType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) missingConfirmedEmail,
    required TResult Function(String stringValue) awaitingApproval,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MissingConfirmedEmail value)
        missingConfirmedEmail,
    required TResult Function(_AwaitingApproval value) awaitingApproval,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiRestErrorTypeCopyWith<PleromaApiRestErrorType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRestErrorTypeCopyWith<$Res> {
  factory $PleromaApiRestErrorTypeCopyWith(PleromaApiRestErrorType value,
          $Res Function(PleromaApiRestErrorType) then) =
      _$PleromaApiRestErrorTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$PleromaApiRestErrorTypeCopyWithImpl<$Res>
    implements $PleromaApiRestErrorTypeCopyWith<$Res> {
  _$PleromaApiRestErrorTypeCopyWithImpl(this._value, this._then);

  final PleromaApiRestErrorType _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRestErrorType) _then;

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
abstract class _$MissingConfirmedEmailCopyWith<$Res>
    implements $PleromaApiRestErrorTypeCopyWith<$Res> {
  factory _$MissingConfirmedEmailCopyWith(_MissingConfirmedEmail value,
          $Res Function(_MissingConfirmedEmail) then) =
      __$MissingConfirmedEmailCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$MissingConfirmedEmailCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorTypeCopyWithImpl<$Res>
    implements _$MissingConfirmedEmailCopyWith<$Res> {
  __$MissingConfirmedEmailCopyWithImpl(_MissingConfirmedEmail _value,
      $Res Function(_MissingConfirmedEmail) _then)
      : super(_value, (v) => _then(v as _MissingConfirmedEmail));

  @override
  _MissingConfirmedEmail get _value => super._value as _MissingConfirmedEmail;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_MissingConfirmedEmail(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MissingConfirmedEmail implements _MissingConfirmedEmail {
  const _$_MissingConfirmedEmail(
      {this.stringValue =
          PleromaApiRestErrorType.missingConfirmedEmailStringValue});

  @JsonKey(
      defaultValue: PleromaApiRestErrorType.missingConfirmedEmailStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiRestErrorType.missingConfirmedEmail(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissingConfirmedEmail &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$MissingConfirmedEmailCopyWith<_MissingConfirmedEmail> get copyWith =>
      __$MissingConfirmedEmailCopyWithImpl<_MissingConfirmedEmail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) missingConfirmedEmail,
    required TResult Function(String stringValue) awaitingApproval,
    required TResult Function(String stringValue) unknown,
  }) {
    return missingConfirmedEmail(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
  }) {
    return missingConfirmedEmail?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (missingConfirmedEmail != null) {
      return missingConfirmedEmail(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MissingConfirmedEmail value)
        missingConfirmedEmail,
    required TResult Function(_AwaitingApproval value) awaitingApproval,
    required TResult Function(_Unknown value) unknown,
  }) {
    return missingConfirmedEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
  }) {
    return missingConfirmedEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (missingConfirmedEmail != null) {
      return missingConfirmedEmail(this);
    }
    return orElse();
  }
}

abstract class _MissingConfirmedEmail implements PleromaApiRestErrorType {
  const factory _MissingConfirmedEmail({String stringValue}) =
      _$_MissingConfirmedEmail;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$MissingConfirmedEmailCopyWith<_MissingConfirmedEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AwaitingApprovalCopyWith<$Res>
    implements $PleromaApiRestErrorTypeCopyWith<$Res> {
  factory _$AwaitingApprovalCopyWith(
          _AwaitingApproval value, $Res Function(_AwaitingApproval) then) =
      __$AwaitingApprovalCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AwaitingApprovalCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorTypeCopyWithImpl<$Res>
    implements _$AwaitingApprovalCopyWith<$Res> {
  __$AwaitingApprovalCopyWithImpl(
      _AwaitingApproval _value, $Res Function(_AwaitingApproval) _then)
      : super(_value, (v) => _then(v as _AwaitingApproval));

  @override
  _AwaitingApproval get _value => super._value as _AwaitingApproval;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_AwaitingApproval(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AwaitingApproval implements _AwaitingApproval {
  const _$_AwaitingApproval(
      {this.stringValue = PleromaApiRestErrorType.awaitingApprovalStringValue});

  @JsonKey(defaultValue: PleromaApiRestErrorType.awaitingApprovalStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiRestErrorType.awaitingApproval(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AwaitingApproval &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$AwaitingApprovalCopyWith<_AwaitingApproval> get copyWith =>
      __$AwaitingApprovalCopyWithImpl<_AwaitingApproval>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) missingConfirmedEmail,
    required TResult Function(String stringValue) awaitingApproval,
    required TResult Function(String stringValue) unknown,
  }) {
    return awaitingApproval(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
  }) {
    return awaitingApproval?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (awaitingApproval != null) {
      return awaitingApproval(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MissingConfirmedEmail value)
        missingConfirmedEmail,
    required TResult Function(_AwaitingApproval value) awaitingApproval,
    required TResult Function(_Unknown value) unknown,
  }) {
    return awaitingApproval(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
  }) {
    return awaitingApproval?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (awaitingApproval != null) {
      return awaitingApproval(this);
    }
    return orElse();
  }
}

abstract class _AwaitingApproval implements PleromaApiRestErrorType {
  const factory _AwaitingApproval({String stringValue}) = _$_AwaitingApproval;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$AwaitingApprovalCopyWith<_AwaitingApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $PleromaApiRestErrorTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorTypeCopyWithImpl<$Res>
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
    return 'PleromaApiRestErrorType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) missingConfirmedEmail,
    required TResult Function(String stringValue) awaitingApproval,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? missingConfirmedEmail,
    TResult Function(String stringValue)? awaitingApproval,
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
    required TResult Function(_MissingConfirmedEmail value)
        missingConfirmedEmail,
    required TResult Function(_AwaitingApproval value) awaitingApproval,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MissingConfirmedEmail value)? missingConfirmedEmail,
    TResult Function(_AwaitingApproval value)? awaitingApproval,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements PleromaApiRestErrorType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

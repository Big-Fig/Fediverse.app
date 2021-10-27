// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DbStatusPopulatedWrapperTearOff {
  const _$DbStatusPopulatedWrapperTearOff();

  _DbStatusPopulatedWrapper call(
      {required DbStatusPopulated dbStatusPopulated}) {
    return _DbStatusPopulatedWrapper(
      dbStatusPopulated: dbStatusPopulated,
    );
  }
}

/// @nodoc
const $DbStatusPopulatedWrapper = _$DbStatusPopulatedWrapperTearOff();

/// @nodoc
mixin _$DbStatusPopulatedWrapper {
  DbStatusPopulated get dbStatusPopulated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbStatusPopulatedWrapperCopyWith<DbStatusPopulatedWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbStatusPopulatedWrapperCopyWith<$Res> {
  factory $DbStatusPopulatedWrapperCopyWith(DbStatusPopulatedWrapper value,
          $Res Function(DbStatusPopulatedWrapper) then) =
      _$DbStatusPopulatedWrapperCopyWithImpl<$Res>;
  $Res call({DbStatusPopulated dbStatusPopulated});

  $DbStatusPopulatedCopyWith<$Res> get dbStatusPopulated;
}

/// @nodoc
class _$DbStatusPopulatedWrapperCopyWithImpl<$Res>
    implements $DbStatusPopulatedWrapperCopyWith<$Res> {
  _$DbStatusPopulatedWrapperCopyWithImpl(this._value, this._then);

  final DbStatusPopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbStatusPopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbStatusPopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbStatusPopulated: dbStatusPopulated == freezed
          ? _value.dbStatusPopulated
          : dbStatusPopulated // ignore: cast_nullable_to_non_nullable
              as DbStatusPopulated,
    ));
  }

  @override
  $DbStatusPopulatedCopyWith<$Res> get dbStatusPopulated {
    return $DbStatusPopulatedCopyWith<$Res>(_value.dbStatusPopulated, (value) {
      return _then(_value.copyWith(dbStatusPopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbStatusPopulatedWrapperCopyWith<$Res>
    implements $DbStatusPopulatedWrapperCopyWith<$Res> {
  factory _$DbStatusPopulatedWrapperCopyWith(_DbStatusPopulatedWrapper value,
          $Res Function(_DbStatusPopulatedWrapper) then) =
      __$DbStatusPopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call({DbStatusPopulated dbStatusPopulated});

  @override
  $DbStatusPopulatedCopyWith<$Res> get dbStatusPopulated;
}

/// @nodoc
class __$DbStatusPopulatedWrapperCopyWithImpl<$Res>
    extends _$DbStatusPopulatedWrapperCopyWithImpl<$Res>
    implements _$DbStatusPopulatedWrapperCopyWith<$Res> {
  __$DbStatusPopulatedWrapperCopyWithImpl(_DbStatusPopulatedWrapper _value,
      $Res Function(_DbStatusPopulatedWrapper) _then)
      : super(_value, (v) => _then(v as _DbStatusPopulatedWrapper));

  @override
  _DbStatusPopulatedWrapper get _value =>
      super._value as _DbStatusPopulatedWrapper;

  @override
  $Res call({
    Object? dbStatusPopulated = freezed,
  }) {
    return _then(_DbStatusPopulatedWrapper(
      dbStatusPopulated: dbStatusPopulated == freezed
          ? _value.dbStatusPopulated
          : dbStatusPopulated // ignore: cast_nullable_to_non_nullable
              as DbStatusPopulated,
    ));
  }
}

/// @nodoc

class _$_DbStatusPopulatedWrapper extends _DbStatusPopulatedWrapper {
  const _$_DbStatusPopulatedWrapper({required this.dbStatusPopulated})
      : super._();

  @override
  final DbStatusPopulated dbStatusPopulated;

  @override
  String toString() {
    return 'DbStatusPopulatedWrapper(dbStatusPopulated: $dbStatusPopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbStatusPopulatedWrapper &&
            (identical(other.dbStatusPopulated, dbStatusPopulated) ||
                other.dbStatusPopulated == dbStatusPopulated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbStatusPopulated);

  @JsonKey(ignore: true)
  @override
  _$DbStatusPopulatedWrapperCopyWith<_DbStatusPopulatedWrapper> get copyWith =>
      __$DbStatusPopulatedWrapperCopyWithImpl<_DbStatusPopulatedWrapper>(
          this, _$identity);
}

abstract class _DbStatusPopulatedWrapper extends DbStatusPopulatedWrapper {
  const factory _DbStatusPopulatedWrapper(
          {required DbStatusPopulated dbStatusPopulated}) =
      _$_DbStatusPopulatedWrapper;
  const _DbStatusPopulatedWrapper._() : super._();

  @override
  DbStatusPopulated get dbStatusPopulated;
  @override
  @JsonKey(ignore: true)
  _$DbStatusPopulatedWrapperCopyWith<_DbStatusPopulatedWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbStatusPopulatedTearOff {
  const _$DbStatusPopulatedTearOff();

  _DbStatusPopulated call(
      {required DbStatus dbStatus,
      required DbAccount dbAccount,
      required DbStatus? reblogDbStatus,
      required DbAccount? reblogDbStatusAccount,
      required DbStatus? replyDbStatus,
      required DbAccount? replyDbStatusAccount,
      required DbStatus? replyReblogDbStatus,
      required DbAccount? replyReblogDbStatusAccount}) {
    return _DbStatusPopulated(
      dbStatus: dbStatus,
      dbAccount: dbAccount,
      reblogDbStatus: reblogDbStatus,
      reblogDbStatusAccount: reblogDbStatusAccount,
      replyDbStatus: replyDbStatus,
      replyDbStatusAccount: replyDbStatusAccount,
      replyReblogDbStatus: replyReblogDbStatus,
      replyReblogDbStatusAccount: replyReblogDbStatusAccount,
    );
  }
}

/// @nodoc
const $DbStatusPopulated = _$DbStatusPopulatedTearOff();

/// @nodoc
mixin _$DbStatusPopulated {
  DbStatus get dbStatus => throw _privateConstructorUsedError;
  DbAccount get dbAccount => throw _privateConstructorUsedError;
  DbStatus? get reblogDbStatus => throw _privateConstructorUsedError;
  DbAccount? get reblogDbStatusAccount => throw _privateConstructorUsedError;
  DbStatus? get replyDbStatus => throw _privateConstructorUsedError;
  DbAccount? get replyDbStatusAccount => throw _privateConstructorUsedError;
  DbStatus? get replyReblogDbStatus => throw _privateConstructorUsedError;
  DbAccount? get replyReblogDbStatusAccount =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbStatusPopulatedCopyWith<DbStatusPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbStatusPopulatedCopyWith<$Res> {
  factory $DbStatusPopulatedCopyWith(
          DbStatusPopulated value, $Res Function(DbStatusPopulated) then) =
      _$DbStatusPopulatedCopyWithImpl<$Res>;
  $Res call(
      {DbStatus dbStatus,
      DbAccount dbAccount,
      DbStatus? reblogDbStatus,
      DbAccount? reblogDbStatusAccount,
      DbStatus? replyDbStatus,
      DbAccount? replyDbStatusAccount,
      DbStatus? replyReblogDbStatus,
      DbAccount? replyReblogDbStatusAccount});
}

/// @nodoc
class _$DbStatusPopulatedCopyWithImpl<$Res>
    implements $DbStatusPopulatedCopyWith<$Res> {
  _$DbStatusPopulatedCopyWithImpl(this._value, this._then);

  final DbStatusPopulated _value;
  // ignore: unused_field
  final $Res Function(DbStatusPopulated) _then;

  @override
  $Res call({
    Object? dbStatus = freezed,
    Object? dbAccount = freezed,
    Object? reblogDbStatus = freezed,
    Object? reblogDbStatusAccount = freezed,
    Object? replyDbStatus = freezed,
    Object? replyDbStatusAccount = freezed,
    Object? replyReblogDbStatus = freezed,
    Object? replyReblogDbStatusAccount = freezed,
  }) {
    return _then(_value.copyWith(
      dbStatus: dbStatus == freezed
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
      reblogDbStatus: reblogDbStatus == freezed
          ? _value.reblogDbStatus
          : reblogDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      reblogDbStatusAccount: reblogDbStatusAccount == freezed
          ? _value.reblogDbStatusAccount
          : reblogDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      replyDbStatus: replyDbStatus == freezed
          ? _value.replyDbStatus
          : replyDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      replyDbStatusAccount: replyDbStatusAccount == freezed
          ? _value.replyDbStatusAccount
          : replyDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      replyReblogDbStatus: replyReblogDbStatus == freezed
          ? _value.replyReblogDbStatus
          : replyReblogDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      replyReblogDbStatusAccount: replyReblogDbStatusAccount == freezed
          ? _value.replyReblogDbStatusAccount
          : replyReblogDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
    ));
  }
}

/// @nodoc
abstract class _$DbStatusPopulatedCopyWith<$Res>
    implements $DbStatusPopulatedCopyWith<$Res> {
  factory _$DbStatusPopulatedCopyWith(
          _DbStatusPopulated value, $Res Function(_DbStatusPopulated) then) =
      __$DbStatusPopulatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbStatus dbStatus,
      DbAccount dbAccount,
      DbStatus? reblogDbStatus,
      DbAccount? reblogDbStatusAccount,
      DbStatus? replyDbStatus,
      DbAccount? replyDbStatusAccount,
      DbStatus? replyReblogDbStatus,
      DbAccount? replyReblogDbStatusAccount});
}

/// @nodoc
class __$DbStatusPopulatedCopyWithImpl<$Res>
    extends _$DbStatusPopulatedCopyWithImpl<$Res>
    implements _$DbStatusPopulatedCopyWith<$Res> {
  __$DbStatusPopulatedCopyWithImpl(
      _DbStatusPopulated _value, $Res Function(_DbStatusPopulated) _then)
      : super(_value, (v) => _then(v as _DbStatusPopulated));

  @override
  _DbStatusPopulated get _value => super._value as _DbStatusPopulated;

  @override
  $Res call({
    Object? dbStatus = freezed,
    Object? dbAccount = freezed,
    Object? reblogDbStatus = freezed,
    Object? reblogDbStatusAccount = freezed,
    Object? replyDbStatus = freezed,
    Object? replyDbStatusAccount = freezed,
    Object? replyReblogDbStatus = freezed,
    Object? replyReblogDbStatusAccount = freezed,
  }) {
    return _then(_DbStatusPopulated(
      dbStatus: dbStatus == freezed
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
      reblogDbStatus: reblogDbStatus == freezed
          ? _value.reblogDbStatus
          : reblogDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      reblogDbStatusAccount: reblogDbStatusAccount == freezed
          ? _value.reblogDbStatusAccount
          : reblogDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      replyDbStatus: replyDbStatus == freezed
          ? _value.replyDbStatus
          : replyDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      replyDbStatusAccount: replyDbStatusAccount == freezed
          ? _value.replyDbStatusAccount
          : replyDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      replyReblogDbStatus: replyReblogDbStatus == freezed
          ? _value.replyReblogDbStatus
          : replyReblogDbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      replyReblogDbStatusAccount: replyReblogDbStatusAccount == freezed
          ? _value.replyReblogDbStatusAccount
          : replyReblogDbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
    ));
  }
}

/// @nodoc

class _$_DbStatusPopulated extends _DbStatusPopulated {
  const _$_DbStatusPopulated(
      {required this.dbStatus,
      required this.dbAccount,
      required this.reblogDbStatus,
      required this.reblogDbStatusAccount,
      required this.replyDbStatus,
      required this.replyDbStatusAccount,
      required this.replyReblogDbStatus,
      required this.replyReblogDbStatusAccount})
      : super._();

  @override
  final DbStatus dbStatus;
  @override
  final DbAccount dbAccount;
  @override
  final DbStatus? reblogDbStatus;
  @override
  final DbAccount? reblogDbStatusAccount;
  @override
  final DbStatus? replyDbStatus;
  @override
  final DbAccount? replyDbStatusAccount;
  @override
  final DbStatus? replyReblogDbStatus;
  @override
  final DbAccount? replyReblogDbStatusAccount;

  @override
  String toString() {
    return 'DbStatusPopulated(dbStatus: $dbStatus, dbAccount: $dbAccount, reblogDbStatus: $reblogDbStatus, reblogDbStatusAccount: $reblogDbStatusAccount, replyDbStatus: $replyDbStatus, replyDbStatusAccount: $replyDbStatusAccount, replyReblogDbStatus: $replyReblogDbStatus, replyReblogDbStatusAccount: $replyReblogDbStatusAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbStatusPopulated &&
            const DeepCollectionEquality().equals(other.dbStatus, dbStatus) &&
            const DeepCollectionEquality().equals(other.dbAccount, dbAccount) &&
            const DeepCollectionEquality()
                .equals(other.reblogDbStatus, reblogDbStatus) &&
            const DeepCollectionEquality()
                .equals(other.reblogDbStatusAccount, reblogDbStatusAccount) &&
            const DeepCollectionEquality()
                .equals(other.replyDbStatus, replyDbStatus) &&
            const DeepCollectionEquality()
                .equals(other.replyDbStatusAccount, replyDbStatusAccount) &&
            const DeepCollectionEquality()
                .equals(other.replyReblogDbStatus, replyReblogDbStatus) &&
            const DeepCollectionEquality().equals(
                other.replyReblogDbStatusAccount, replyReblogDbStatusAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dbStatus),
      const DeepCollectionEquality().hash(dbAccount),
      const DeepCollectionEquality().hash(reblogDbStatus),
      const DeepCollectionEquality().hash(reblogDbStatusAccount),
      const DeepCollectionEquality().hash(replyDbStatus),
      const DeepCollectionEquality().hash(replyDbStatusAccount),
      const DeepCollectionEquality().hash(replyReblogDbStatus),
      const DeepCollectionEquality().hash(replyReblogDbStatusAccount));

  @JsonKey(ignore: true)
  @override
  _$DbStatusPopulatedCopyWith<_DbStatusPopulated> get copyWith =>
      __$DbStatusPopulatedCopyWithImpl<_DbStatusPopulated>(this, _$identity);
}

abstract class _DbStatusPopulated extends DbStatusPopulated {
  const factory _DbStatusPopulated(
      {required DbStatus dbStatus,
      required DbAccount dbAccount,
      required DbStatus? reblogDbStatus,
      required DbAccount? reblogDbStatusAccount,
      required DbStatus? replyDbStatus,
      required DbAccount? replyDbStatusAccount,
      required DbStatus? replyReblogDbStatus,
      required DbAccount? replyReblogDbStatusAccount}) = _$_DbStatusPopulated;
  const _DbStatusPopulated._() : super._();

  @override
  DbStatus get dbStatus;
  @override
  DbAccount get dbAccount;
  @override
  DbStatus? get reblogDbStatus;
  @override
  DbAccount? get reblogDbStatusAccount;
  @override
  DbStatus? get replyDbStatus;
  @override
  DbAccount? get replyDbStatusAccount;
  @override
  DbStatus? get replyReblogDbStatus;
  @override
  DbAccount? get replyReblogDbStatusAccount;
  @override
  @JsonKey(ignore: true)
  _$DbStatusPopulatedCopyWith<_DbStatusPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

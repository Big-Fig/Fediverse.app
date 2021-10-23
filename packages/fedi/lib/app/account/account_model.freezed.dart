// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DbAccountPopulatedTearOff {
  const _$DbAccountPopulatedTearOff();

  _DbAccountPopulated call({required DbAccount dbAccount}) {
    return _DbAccountPopulated(
      dbAccount: dbAccount,
    );
  }
}

/// @nodoc
const $DbAccountPopulated = _$DbAccountPopulatedTearOff();

/// @nodoc
mixin _$DbAccountPopulated {
  DbAccount get dbAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbAccountPopulatedCopyWith<DbAccountPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbAccountPopulatedCopyWith<$Res> {
  factory $DbAccountPopulatedCopyWith(
          DbAccountPopulated value, $Res Function(DbAccountPopulated) then) =
      _$DbAccountPopulatedCopyWithImpl<$Res>;
  $Res call({DbAccount dbAccount});
}

/// @nodoc
class _$DbAccountPopulatedCopyWithImpl<$Res>
    implements $DbAccountPopulatedCopyWith<$Res> {
  _$DbAccountPopulatedCopyWithImpl(this._value, this._then);

  final DbAccountPopulated _value;
  // ignore: unused_field
  final $Res Function(DbAccountPopulated) _then;

  @override
  $Res call({
    Object? dbAccount = freezed,
  }) {
    return _then(_value.copyWith(
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
    ));
  }
}

/// @nodoc
abstract class _$DbAccountPopulatedCopyWith<$Res>
    implements $DbAccountPopulatedCopyWith<$Res> {
  factory _$DbAccountPopulatedCopyWith(
          _DbAccountPopulated value, $Res Function(_DbAccountPopulated) then) =
      __$DbAccountPopulatedCopyWithImpl<$Res>;
  @override
  $Res call({DbAccount dbAccount});
}

/// @nodoc
class __$DbAccountPopulatedCopyWithImpl<$Res>
    extends _$DbAccountPopulatedCopyWithImpl<$Res>
    implements _$DbAccountPopulatedCopyWith<$Res> {
  __$DbAccountPopulatedCopyWithImpl(
      _DbAccountPopulated _value, $Res Function(_DbAccountPopulated) _then)
      : super(_value, (v) => _then(v as _DbAccountPopulated));

  @override
  _DbAccountPopulated get _value => super._value as _DbAccountPopulated;

  @override
  $Res call({
    Object? dbAccount = freezed,
  }) {
    return _then(_DbAccountPopulated(
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
    ));
  }
}

/// @nodoc

class _$_DbAccountPopulated implements _DbAccountPopulated {
  const _$_DbAccountPopulated({required this.dbAccount});

  @override
  final DbAccount dbAccount;

  @override
  String toString() {
    return 'DbAccountPopulated(dbAccount: $dbAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DbAccountPopulated &&
            (identical(other.dbAccount, dbAccount) ||
                const DeepCollectionEquality()
                    .equals(other.dbAccount, dbAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dbAccount);

  @JsonKey(ignore: true)
  @override
  _$DbAccountPopulatedCopyWith<_DbAccountPopulated> get copyWith =>
      __$DbAccountPopulatedCopyWithImpl<_DbAccountPopulated>(this, _$identity);
}

abstract class _DbAccountPopulated implements DbAccountPopulated {
  const factory _DbAccountPopulated({required DbAccount dbAccount}) =
      _$_DbAccountPopulated;

  @override
  DbAccount get dbAccount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DbAccountPopulatedCopyWith<_DbAccountPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DbUnifediChatPopulatedTearOff {
  const _$DbUnifediChatPopulatedTearOff();

  _DbUnifediChatPopulated call(
      {required DbChat dbChat, required DbAccount dbAccount}) {
    return _DbUnifediChatPopulated(
      dbChat: dbChat,
      dbAccount: dbAccount,
    );
  }
}

/// @nodoc
const $DbUnifediChatPopulated = _$DbUnifediChatPopulatedTearOff();

/// @nodoc
mixin _$DbUnifediChatPopulated {
  DbChat get dbChat => throw _privateConstructorUsedError;
  DbAccount get dbAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbUnifediChatPopulatedCopyWith<DbUnifediChatPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbUnifediChatPopulatedCopyWith<$Res> {
  factory $DbUnifediChatPopulatedCopyWith(DbUnifediChatPopulated value,
          $Res Function(DbUnifediChatPopulated) then) =
      _$DbUnifediChatPopulatedCopyWithImpl<$Res>;
  $Res call({DbChat dbChat, DbAccount dbAccount});
}

/// @nodoc
class _$DbUnifediChatPopulatedCopyWithImpl<$Res>
    implements $DbUnifediChatPopulatedCopyWith<$Res> {
  _$DbUnifediChatPopulatedCopyWithImpl(this._value, this._then);

  final DbUnifediChatPopulated _value;
  // ignore: unused_field
  final $Res Function(DbUnifediChatPopulated) _then;

  @override
  $Res call({
    Object? dbChat = freezed,
    Object? dbAccount = freezed,
  }) {
    return _then(_value.copyWith(
      dbChat: dbChat == freezed
          ? _value.dbChat
          : dbChat // ignore: cast_nullable_to_non_nullable
              as DbChat,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
    ));
  }
}

/// @nodoc
abstract class _$DbUnifediChatPopulatedCopyWith<$Res>
    implements $DbUnifediChatPopulatedCopyWith<$Res> {
  factory _$DbUnifediChatPopulatedCopyWith(_DbUnifediChatPopulated value,
          $Res Function(_DbUnifediChatPopulated) then) =
      __$DbUnifediChatPopulatedCopyWithImpl<$Res>;
  @override
  $Res call({DbChat dbChat, DbAccount dbAccount});
}

/// @nodoc
class __$DbUnifediChatPopulatedCopyWithImpl<$Res>
    extends _$DbUnifediChatPopulatedCopyWithImpl<$Res>
    implements _$DbUnifediChatPopulatedCopyWith<$Res> {
  __$DbUnifediChatPopulatedCopyWithImpl(_DbUnifediChatPopulated _value,
      $Res Function(_DbUnifediChatPopulated) _then)
      : super(_value, (v) => _then(v as _DbUnifediChatPopulated));

  @override
  _DbUnifediChatPopulated get _value => super._value as _DbUnifediChatPopulated;

  @override
  $Res call({
    Object? dbChat = freezed,
    Object? dbAccount = freezed,
  }) {
    return _then(_DbUnifediChatPopulated(
      dbChat: dbChat == freezed
          ? _value.dbChat
          : dbChat // ignore: cast_nullable_to_non_nullable
              as DbChat,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount,
    ));
  }
}

/// @nodoc

class _$_DbUnifediChatPopulated implements _DbUnifediChatPopulated {
  const _$_DbUnifediChatPopulated(
      {required this.dbChat, required this.dbAccount});

  @override
  final DbChat dbChat;
  @override
  final DbAccount dbAccount;

  @override
  String toString() {
    return 'DbUnifediChatPopulated(dbChat: $dbChat, dbAccount: $dbAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbUnifediChatPopulated &&
            const DeepCollectionEquality().equals(other.dbChat, dbChat) &&
            const DeepCollectionEquality().equals(other.dbAccount, dbAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dbChat),
      const DeepCollectionEquality().hash(dbAccount));

  @JsonKey(ignore: true)
  @override
  _$DbUnifediChatPopulatedCopyWith<_DbUnifediChatPopulated> get copyWith =>
      __$DbUnifediChatPopulatedCopyWithImpl<_DbUnifediChatPopulated>(
          this, _$identity);
}

abstract class _DbUnifediChatPopulated implements DbUnifediChatPopulated {
  const factory _DbUnifediChatPopulated(
      {required DbChat dbChat,
      required DbAccount dbAccount}) = _$_DbUnifediChatPopulated;

  @override
  DbChat get dbChat;
  @override
  DbAccount get dbAccount;
  @override
  @JsonKey(ignore: true)
  _$DbUnifediChatPopulatedCopyWith<_DbUnifediChatPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbUnifediChatWithLastMessagePopulatedTearOff {
  const _$DbUnifediChatWithLastMessagePopulatedTearOff();

  _DbUnifediChatWithLastMessagePopulated call(
      {required DbUnifediChatPopulated dbUnifediChatPopulated,
      required DbChatMessagePopulated? dbChatMessagePopulated}) {
    return _DbUnifediChatWithLastMessagePopulated(
      dbUnifediChatPopulated: dbUnifediChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated,
    );
  }
}

/// @nodoc
const $DbUnifediChatWithLastMessagePopulated =
    _$DbUnifediChatWithLastMessagePopulatedTearOff();

/// @nodoc
mixin _$DbUnifediChatWithLastMessagePopulated {
  DbUnifediChatPopulated get dbUnifediChatPopulated =>
      throw _privateConstructorUsedError;
  DbChatMessagePopulated? get dbChatMessagePopulated =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbUnifediChatWithLastMessagePopulatedCopyWith<
          DbUnifediChatWithLastMessagePopulated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res> {
  factory $DbUnifediChatWithLastMessagePopulatedCopyWith(
          DbUnifediChatWithLastMessagePopulated value,
          $Res Function(DbUnifediChatWithLastMessagePopulated) then) =
      _$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<$Res>;
  $Res call(
      {DbUnifediChatPopulated dbUnifediChatPopulated,
      DbChatMessagePopulated? dbChatMessagePopulated});

  $DbUnifediChatPopulatedCopyWith<$Res> get dbUnifediChatPopulated;
  $DbChatMessagePopulatedCopyWith<$Res>? get dbChatMessagePopulated;
}

/// @nodoc
class _$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<$Res>
    implements $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res> {
  _$DbUnifediChatWithLastMessagePopulatedCopyWithImpl(this._value, this._then);

  final DbUnifediChatWithLastMessagePopulated _value;
  // ignore: unused_field
  final $Res Function(DbUnifediChatWithLastMessagePopulated) _then;

  @override
  $Res call({
    Object? dbUnifediChatPopulated = freezed,
    Object? dbChatMessagePopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbUnifediChatPopulated: dbUnifediChatPopulated == freezed
          ? _value.dbUnifediChatPopulated
          : dbUnifediChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbUnifediChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated == freezed
          ? _value.dbChatMessagePopulated
          : dbChatMessagePopulated // ignore: cast_nullable_to_non_nullable
              as DbChatMessagePopulated?,
    ));
  }

  @override
  $DbUnifediChatPopulatedCopyWith<$Res> get dbUnifediChatPopulated {
    return $DbUnifediChatPopulatedCopyWith<$Res>(_value.dbUnifediChatPopulated,
        (value) {
      return _then(_value.copyWith(dbUnifediChatPopulated: value));
    });
  }

  @override
  $DbChatMessagePopulatedCopyWith<$Res>? get dbChatMessagePopulated {
    if (_value.dbChatMessagePopulated == null) {
      return null;
    }

    return $DbChatMessagePopulatedCopyWith<$Res>(_value.dbChatMessagePopulated!,
        (value) {
      return _then(_value.copyWith(dbChatMessagePopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbUnifediChatWithLastMessagePopulatedCopyWith<$Res>
    implements $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res> {
  factory _$DbUnifediChatWithLastMessagePopulatedCopyWith(
          _DbUnifediChatWithLastMessagePopulated value,
          $Res Function(_DbUnifediChatWithLastMessagePopulated) then) =
      __$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbUnifediChatPopulated dbUnifediChatPopulated,
      DbChatMessagePopulated? dbChatMessagePopulated});

  @override
  $DbUnifediChatPopulatedCopyWith<$Res> get dbUnifediChatPopulated;
  @override
  $DbChatMessagePopulatedCopyWith<$Res>? get dbChatMessagePopulated;
}

/// @nodoc
class __$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<$Res>
    extends _$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<$Res>
    implements _$DbUnifediChatWithLastMessagePopulatedCopyWith<$Res> {
  __$DbUnifediChatWithLastMessagePopulatedCopyWithImpl(
      _DbUnifediChatWithLastMessagePopulated _value,
      $Res Function(_DbUnifediChatWithLastMessagePopulated) _then)
      : super(
            _value, (v) => _then(v as _DbUnifediChatWithLastMessagePopulated));

  @override
  _DbUnifediChatWithLastMessagePopulated get _value =>
      super._value as _DbUnifediChatWithLastMessagePopulated;

  @override
  $Res call({
    Object? dbUnifediChatPopulated = freezed,
    Object? dbChatMessagePopulated = freezed,
  }) {
    return _then(_DbUnifediChatWithLastMessagePopulated(
      dbUnifediChatPopulated: dbUnifediChatPopulated == freezed
          ? _value.dbUnifediChatPopulated
          : dbUnifediChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbUnifediChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated == freezed
          ? _value.dbChatMessagePopulated
          : dbChatMessagePopulated // ignore: cast_nullable_to_non_nullable
              as DbChatMessagePopulated?,
    ));
  }
}

/// @nodoc

class _$_DbUnifediChatWithLastMessagePopulated
    implements _DbUnifediChatWithLastMessagePopulated {
  const _$_DbUnifediChatWithLastMessagePopulated(
      {required this.dbUnifediChatPopulated,
      required this.dbChatMessagePopulated});

  @override
  final DbUnifediChatPopulated dbUnifediChatPopulated;
  @override
  final DbChatMessagePopulated? dbChatMessagePopulated;

  @override
  String toString() {
    return 'DbUnifediChatWithLastMessagePopulated(dbUnifediChatPopulated: $dbUnifediChatPopulated, dbChatMessagePopulated: $dbChatMessagePopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbUnifediChatWithLastMessagePopulated &&
            (identical(other.dbUnifediChatPopulated, dbUnifediChatPopulated) ||
                other.dbUnifediChatPopulated == dbUnifediChatPopulated) &&
            (identical(other.dbChatMessagePopulated, dbChatMessagePopulated) ||
                other.dbChatMessagePopulated == dbChatMessagePopulated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dbUnifediChatPopulated, dbChatMessagePopulated);

  @JsonKey(ignore: true)
  @override
  _$DbUnifediChatWithLastMessagePopulatedCopyWith<
          _DbUnifediChatWithLastMessagePopulated>
      get copyWith => __$DbUnifediChatWithLastMessagePopulatedCopyWithImpl<
          _DbUnifediChatWithLastMessagePopulated>(this, _$identity);
}

abstract class _DbUnifediChatWithLastMessagePopulated
    implements DbUnifediChatWithLastMessagePopulated {
  const factory _DbUnifediChatWithLastMessagePopulated(
          {required DbUnifediChatPopulated dbUnifediChatPopulated,
          required DbChatMessagePopulated? dbChatMessagePopulated}) =
      _$_DbUnifediChatWithLastMessagePopulated;

  @override
  DbUnifediChatPopulated get dbUnifediChatPopulated;
  @override
  DbChatMessagePopulated? get dbChatMessagePopulated;
  @override
  @JsonKey(ignore: true)
  _$DbUnifediChatWithLastMessagePopulatedCopyWith<
          _DbUnifediChatWithLastMessagePopulated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbUnifediChatWithLastMessagePopulatedWrapperTearOff {
  const _$DbUnifediChatWithLastMessagePopulatedWrapperTearOff();

  _DbUnifediChatWithLastMessagePopulatedWrapper call(
      {required DbUnifediChatWithLastMessagePopulated
          dbUnifediChatWithLastMessagePopulated}) {
    return _DbUnifediChatWithLastMessagePopulatedWrapper(
      dbUnifediChatWithLastMessagePopulated:
          dbUnifediChatWithLastMessagePopulated,
    );
  }
}

/// @nodoc
const $DbUnifediChatWithLastMessagePopulatedWrapper =
    _$DbUnifediChatWithLastMessagePopulatedWrapperTearOff();

/// @nodoc
mixin _$DbUnifediChatWithLastMessagePopulatedWrapper {
  DbUnifediChatWithLastMessagePopulated
      get dbUnifediChatWithLastMessagePopulated =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<
          DbUnifediChatWithLastMessagePopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  factory $DbUnifediChatWithLastMessagePopulatedWrapperCopyWith(
          DbUnifediChatWithLastMessagePopulatedWrapper value,
          $Res Function(DbUnifediChatWithLastMessagePopulatedWrapper) then) =
      _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>;
  $Res call(
      {DbUnifediChatWithLastMessagePopulated
          dbUnifediChatWithLastMessagePopulated});

  $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res>
      get dbUnifediChatWithLastMessagePopulated;
}

/// @nodoc
class _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    implements $DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl(
      this._value, this._then);

  final DbUnifediChatWithLastMessagePopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbUnifediChatWithLastMessagePopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbUnifediChatWithLastMessagePopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbUnifediChatWithLastMessagePopulated:
          dbUnifediChatWithLastMessagePopulated == freezed
              ? _value.dbUnifediChatWithLastMessagePopulated
              : dbUnifediChatWithLastMessagePopulated // ignore: cast_nullable_to_non_nullable
                  as DbUnifediChatWithLastMessagePopulated,
    ));
  }

  @override
  $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res>
      get dbUnifediChatWithLastMessagePopulated {
    return $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res>(
        _value.dbUnifediChatWithLastMessagePopulated, (value) {
      return _then(
          _value.copyWith(dbUnifediChatWithLastMessagePopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<$Res>
    implements $DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  factory _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWith(
          _DbUnifediChatWithLastMessagePopulatedWrapper value,
          $Res Function(_DbUnifediChatWithLastMessagePopulatedWrapper) then) =
      __$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbUnifediChatWithLastMessagePopulated
          dbUnifediChatWithLastMessagePopulated});

  @override
  $DbUnifediChatWithLastMessagePopulatedCopyWith<$Res>
      get dbUnifediChatWithLastMessagePopulated;
}

/// @nodoc
class __$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    extends _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    implements _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  __$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl(
      _DbUnifediChatWithLastMessagePopulatedWrapper _value,
      $Res Function(_DbUnifediChatWithLastMessagePopulatedWrapper) _then)
      : super(_value,
            (v) => _then(v as _DbUnifediChatWithLastMessagePopulatedWrapper));

  @override
  _DbUnifediChatWithLastMessagePopulatedWrapper get _value =>
      super._value as _DbUnifediChatWithLastMessagePopulatedWrapper;

  @override
  $Res call({
    Object? dbUnifediChatWithLastMessagePopulated = freezed,
  }) {
    return _then(_DbUnifediChatWithLastMessagePopulatedWrapper(
      dbUnifediChatWithLastMessagePopulated:
          dbUnifediChatWithLastMessagePopulated == freezed
              ? _value.dbUnifediChatWithLastMessagePopulated
              : dbUnifediChatWithLastMessagePopulated // ignore: cast_nullable_to_non_nullable
                  as DbUnifediChatWithLastMessagePopulated,
    ));
  }
}

/// @nodoc

class _$_DbUnifediChatWithLastMessagePopulatedWrapper
    extends _DbUnifediChatWithLastMessagePopulatedWrapper {
  const _$_DbUnifediChatWithLastMessagePopulatedWrapper(
      {required this.dbUnifediChatWithLastMessagePopulated})
      : super._();

  @override
  final DbUnifediChatWithLastMessagePopulated
      dbUnifediChatWithLastMessagePopulated;

  @override
  String toString() {
    return 'DbUnifediChatWithLastMessagePopulatedWrapper(dbUnifediChatWithLastMessagePopulated: $dbUnifediChatWithLastMessagePopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbUnifediChatWithLastMessagePopulatedWrapper &&
            (identical(other.dbUnifediChatWithLastMessagePopulated,
                    dbUnifediChatWithLastMessagePopulated) ||
                other.dbUnifediChatWithLastMessagePopulated ==
                    dbUnifediChatWithLastMessagePopulated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dbUnifediChatWithLastMessagePopulated);

  @JsonKey(ignore: true)
  @override
  _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<
          _DbUnifediChatWithLastMessagePopulatedWrapper>
      get copyWith =>
          __$DbUnifediChatWithLastMessagePopulatedWrapperCopyWithImpl<
              _DbUnifediChatWithLastMessagePopulatedWrapper>(this, _$identity);
}

abstract class _DbUnifediChatWithLastMessagePopulatedWrapper
    extends DbUnifediChatWithLastMessagePopulatedWrapper {
  const factory _DbUnifediChatWithLastMessagePopulatedWrapper(
          {required DbUnifediChatWithLastMessagePopulated
              dbUnifediChatWithLastMessagePopulated}) =
      _$_DbUnifediChatWithLastMessagePopulatedWrapper;
  const _DbUnifediChatWithLastMessagePopulatedWrapper._() : super._();

  @override
  DbUnifediChatWithLastMessagePopulated
      get dbUnifediChatWithLastMessagePopulated;
  @override
  @JsonKey(ignore: true)
  _$DbUnifediChatWithLastMessagePopulatedWrapperCopyWith<
          _DbUnifediChatWithLastMessagePopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbUnifediChatPopulatedWrapperTearOff {
  const _$DbUnifediChatPopulatedWrapperTearOff();

  _DbUnifediChatPopulatedWrapper call(
      {required DbUnifediChatPopulated dbChatPopulated}) {
    return _DbUnifediChatPopulatedWrapper(
      dbChatPopulated: dbChatPopulated,
    );
  }
}

/// @nodoc
const $DbUnifediChatPopulatedWrapper = _$DbUnifediChatPopulatedWrapperTearOff();

/// @nodoc
mixin _$DbUnifediChatPopulatedWrapper {
  DbUnifediChatPopulated get dbChatPopulated =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbUnifediChatPopulatedWrapperCopyWith<DbUnifediChatPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbUnifediChatPopulatedWrapperCopyWith<$Res> {
  factory $DbUnifediChatPopulatedWrapperCopyWith(
          DbUnifediChatPopulatedWrapper value,
          $Res Function(DbUnifediChatPopulatedWrapper) then) =
      _$DbUnifediChatPopulatedWrapperCopyWithImpl<$Res>;
  $Res call({DbUnifediChatPopulated dbChatPopulated});

  $DbUnifediChatPopulatedCopyWith<$Res> get dbChatPopulated;
}

/// @nodoc
class _$DbUnifediChatPopulatedWrapperCopyWithImpl<$Res>
    implements $DbUnifediChatPopulatedWrapperCopyWith<$Res> {
  _$DbUnifediChatPopulatedWrapperCopyWithImpl(this._value, this._then);

  final DbUnifediChatPopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbUnifediChatPopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbChatPopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbChatPopulated: dbChatPopulated == freezed
          ? _value.dbChatPopulated
          : dbChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbUnifediChatPopulated,
    ));
  }

  @override
  $DbUnifediChatPopulatedCopyWith<$Res> get dbChatPopulated {
    return $DbUnifediChatPopulatedCopyWith<$Res>(_value.dbChatPopulated,
        (value) {
      return _then(_value.copyWith(dbChatPopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbUnifediChatPopulatedWrapperCopyWith<$Res>
    implements $DbUnifediChatPopulatedWrapperCopyWith<$Res> {
  factory _$DbUnifediChatPopulatedWrapperCopyWith(
          _DbUnifediChatPopulatedWrapper value,
          $Res Function(_DbUnifediChatPopulatedWrapper) then) =
      __$DbUnifediChatPopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call({DbUnifediChatPopulated dbChatPopulated});

  @override
  $DbUnifediChatPopulatedCopyWith<$Res> get dbChatPopulated;
}

/// @nodoc
class __$DbUnifediChatPopulatedWrapperCopyWithImpl<$Res>
    extends _$DbUnifediChatPopulatedWrapperCopyWithImpl<$Res>
    implements _$DbUnifediChatPopulatedWrapperCopyWith<$Res> {
  __$DbUnifediChatPopulatedWrapperCopyWithImpl(
      _DbUnifediChatPopulatedWrapper _value,
      $Res Function(_DbUnifediChatPopulatedWrapper) _then)
      : super(_value, (v) => _then(v as _DbUnifediChatPopulatedWrapper));

  @override
  _DbUnifediChatPopulatedWrapper get _value =>
      super._value as _DbUnifediChatPopulatedWrapper;

  @override
  $Res call({
    Object? dbChatPopulated = freezed,
  }) {
    return _then(_DbUnifediChatPopulatedWrapper(
      dbChatPopulated: dbChatPopulated == freezed
          ? _value.dbChatPopulated
          : dbChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbUnifediChatPopulated,
    ));
  }
}

/// @nodoc

class _$_DbUnifediChatPopulatedWrapper extends _DbUnifediChatPopulatedWrapper {
  const _$_DbUnifediChatPopulatedWrapper({required this.dbChatPopulated})
      : super._();

  @override
  final DbUnifediChatPopulated dbChatPopulated;

  @override
  String toString() {
    return 'DbUnifediChatPopulatedWrapper(dbChatPopulated: $dbChatPopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbUnifediChatPopulatedWrapper &&
            (identical(other.dbChatPopulated, dbChatPopulated) ||
                other.dbChatPopulated == dbChatPopulated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbChatPopulated);

  @JsonKey(ignore: true)
  @override
  _$DbUnifediChatPopulatedWrapperCopyWith<_DbUnifediChatPopulatedWrapper>
      get copyWith => __$DbUnifediChatPopulatedWrapperCopyWithImpl<
          _DbUnifediChatPopulatedWrapper>(this, _$identity);
}

abstract class _DbUnifediChatPopulatedWrapper
    extends DbUnifediChatPopulatedWrapper {
  const factory _DbUnifediChatPopulatedWrapper(
          {required DbUnifediChatPopulated dbChatPopulated}) =
      _$_DbUnifediChatPopulatedWrapper;
  const _DbUnifediChatPopulatedWrapper._() : super._();

  @override
  DbUnifediChatPopulated get dbChatPopulated;
  @override
  @JsonKey(ignore: true)
  _$DbUnifediChatPopulatedWrapperCopyWith<_DbUnifediChatPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

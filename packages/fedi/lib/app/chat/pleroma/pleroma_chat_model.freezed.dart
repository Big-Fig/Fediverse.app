// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DbPleromaChatPopulatedTearOff {
  const _$DbPleromaChatPopulatedTearOff();

  _DbPleromaChatPopulated call(
      {required DbChat dbChat, required DbAccount dbAccount}) {
    return _DbPleromaChatPopulated(
      dbChat: dbChat,
      dbAccount: dbAccount,
    );
  }
}

/// @nodoc
const $DbPleromaChatPopulated = _$DbPleromaChatPopulatedTearOff();

/// @nodoc
mixin _$DbPleromaChatPopulated {
  DbChat get dbChat => throw _privateConstructorUsedError;
  DbAccount get dbAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbPleromaChatPopulatedCopyWith<DbPleromaChatPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbPleromaChatPopulatedCopyWith<$Res> {
  factory $DbPleromaChatPopulatedCopyWith(DbPleromaChatPopulated value,
          $Res Function(DbPleromaChatPopulated) then) =
      _$DbPleromaChatPopulatedCopyWithImpl<$Res>;
  $Res call({DbChat dbChat, DbAccount dbAccount});
}

/// @nodoc
class _$DbPleromaChatPopulatedCopyWithImpl<$Res>
    implements $DbPleromaChatPopulatedCopyWith<$Res> {
  _$DbPleromaChatPopulatedCopyWithImpl(this._value, this._then);

  final DbPleromaChatPopulated _value;
  // ignore: unused_field
  final $Res Function(DbPleromaChatPopulated) _then;

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
abstract class _$DbPleromaChatPopulatedCopyWith<$Res>
    implements $DbPleromaChatPopulatedCopyWith<$Res> {
  factory _$DbPleromaChatPopulatedCopyWith(_DbPleromaChatPopulated value,
          $Res Function(_DbPleromaChatPopulated) then) =
      __$DbPleromaChatPopulatedCopyWithImpl<$Res>;
  @override
  $Res call({DbChat dbChat, DbAccount dbAccount});
}

/// @nodoc
class __$DbPleromaChatPopulatedCopyWithImpl<$Res>
    extends _$DbPleromaChatPopulatedCopyWithImpl<$Res>
    implements _$DbPleromaChatPopulatedCopyWith<$Res> {
  __$DbPleromaChatPopulatedCopyWithImpl(_DbPleromaChatPopulated _value,
      $Res Function(_DbPleromaChatPopulated) _then)
      : super(_value, (v) => _then(v as _DbPleromaChatPopulated));

  @override
  _DbPleromaChatPopulated get _value => super._value as _DbPleromaChatPopulated;

  @override
  $Res call({
    Object? dbChat = freezed,
    Object? dbAccount = freezed,
  }) {
    return _then(_DbPleromaChatPopulated(
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

class _$_DbPleromaChatPopulated implements _DbPleromaChatPopulated {
  const _$_DbPleromaChatPopulated(
      {required this.dbChat, required this.dbAccount});

  @override
  final DbChat dbChat;
  @override
  final DbAccount dbAccount;

  @override
  String toString() {
    return 'DbPleromaChatPopulated(dbChat: $dbChat, dbAccount: $dbAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DbPleromaChatPopulated &&
            (identical(other.dbChat, dbChat) ||
                const DeepCollectionEquality().equals(other.dbChat, dbChat)) &&
            (identical(other.dbAccount, dbAccount) ||
                const DeepCollectionEquality()
                    .equals(other.dbAccount, dbAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dbChat) ^
      const DeepCollectionEquality().hash(dbAccount);

  @JsonKey(ignore: true)
  @override
  _$DbPleromaChatPopulatedCopyWith<_DbPleromaChatPopulated> get copyWith =>
      __$DbPleromaChatPopulatedCopyWithImpl<_DbPleromaChatPopulated>(
          this, _$identity);
}

abstract class _DbPleromaChatPopulated implements DbPleromaChatPopulated {
  const factory _DbPleromaChatPopulated(
      {required DbChat dbChat,
      required DbAccount dbAccount}) = _$_DbPleromaChatPopulated;

  @override
  DbChat get dbChat => throw _privateConstructorUsedError;
  @override
  DbAccount get dbAccount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DbPleromaChatPopulatedCopyWith<_DbPleromaChatPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbPleromaChatWithLastMessagePopulatedTearOff {
  const _$DbPleromaChatWithLastMessagePopulatedTearOff();

  _DbPleromaChatWithLastMessagePopulated call(
      {required DbPleromaChatPopulated dbPleromaChatPopulated,
      required DbChatMessagePopulated? dbChatMessagePopulated}) {
    return _DbPleromaChatWithLastMessagePopulated(
      dbPleromaChatPopulated: dbPleromaChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated,
    );
  }
}

/// @nodoc
const $DbPleromaChatWithLastMessagePopulated =
    _$DbPleromaChatWithLastMessagePopulatedTearOff();

/// @nodoc
mixin _$DbPleromaChatWithLastMessagePopulated {
  DbPleromaChatPopulated get dbPleromaChatPopulated =>
      throw _privateConstructorUsedError;
  DbChatMessagePopulated? get dbChatMessagePopulated =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbPleromaChatWithLastMessagePopulatedCopyWith<
          DbPleromaChatWithLastMessagePopulated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res> {
  factory $DbPleromaChatWithLastMessagePopulatedCopyWith(
          DbPleromaChatWithLastMessagePopulated value,
          $Res Function(DbPleromaChatWithLastMessagePopulated) then) =
      _$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<$Res>;
  $Res call(
      {DbPleromaChatPopulated dbPleromaChatPopulated,
      DbChatMessagePopulated? dbChatMessagePopulated});

  $DbPleromaChatPopulatedCopyWith<$Res> get dbPleromaChatPopulated;
  $DbChatMessagePopulatedCopyWith<$Res>? get dbChatMessagePopulated;
}

/// @nodoc
class _$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<$Res>
    implements $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res> {
  _$DbPleromaChatWithLastMessagePopulatedCopyWithImpl(this._value, this._then);

  final DbPleromaChatWithLastMessagePopulated _value;
  // ignore: unused_field
  final $Res Function(DbPleromaChatWithLastMessagePopulated) _then;

  @override
  $Res call({
    Object? dbPleromaChatPopulated = freezed,
    Object? dbChatMessagePopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbPleromaChatPopulated: dbPleromaChatPopulated == freezed
          ? _value.dbPleromaChatPopulated
          : dbPleromaChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbPleromaChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated == freezed
          ? _value.dbChatMessagePopulated
          : dbChatMessagePopulated // ignore: cast_nullable_to_non_nullable
              as DbChatMessagePopulated?,
    ));
  }

  @override
  $DbPleromaChatPopulatedCopyWith<$Res> get dbPleromaChatPopulated {
    return $DbPleromaChatPopulatedCopyWith<$Res>(_value.dbPleromaChatPopulated,
        (value) {
      return _then(_value.copyWith(dbPleromaChatPopulated: value));
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
abstract class _$DbPleromaChatWithLastMessagePopulatedCopyWith<$Res>
    implements $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res> {
  factory _$DbPleromaChatWithLastMessagePopulatedCopyWith(
          _DbPleromaChatWithLastMessagePopulated value,
          $Res Function(_DbPleromaChatWithLastMessagePopulated) then) =
      __$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbPleromaChatPopulated dbPleromaChatPopulated,
      DbChatMessagePopulated? dbChatMessagePopulated});

  @override
  $DbPleromaChatPopulatedCopyWith<$Res> get dbPleromaChatPopulated;
  @override
  $DbChatMessagePopulatedCopyWith<$Res>? get dbChatMessagePopulated;
}

/// @nodoc
class __$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<$Res>
    extends _$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<$Res>
    implements _$DbPleromaChatWithLastMessagePopulatedCopyWith<$Res> {
  __$DbPleromaChatWithLastMessagePopulatedCopyWithImpl(
      _DbPleromaChatWithLastMessagePopulated _value,
      $Res Function(_DbPleromaChatWithLastMessagePopulated) _then)
      : super(
            _value, (v) => _then(v as _DbPleromaChatWithLastMessagePopulated));

  @override
  _DbPleromaChatWithLastMessagePopulated get _value =>
      super._value as _DbPleromaChatWithLastMessagePopulated;

  @override
  $Res call({
    Object? dbPleromaChatPopulated = freezed,
    Object? dbChatMessagePopulated = freezed,
  }) {
    return _then(_DbPleromaChatWithLastMessagePopulated(
      dbPleromaChatPopulated: dbPleromaChatPopulated == freezed
          ? _value.dbPleromaChatPopulated
          : dbPleromaChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbPleromaChatPopulated,
      dbChatMessagePopulated: dbChatMessagePopulated == freezed
          ? _value.dbChatMessagePopulated
          : dbChatMessagePopulated // ignore: cast_nullable_to_non_nullable
              as DbChatMessagePopulated?,
    ));
  }
}

/// @nodoc

class _$_DbPleromaChatWithLastMessagePopulated
    implements _DbPleromaChatWithLastMessagePopulated {
  const _$_DbPleromaChatWithLastMessagePopulated(
      {required this.dbPleromaChatPopulated,
      required this.dbChatMessagePopulated});

  @override
  final DbPleromaChatPopulated dbPleromaChatPopulated;
  @override
  final DbChatMessagePopulated? dbChatMessagePopulated;

  @override
  String toString() {
    return 'DbPleromaChatWithLastMessagePopulated(dbPleromaChatPopulated: $dbPleromaChatPopulated, dbChatMessagePopulated: $dbChatMessagePopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DbPleromaChatWithLastMessagePopulated &&
            (identical(other.dbPleromaChatPopulated, dbPleromaChatPopulated) ||
                const DeepCollectionEquality().equals(
                    other.dbPleromaChatPopulated, dbPleromaChatPopulated)) &&
            (identical(other.dbChatMessagePopulated, dbChatMessagePopulated) ||
                const DeepCollectionEquality().equals(
                    other.dbChatMessagePopulated, dbChatMessagePopulated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dbPleromaChatPopulated) ^
      const DeepCollectionEquality().hash(dbChatMessagePopulated);

  @JsonKey(ignore: true)
  @override
  _$DbPleromaChatWithLastMessagePopulatedCopyWith<
          _DbPleromaChatWithLastMessagePopulated>
      get copyWith => __$DbPleromaChatWithLastMessagePopulatedCopyWithImpl<
          _DbPleromaChatWithLastMessagePopulated>(this, _$identity);
}

abstract class _DbPleromaChatWithLastMessagePopulated
    implements DbPleromaChatWithLastMessagePopulated {
  const factory _DbPleromaChatWithLastMessagePopulated(
          {required DbPleromaChatPopulated dbPleromaChatPopulated,
          required DbChatMessagePopulated? dbChatMessagePopulated}) =
      _$_DbPleromaChatWithLastMessagePopulated;

  @override
  DbPleromaChatPopulated get dbPleromaChatPopulated =>
      throw _privateConstructorUsedError;
  @override
  DbChatMessagePopulated? get dbChatMessagePopulated =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DbPleromaChatWithLastMessagePopulatedCopyWith<
          _DbPleromaChatWithLastMessagePopulated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbPleromaChatWithLastMessagePopulatedWrapperTearOff {
  const _$DbPleromaChatWithLastMessagePopulatedWrapperTearOff();

  _DbPleromaChatWithLastMessagePopulatedWrapper call(
      {required DbPleromaChatWithLastMessagePopulated
          dbPleromaChatWithLastMessagePopulated}) {
    return _DbPleromaChatWithLastMessagePopulatedWrapper(
      dbPleromaChatWithLastMessagePopulated:
          dbPleromaChatWithLastMessagePopulated,
    );
  }
}

/// @nodoc
const $DbPleromaChatWithLastMessagePopulatedWrapper =
    _$DbPleromaChatWithLastMessagePopulatedWrapperTearOff();

/// @nodoc
mixin _$DbPleromaChatWithLastMessagePopulatedWrapper {
  DbPleromaChatWithLastMessagePopulated
      get dbPleromaChatWithLastMessagePopulated =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<
          DbPleromaChatWithLastMessagePopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  factory $DbPleromaChatWithLastMessagePopulatedWrapperCopyWith(
          DbPleromaChatWithLastMessagePopulatedWrapper value,
          $Res Function(DbPleromaChatWithLastMessagePopulatedWrapper) then) =
      _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>;
  $Res call(
      {DbPleromaChatWithLastMessagePopulated
          dbPleromaChatWithLastMessagePopulated});

  $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res>
      get dbPleromaChatWithLastMessagePopulated;
}

/// @nodoc
class _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    implements $DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl(
      this._value, this._then);

  final DbPleromaChatWithLastMessagePopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbPleromaChatWithLastMessagePopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbPleromaChatWithLastMessagePopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbPleromaChatWithLastMessagePopulated:
          dbPleromaChatWithLastMessagePopulated == freezed
              ? _value.dbPleromaChatWithLastMessagePopulated
              : dbPleromaChatWithLastMessagePopulated // ignore: cast_nullable_to_non_nullable
                  as DbPleromaChatWithLastMessagePopulated,
    ));
  }

  @override
  $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res>
      get dbPleromaChatWithLastMessagePopulated {
    return $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res>(
        _value.dbPleromaChatWithLastMessagePopulated, (value) {
      return _then(
          _value.copyWith(dbPleromaChatWithLastMessagePopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<$Res>
    implements $DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  factory _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWith(
          _DbPleromaChatWithLastMessagePopulatedWrapper value,
          $Res Function(_DbPleromaChatWithLastMessagePopulatedWrapper) then) =
      __$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbPleromaChatWithLastMessagePopulated
          dbPleromaChatWithLastMessagePopulated});

  @override
  $DbPleromaChatWithLastMessagePopulatedCopyWith<$Res>
      get dbPleromaChatWithLastMessagePopulated;
}

/// @nodoc
class __$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    extends _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<$Res>
    implements _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<$Res> {
  __$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl(
      _DbPleromaChatWithLastMessagePopulatedWrapper _value,
      $Res Function(_DbPleromaChatWithLastMessagePopulatedWrapper) _then)
      : super(_value,
            (v) => _then(v as _DbPleromaChatWithLastMessagePopulatedWrapper));

  @override
  _DbPleromaChatWithLastMessagePopulatedWrapper get _value =>
      super._value as _DbPleromaChatWithLastMessagePopulatedWrapper;

  @override
  $Res call({
    Object? dbPleromaChatWithLastMessagePopulated = freezed,
  }) {
    return _then(_DbPleromaChatWithLastMessagePopulatedWrapper(
      dbPleromaChatWithLastMessagePopulated:
          dbPleromaChatWithLastMessagePopulated == freezed
              ? _value.dbPleromaChatWithLastMessagePopulated
              : dbPleromaChatWithLastMessagePopulated // ignore: cast_nullable_to_non_nullable
                  as DbPleromaChatWithLastMessagePopulated,
    ));
  }
}

/// @nodoc

class _$_DbPleromaChatWithLastMessagePopulatedWrapper
    extends _DbPleromaChatWithLastMessagePopulatedWrapper {
  const _$_DbPleromaChatWithLastMessagePopulatedWrapper(
      {required this.dbPleromaChatWithLastMessagePopulated})
      : super._();

  @override
  final DbPleromaChatWithLastMessagePopulated
      dbPleromaChatWithLastMessagePopulated;

  @override
  String toString() {
    return 'DbPleromaChatWithLastMessagePopulatedWrapper(dbPleromaChatWithLastMessagePopulated: $dbPleromaChatWithLastMessagePopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DbPleromaChatWithLastMessagePopulatedWrapper &&
            (identical(other.dbPleromaChatWithLastMessagePopulated,
                    dbPleromaChatWithLastMessagePopulated) ||
                const DeepCollectionEquality().equals(
                    other.dbPleromaChatWithLastMessagePopulated,
                    dbPleromaChatWithLastMessagePopulated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality()
          .hash(dbPleromaChatWithLastMessagePopulated);

  @JsonKey(ignore: true)
  @override
  _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<
          _DbPleromaChatWithLastMessagePopulatedWrapper>
      get copyWith =>
          __$DbPleromaChatWithLastMessagePopulatedWrapperCopyWithImpl<
              _DbPleromaChatWithLastMessagePopulatedWrapper>(this, _$identity);
}

abstract class _DbPleromaChatWithLastMessagePopulatedWrapper
    extends DbPleromaChatWithLastMessagePopulatedWrapper {
  const factory _DbPleromaChatWithLastMessagePopulatedWrapper(
          {required DbPleromaChatWithLastMessagePopulated
              dbPleromaChatWithLastMessagePopulated}) =
      _$_DbPleromaChatWithLastMessagePopulatedWrapper;
  const _DbPleromaChatWithLastMessagePopulatedWrapper._() : super._();

  @override
  DbPleromaChatWithLastMessagePopulated
      get dbPleromaChatWithLastMessagePopulated =>
          throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DbPleromaChatWithLastMessagePopulatedWrapperCopyWith<
          _DbPleromaChatWithLastMessagePopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbPleromaChatPopulatedWrapperTearOff {
  const _$DbPleromaChatPopulatedWrapperTearOff();

  _DbPleromaChatPopulatedWrapper call(
      {required DbPleromaChatPopulated dbChatPopulated}) {
    return _DbPleromaChatPopulatedWrapper(
      dbChatPopulated: dbChatPopulated,
    );
  }
}

/// @nodoc
const $DbPleromaChatPopulatedWrapper = _$DbPleromaChatPopulatedWrapperTearOff();

/// @nodoc
mixin _$DbPleromaChatPopulatedWrapper {
  DbPleromaChatPopulated get dbChatPopulated =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbPleromaChatPopulatedWrapperCopyWith<DbPleromaChatPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbPleromaChatPopulatedWrapperCopyWith<$Res> {
  factory $DbPleromaChatPopulatedWrapperCopyWith(
          DbPleromaChatPopulatedWrapper value,
          $Res Function(DbPleromaChatPopulatedWrapper) then) =
      _$DbPleromaChatPopulatedWrapperCopyWithImpl<$Res>;
  $Res call({DbPleromaChatPopulated dbChatPopulated});

  $DbPleromaChatPopulatedCopyWith<$Res> get dbChatPopulated;
}

/// @nodoc
class _$DbPleromaChatPopulatedWrapperCopyWithImpl<$Res>
    implements $DbPleromaChatPopulatedWrapperCopyWith<$Res> {
  _$DbPleromaChatPopulatedWrapperCopyWithImpl(this._value, this._then);

  final DbPleromaChatPopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbPleromaChatPopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbChatPopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbChatPopulated: dbChatPopulated == freezed
          ? _value.dbChatPopulated
          : dbChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbPleromaChatPopulated,
    ));
  }

  @override
  $DbPleromaChatPopulatedCopyWith<$Res> get dbChatPopulated {
    return $DbPleromaChatPopulatedCopyWith<$Res>(_value.dbChatPopulated,
        (value) {
      return _then(_value.copyWith(dbChatPopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbPleromaChatPopulatedWrapperCopyWith<$Res>
    implements $DbPleromaChatPopulatedWrapperCopyWith<$Res> {
  factory _$DbPleromaChatPopulatedWrapperCopyWith(
          _DbPleromaChatPopulatedWrapper value,
          $Res Function(_DbPleromaChatPopulatedWrapper) then) =
      __$DbPleromaChatPopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call({DbPleromaChatPopulated dbChatPopulated});

  @override
  $DbPleromaChatPopulatedCopyWith<$Res> get dbChatPopulated;
}

/// @nodoc
class __$DbPleromaChatPopulatedWrapperCopyWithImpl<$Res>
    extends _$DbPleromaChatPopulatedWrapperCopyWithImpl<$Res>
    implements _$DbPleromaChatPopulatedWrapperCopyWith<$Res> {
  __$DbPleromaChatPopulatedWrapperCopyWithImpl(
      _DbPleromaChatPopulatedWrapper _value,
      $Res Function(_DbPleromaChatPopulatedWrapper) _then)
      : super(_value, (v) => _then(v as _DbPleromaChatPopulatedWrapper));

  @override
  _DbPleromaChatPopulatedWrapper get _value =>
      super._value as _DbPleromaChatPopulatedWrapper;

  @override
  $Res call({
    Object? dbChatPopulated = freezed,
  }) {
    return _then(_DbPleromaChatPopulatedWrapper(
      dbChatPopulated: dbChatPopulated == freezed
          ? _value.dbChatPopulated
          : dbChatPopulated // ignore: cast_nullable_to_non_nullable
              as DbPleromaChatPopulated,
    ));
  }
}

/// @nodoc

class _$_DbPleromaChatPopulatedWrapper extends _DbPleromaChatPopulatedWrapper {
  const _$_DbPleromaChatPopulatedWrapper({required this.dbChatPopulated})
      : super._();

  @override
  final DbPleromaChatPopulated dbChatPopulated;

  @override
  String toString() {
    return 'DbPleromaChatPopulatedWrapper(dbChatPopulated: $dbChatPopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DbPleromaChatPopulatedWrapper &&
            (identical(other.dbChatPopulated, dbChatPopulated) ||
                const DeepCollectionEquality()
                    .equals(other.dbChatPopulated, dbChatPopulated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dbChatPopulated);

  @JsonKey(ignore: true)
  @override
  _$DbPleromaChatPopulatedWrapperCopyWith<_DbPleromaChatPopulatedWrapper>
      get copyWith => __$DbPleromaChatPopulatedWrapperCopyWithImpl<
          _DbPleromaChatPopulatedWrapper>(this, _$identity);
}

abstract class _DbPleromaChatPopulatedWrapper
    extends DbPleromaChatPopulatedWrapper {
  const factory _DbPleromaChatPopulatedWrapper(
          {required DbPleromaChatPopulated dbChatPopulated}) =
      _$_DbPleromaChatPopulatedWrapper;
  const _DbPleromaChatPopulatedWrapper._() : super._();

  @override
  DbPleromaChatPopulated get dbChatPopulated =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DbPleromaChatPopulatedWrapperCopyWith<_DbPleromaChatPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

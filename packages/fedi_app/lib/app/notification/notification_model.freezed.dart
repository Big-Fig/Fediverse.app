// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  _NotificationState call({required bool? dismissed, required bool? unread}) {
    return _NotificationState(
      dismissed: dismissed,
      unread: unread,
    );
  }
}

/// @nodoc
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  bool? get dismissed => throw _privateConstructorUsedError;
  bool? get unread => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
  $Res call({bool? dismissed, bool? unread});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;

  @override
  $Res call({
    Object? dismissed = freezed,
    Object? unread = freezed,
  }) {
    return _then(_value.copyWith(
      dismissed: dismissed == freezed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as bool?,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(
          _NotificationState value, $Res Function(_NotificationState) then) =
      __$NotificationStateCopyWithImpl<$Res>;
  @override
  $Res call({bool? dismissed, bool? unread});
}

/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(
      _NotificationState _value, $Res Function(_NotificationState) _then)
      : super(_value, (v) => _then(v as _NotificationState));

  @override
  _NotificationState get _value => super._value as _NotificationState;

  @override
  $Res call({
    Object? dismissed = freezed,
    Object? unread = freezed,
  }) {
    return _then(_NotificationState(
      dismissed: dismissed == freezed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as bool?,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_NotificationState implements _NotificationState {
  const _$_NotificationState({required this.dismissed, required this.unread});

  @override
  final bool? dismissed;
  @override
  final bool? unread;

  @override
  String toString() {
    return 'NotificationState(dismissed: $dismissed, unread: $unread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationState &&
            (identical(other.dismissed, dismissed) ||
                other.dismissed == dismissed) &&
            (identical(other.unread, unread) || other.unread == unread));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dismissed, unread);

  @JsonKey(ignore: true)
  @override
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {required bool? dismissed, required bool? unread}) = _$_NotificationState;

  @override
  bool? get dismissed;
  @override
  bool? get unread;
  @override
  @JsonKey(ignore: true)
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbNotificationPopulatedWrapperTearOff {
  const _$DbNotificationPopulatedWrapperTearOff();

  _DbNotificationPopulatedWrapper call(
      {required DbNotificationPopulated dbNotificationPopulated}) {
    return _DbNotificationPopulatedWrapper(
      dbNotificationPopulated: dbNotificationPopulated,
    );
  }
}

/// @nodoc
const $DbNotificationPopulatedWrapper =
    _$DbNotificationPopulatedWrapperTearOff();

/// @nodoc
mixin _$DbNotificationPopulatedWrapper {
  DbNotificationPopulated get dbNotificationPopulated =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbNotificationPopulatedWrapperCopyWith<DbNotificationPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbNotificationPopulatedWrapperCopyWith<$Res> {
  factory $DbNotificationPopulatedWrapperCopyWith(
          DbNotificationPopulatedWrapper value,
          $Res Function(DbNotificationPopulatedWrapper) then) =
      _$DbNotificationPopulatedWrapperCopyWithImpl<$Res>;
  $Res call({DbNotificationPopulated dbNotificationPopulated});

  $DbNotificationPopulatedCopyWith<$Res> get dbNotificationPopulated;
}

/// @nodoc
class _$DbNotificationPopulatedWrapperCopyWithImpl<$Res>
    implements $DbNotificationPopulatedWrapperCopyWith<$Res> {
  _$DbNotificationPopulatedWrapperCopyWithImpl(this._value, this._then);

  final DbNotificationPopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbNotificationPopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbNotificationPopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbNotificationPopulated: dbNotificationPopulated == freezed
          ? _value.dbNotificationPopulated
          : dbNotificationPopulated // ignore: cast_nullable_to_non_nullable
              as DbNotificationPopulated,
    ));
  }

  @override
  $DbNotificationPopulatedCopyWith<$Res> get dbNotificationPopulated {
    return $DbNotificationPopulatedCopyWith<$Res>(
        _value.dbNotificationPopulated, (value) {
      return _then(_value.copyWith(dbNotificationPopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbNotificationPopulatedWrapperCopyWith<$Res>
    implements $DbNotificationPopulatedWrapperCopyWith<$Res> {
  factory _$DbNotificationPopulatedWrapperCopyWith(
          _DbNotificationPopulatedWrapper value,
          $Res Function(_DbNotificationPopulatedWrapper) then) =
      __$DbNotificationPopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call({DbNotificationPopulated dbNotificationPopulated});

  @override
  $DbNotificationPopulatedCopyWith<$Res> get dbNotificationPopulated;
}

/// @nodoc
class __$DbNotificationPopulatedWrapperCopyWithImpl<$Res>
    extends _$DbNotificationPopulatedWrapperCopyWithImpl<$Res>
    implements _$DbNotificationPopulatedWrapperCopyWith<$Res> {
  __$DbNotificationPopulatedWrapperCopyWithImpl(
      _DbNotificationPopulatedWrapper _value,
      $Res Function(_DbNotificationPopulatedWrapper) _then)
      : super(_value, (v) => _then(v as _DbNotificationPopulatedWrapper));

  @override
  _DbNotificationPopulatedWrapper get _value =>
      super._value as _DbNotificationPopulatedWrapper;

  @override
  $Res call({
    Object? dbNotificationPopulated = freezed,
  }) {
    return _then(_DbNotificationPopulatedWrapper(
      dbNotificationPopulated: dbNotificationPopulated == freezed
          ? _value.dbNotificationPopulated
          : dbNotificationPopulated // ignore: cast_nullable_to_non_nullable
              as DbNotificationPopulated,
    ));
  }
}

/// @nodoc

class _$_DbNotificationPopulatedWrapper
    extends _DbNotificationPopulatedWrapper {
  const _$_DbNotificationPopulatedWrapper(
      {required this.dbNotificationPopulated})
      : super._();

  @override
  final DbNotificationPopulated dbNotificationPopulated;

  @override
  String toString() {
    return 'DbNotificationPopulatedWrapper(dbNotificationPopulated: $dbNotificationPopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbNotificationPopulatedWrapper &&
            (identical(
                    other.dbNotificationPopulated, dbNotificationPopulated) ||
                other.dbNotificationPopulated == dbNotificationPopulated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbNotificationPopulated);

  @JsonKey(ignore: true)
  @override
  _$DbNotificationPopulatedWrapperCopyWith<_DbNotificationPopulatedWrapper>
      get copyWith => __$DbNotificationPopulatedWrapperCopyWithImpl<
          _DbNotificationPopulatedWrapper>(this, _$identity);
}

abstract class _DbNotificationPopulatedWrapper
    extends DbNotificationPopulatedWrapper {
  const factory _DbNotificationPopulatedWrapper(
          {required DbNotificationPopulated dbNotificationPopulated}) =
      _$_DbNotificationPopulatedWrapper;
  const _DbNotificationPopulatedWrapper._() : super._();

  @override
  DbNotificationPopulated get dbNotificationPopulated;
  @override
  @JsonKey(ignore: true)
  _$DbNotificationPopulatedWrapperCopyWith<_DbNotificationPopulatedWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbNotificationPopulatedTearOff {
  const _$DbNotificationPopulatedTearOff();

  _DbNotificationPopulated call(
      {required DbNotification dbNotification,
      required DbAccount? dbAccount,
      required DbStatus? dbStatus,
      required DbAccount? dbStatusAccount,
      required DbStatus? reblogDbStatus,
      required DbAccount? reblogDbStatusAccount,
      required DbStatus? replyDbStatus,
      required DbAccount? replyDbStatusAccount,
      required DbStatus? replyReblogDbStatus,
      required DbAccount? replyReblogDbStatusAccount}) {
    return _DbNotificationPopulated(
      dbNotification: dbNotification,
      dbAccount: dbAccount,
      dbStatus: dbStatus,
      dbStatusAccount: dbStatusAccount,
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
const $DbNotificationPopulated = _$DbNotificationPopulatedTearOff();

/// @nodoc
mixin _$DbNotificationPopulated {
  DbNotification get dbNotification => throw _privateConstructorUsedError;
  DbAccount? get dbAccount => throw _privateConstructorUsedError;
  DbStatus? get dbStatus => throw _privateConstructorUsedError;
  DbAccount? get dbStatusAccount => throw _privateConstructorUsedError;
  DbStatus? get reblogDbStatus => throw _privateConstructorUsedError;
  DbAccount? get reblogDbStatusAccount => throw _privateConstructorUsedError;
  DbStatus? get replyDbStatus => throw _privateConstructorUsedError;
  DbAccount? get replyDbStatusAccount => throw _privateConstructorUsedError;
  DbStatus? get replyReblogDbStatus => throw _privateConstructorUsedError;
  DbAccount? get replyReblogDbStatusAccount =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbNotificationPopulatedCopyWith<DbNotificationPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbNotificationPopulatedCopyWith<$Res> {
  factory $DbNotificationPopulatedCopyWith(DbNotificationPopulated value,
          $Res Function(DbNotificationPopulated) then) =
      _$DbNotificationPopulatedCopyWithImpl<$Res>;
  $Res call(
      {DbNotification dbNotification,
      DbAccount? dbAccount,
      DbStatus? dbStatus,
      DbAccount? dbStatusAccount,
      DbStatus? reblogDbStatus,
      DbAccount? reblogDbStatusAccount,
      DbStatus? replyDbStatus,
      DbAccount? replyDbStatusAccount,
      DbStatus? replyReblogDbStatus,
      DbAccount? replyReblogDbStatusAccount});
}

/// @nodoc
class _$DbNotificationPopulatedCopyWithImpl<$Res>
    implements $DbNotificationPopulatedCopyWith<$Res> {
  _$DbNotificationPopulatedCopyWithImpl(this._value, this._then);

  final DbNotificationPopulated _value;
  // ignore: unused_field
  final $Res Function(DbNotificationPopulated) _then;

  @override
  $Res call({
    Object? dbNotification = freezed,
    Object? dbAccount = freezed,
    Object? dbStatus = freezed,
    Object? dbStatusAccount = freezed,
    Object? reblogDbStatus = freezed,
    Object? reblogDbStatusAccount = freezed,
    Object? replyDbStatus = freezed,
    Object? replyDbStatusAccount = freezed,
    Object? replyReblogDbStatus = freezed,
    Object? replyReblogDbStatusAccount = freezed,
  }) {
    return _then(_value.copyWith(
      dbNotification: dbNotification == freezed
          ? _value.dbNotification
          : dbNotification // ignore: cast_nullable_to_non_nullable
              as DbNotification,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      dbStatus: dbStatus == freezed
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      dbStatusAccount: dbStatusAccount == freezed
          ? _value.dbStatusAccount
          : dbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
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
abstract class _$DbNotificationPopulatedCopyWith<$Res>
    implements $DbNotificationPopulatedCopyWith<$Res> {
  factory _$DbNotificationPopulatedCopyWith(_DbNotificationPopulated value,
          $Res Function(_DbNotificationPopulated) then) =
      __$DbNotificationPopulatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {DbNotification dbNotification,
      DbAccount? dbAccount,
      DbStatus? dbStatus,
      DbAccount? dbStatusAccount,
      DbStatus? reblogDbStatus,
      DbAccount? reblogDbStatusAccount,
      DbStatus? replyDbStatus,
      DbAccount? replyDbStatusAccount,
      DbStatus? replyReblogDbStatus,
      DbAccount? replyReblogDbStatusAccount});
}

/// @nodoc
class __$DbNotificationPopulatedCopyWithImpl<$Res>
    extends _$DbNotificationPopulatedCopyWithImpl<$Res>
    implements _$DbNotificationPopulatedCopyWith<$Res> {
  __$DbNotificationPopulatedCopyWithImpl(_DbNotificationPopulated _value,
      $Res Function(_DbNotificationPopulated) _then)
      : super(_value, (v) => _then(v as _DbNotificationPopulated));

  @override
  _DbNotificationPopulated get _value =>
      super._value as _DbNotificationPopulated;

  @override
  $Res call({
    Object? dbNotification = freezed,
    Object? dbAccount = freezed,
    Object? dbStatus = freezed,
    Object? dbStatusAccount = freezed,
    Object? reblogDbStatus = freezed,
    Object? reblogDbStatusAccount = freezed,
    Object? replyDbStatus = freezed,
    Object? replyDbStatusAccount = freezed,
    Object? replyReblogDbStatus = freezed,
    Object? replyReblogDbStatusAccount = freezed,
  }) {
    return _then(_DbNotificationPopulated(
      dbNotification: dbNotification == freezed
          ? _value.dbNotification
          : dbNotification // ignore: cast_nullable_to_non_nullable
              as DbNotification,
      dbAccount: dbAccount == freezed
          ? _value.dbAccount
          : dbAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
      dbStatus: dbStatus == freezed
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus?,
      dbStatusAccount: dbStatusAccount == freezed
          ? _value.dbStatusAccount
          : dbStatusAccount // ignore: cast_nullable_to_non_nullable
              as DbAccount?,
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

class _$_DbNotificationPopulated extends _DbNotificationPopulated {
  const _$_DbNotificationPopulated(
      {required this.dbNotification,
      required this.dbAccount,
      required this.dbStatus,
      required this.dbStatusAccount,
      required this.reblogDbStatus,
      required this.reblogDbStatusAccount,
      required this.replyDbStatus,
      required this.replyDbStatusAccount,
      required this.replyReblogDbStatus,
      required this.replyReblogDbStatusAccount})
      : super._();

  @override
  final DbNotification dbNotification;
  @override
  final DbAccount? dbAccount;
  @override
  final DbStatus? dbStatus;
  @override
  final DbAccount? dbStatusAccount;
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
    return 'DbNotificationPopulated(dbNotification: $dbNotification, dbAccount: $dbAccount, dbStatus: $dbStatus, dbStatusAccount: $dbStatusAccount, reblogDbStatus: $reblogDbStatus, reblogDbStatusAccount: $reblogDbStatusAccount, replyDbStatus: $replyDbStatus, replyDbStatusAccount: $replyDbStatusAccount, replyReblogDbStatus: $replyReblogDbStatus, replyReblogDbStatusAccount: $replyReblogDbStatusAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbNotificationPopulated &&
            const DeepCollectionEquality()
                .equals(other.dbNotification, dbNotification) &&
            const DeepCollectionEquality().equals(other.dbAccount, dbAccount) &&
            const DeepCollectionEquality().equals(other.dbStatus, dbStatus) &&
            const DeepCollectionEquality()
                .equals(other.dbStatusAccount, dbStatusAccount) &&
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
      const DeepCollectionEquality().hash(dbNotification),
      const DeepCollectionEquality().hash(dbAccount),
      const DeepCollectionEquality().hash(dbStatus),
      const DeepCollectionEquality().hash(dbStatusAccount),
      const DeepCollectionEquality().hash(reblogDbStatus),
      const DeepCollectionEquality().hash(reblogDbStatusAccount),
      const DeepCollectionEquality().hash(replyDbStatus),
      const DeepCollectionEquality().hash(replyDbStatusAccount),
      const DeepCollectionEquality().hash(replyReblogDbStatus),
      const DeepCollectionEquality().hash(replyReblogDbStatusAccount));

  @JsonKey(ignore: true)
  @override
  _$DbNotificationPopulatedCopyWith<_DbNotificationPopulated> get copyWith =>
      __$DbNotificationPopulatedCopyWithImpl<_DbNotificationPopulated>(
          this, _$identity);
}

abstract class _DbNotificationPopulated extends DbNotificationPopulated {
  const factory _DbNotificationPopulated(
          {required DbNotification dbNotification,
          required DbAccount? dbAccount,
          required DbStatus? dbStatus,
          required DbAccount? dbStatusAccount,
          required DbStatus? reblogDbStatus,
          required DbAccount? reblogDbStatusAccount,
          required DbStatus? replyDbStatus,
          required DbAccount? replyDbStatusAccount,
          required DbStatus? replyReblogDbStatus,
          required DbAccount? replyReblogDbStatusAccount}) =
      _$_DbNotificationPopulated;
  const _DbNotificationPopulated._() : super._();

  @override
  DbNotification get dbNotification;
  @override
  DbAccount? get dbAccount;
  @override
  DbStatus? get dbStatus;
  @override
  DbAccount? get dbStatusAccount;
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
  _$DbNotificationPopulatedCopyWith<_DbNotificationPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

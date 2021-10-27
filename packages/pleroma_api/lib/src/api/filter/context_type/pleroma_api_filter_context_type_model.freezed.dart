// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_filter_context_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiFilterContextTypeTearOff {
  const _$PleromaApiFilterContextTypeTearOff();

  _Home home(
      {String stringValue = PleromaApiFilterContextType.homeStringValue}) {
    return _Home(
      stringValue: stringValue,
    );
  }

  _Notifications notifications(
      {String stringValue =
          PleromaApiFilterContextType.notificationsStringValue}) {
    return _Notifications(
      stringValue: stringValue,
    );
  }

  _Public public(
      {String stringValue = PleromaApiFilterContextType.publicStringValue}) {
    return _Public(
      stringValue: stringValue,
    );
  }

  _Thread thread(
      {String stringValue = PleromaApiFilterContextType.threadStringValue}) {
    return _Thread(
      stringValue: stringValue,
    );
  }

  _Account account(
      {String stringValue = PleromaApiFilterContextType.accountStringValue}) {
    return _Account(
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
const $PleromaApiFilterContextType = _$PleromaApiFilterContextTypeTearOff();

/// @nodoc
mixin _$PleromaApiFilterContextType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiFilterContextTypeCopyWith<PleromaApiFilterContextType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory $PleromaApiFilterContextTypeCopyWith(
          PleromaApiFilterContextType value,
          $Res Function(PleromaApiFilterContextType) then) =
      _$PleromaApiFilterContextTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  _$PleromaApiFilterContextTypeCopyWithImpl(this._value, this._then);

  final PleromaApiFilterContextType _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFilterContextType) _then;

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
abstract class _$HomeCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$HomeCopyWith(_Home value, $Res Function(_Home) then) =
      __$HomeCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$HomeCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements _$HomeCopyWith<$Res> {
  __$HomeCopyWithImpl(_Home _value, $Res Function(_Home) _then)
      : super(_value, (v) => _then(v as _Home));

  @override
  _Home get _value => super._value as _Home;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Home(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Home implements _Home {
  const _$_Home(
      {this.stringValue = PleromaApiFilterContextType.homeStringValue});

  @JsonKey(defaultValue: PleromaApiFilterContextType.homeStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiFilterContextType.home(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Home &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$HomeCopyWith<_Home> get copyWith =>
      __$HomeCopyWithImpl<_Home>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return home(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return home?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home implements PleromaApiFilterContextType {
  const factory _Home({String stringValue}) = _$_Home;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$HomeCopyWith<_Home> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NotificationsCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$NotificationsCopyWith(
          _Notifications value, $Res Function(_Notifications) then) =
      __$NotificationsCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NotificationsCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements _$NotificationsCopyWith<$Res> {
  __$NotificationsCopyWithImpl(
      _Notifications _value, $Res Function(_Notifications) _then)
      : super(_value, (v) => _then(v as _Notifications));

  @override
  _Notifications get _value => super._value as _Notifications;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Notifications(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Notifications implements _Notifications {
  const _$_Notifications(
      {this.stringValue =
          PleromaApiFilterContextType.notificationsStringValue});

  @JsonKey(defaultValue: PleromaApiFilterContextType.notificationsStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiFilterContextType.notifications(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notifications &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$NotificationsCopyWith<_Notifications> get copyWith =>
      __$NotificationsCopyWithImpl<_Notifications>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return notifications(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return notifications?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (notifications != null) {
      return notifications(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return notifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return notifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notifications != null) {
      return notifications(this);
    }
    return orElse();
  }
}

abstract class _Notifications implements PleromaApiFilterContextType {
  const factory _Notifications({String stringValue}) = _$_Notifications;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$NotificationsCopyWith<_Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PublicCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$PublicCopyWith(_Public value, $Res Function(_Public) then) =
      __$PublicCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PublicCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements _$PublicCopyWith<$Res> {
  __$PublicCopyWithImpl(_Public _value, $Res Function(_Public) _then)
      : super(_value, (v) => _then(v as _Public));

  @override
  _Public get _value => super._value as _Public;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Public(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Public implements _Public {
  const _$_Public(
      {this.stringValue = PleromaApiFilterContextType.publicStringValue});

  @JsonKey(defaultValue: PleromaApiFilterContextType.publicStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiFilterContextType.public(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Public &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$PublicCopyWith<_Public> get copyWith =>
      __$PublicCopyWithImpl<_Public>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return public(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return public?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return public(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return public?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(this);
    }
    return orElse();
  }
}

abstract class _Public implements PleromaApiFilterContextType {
  const factory _Public({String stringValue}) = _$_Public;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$PublicCopyWith<_Public> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ThreadCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$ThreadCopyWith(_Thread value, $Res Function(_Thread) then) =
      __$ThreadCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ThreadCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements _$ThreadCopyWith<$Res> {
  __$ThreadCopyWithImpl(_Thread _value, $Res Function(_Thread) _then)
      : super(_value, (v) => _then(v as _Thread));

  @override
  _Thread get _value => super._value as _Thread;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Thread(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Thread implements _Thread {
  const _$_Thread(
      {this.stringValue = PleromaApiFilterContextType.threadStringValue});

  @JsonKey(defaultValue: PleromaApiFilterContextType.threadStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiFilterContextType.thread(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Thread &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$ThreadCopyWith<_Thread> get copyWith =>
      __$ThreadCopyWithImpl<_Thread>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return thread(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return thread?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (thread != null) {
      return thread(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return thread(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return thread?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (thread != null) {
      return thread(this);
    }
    return orElse();
  }
}

abstract class _Thread implements PleromaApiFilterContextType {
  const factory _Thread({String stringValue}) = _$_Thread;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$ThreadCopyWith<_Thread> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AccountCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) then) =
      __$AccountCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(_Account _value, $Res Function(_Account) _then)
      : super(_value, (v) => _then(v as _Account));

  @override
  _Account get _value => super._value as _Account;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Account(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Account implements _Account {
  const _$_Account(
      {this.stringValue = PleromaApiFilterContextType.accountStringValue});

  @JsonKey(defaultValue: PleromaApiFilterContextType.accountStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiFilterContextType.account(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return account(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return account?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (account != null) {
      return account(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return account(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return account?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (account != null) {
      return account(this);
    }
    return orElse();
  }
}

abstract class _Account implements PleromaApiFilterContextType {
  const factory _Account({String stringValue}) = _$_Account;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$AccountCopyWith<_Account> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $PleromaApiFilterContextTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$PleromaApiFilterContextTypeCopyWithImpl<$Res>
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
    return 'PleromaApiFilterContextType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) home,
    required TResult Function(String stringValue) notifications,
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) thread,
    required TResult Function(String stringValue) account,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? home,
    TResult Function(String stringValue)? notifications,
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? thread,
    TResult Function(String stringValue)? account,
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
    required TResult Function(_Home value) home,
    required TResult Function(_Notifications value) notifications,
    required TResult Function(_Public value) public,
    required TResult Function(_Thread value) thread,
    required TResult Function(_Account value) account,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Home value)? home,
    TResult Function(_Notifications value)? notifications,
    TResult Function(_Public value)? public,
    TResult Function(_Thread value)? thread,
    TResult Function(_Account value)? account,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements PleromaApiFilterContextType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

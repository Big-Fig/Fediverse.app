// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_web_sockets_event_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiWebSocketsEventTypeTearOff {
  const _$MastodonApiWebSocketsEventTypeTearOff();

  _Update update(
      {String stringValue = MastodonApiWebSocketsEventType.updateStringValue}) {
    return _Update(
      stringValue: stringValue,
    );
  }

  _Notification notification(
      {String stringValue =
          MastodonApiWebSocketsEventType.notificationStringValue}) {
    return _Notification(
      stringValue: stringValue,
    );
  }

  _Delete delete(
      {String stringValue = MastodonApiWebSocketsEventType.deleteStringValue}) {
    return _Delete(
      stringValue: stringValue,
    );
  }

  _FiltersChanged filtersChanged(
      {String stringValue =
          MastodonApiWebSocketsEventType.filtersChangedStringValue}) {
    return _FiltersChanged(
      stringValue: stringValue,
    );
  }

  _Announcement announcement(
      {String stringValue =
          MastodonApiWebSocketsEventType.announcementStringValue}) {
    return _Announcement(
      stringValue: stringValue,
    );
  }

  _Conversation conversation(
      {String stringValue =
          MastodonApiWebSocketsEventType.conversationStringValue}) {
    return _Conversation(
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
const $MastodonApiWebSocketsEventType =
    _$MastodonApiWebSocketsEventTypeTearOff();

/// @nodoc
mixin _$MastodonApiWebSocketsEventType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiWebSocketsEventTypeCopyWith<MastodonApiWebSocketsEventType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory $MastodonApiWebSocketsEventTypeCopyWith(
          MastodonApiWebSocketsEventType value,
          $Res Function(MastodonApiWebSocketsEventType) then) =
      _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  _$MastodonApiWebSocketsEventTypeCopyWithImpl(this._value, this._then);

  final MastodonApiWebSocketsEventType _value;
  // ignore: unused_field
  final $Res Function(MastodonApiWebSocketsEventType) _then;

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
abstract class _$UpdateCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Update(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update(
      {this.stringValue = MastodonApiWebSocketsEventType.updateStringValue});

  @JsonKey(defaultValue: MastodonApiWebSocketsEventType.updateStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.update(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Update &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return update(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return update?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements MastodonApiWebSocketsEventType {
  const factory _Update({String stringValue}) = _$_Update;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Notification(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Notification implements _Notification {
  const _$_Notification(
      {this.stringValue =
          MastodonApiWebSocketsEventType.notificationStringValue});

  @JsonKey(defaultValue: MastodonApiWebSocketsEventType.notificationStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.notification(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return notification(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return notification?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return notification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return notification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(this);
    }
    return orElse();
  }
}

abstract class _Notification implements MastodonApiWebSocketsEventType {
  const factory _Notification({String stringValue}) = _$_Notification;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$NotificationCopyWith<_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) then) =
      __$DeleteCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(_Delete _value, $Res Function(_Delete) _then)
      : super(_value, (v) => _then(v as _Delete));

  @override
  _Delete get _value => super._value as _Delete;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Delete(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete(
      {this.stringValue = MastodonApiWebSocketsEventType.deleteStringValue});

  @JsonKey(defaultValue: MastodonApiWebSocketsEventType.deleteStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.delete(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Delete &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return delete(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return delete?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements MastodonApiWebSocketsEventType {
  const factory _Delete({String stringValue}) = _$_Delete;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$DeleteCopyWith<_Delete> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FiltersChangedCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$FiltersChangedCopyWith(
          _FiltersChanged value, $Res Function(_FiltersChanged) then) =
      __$FiltersChangedCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$FiltersChangedCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$FiltersChangedCopyWith<$Res> {
  __$FiltersChangedCopyWithImpl(
      _FiltersChanged _value, $Res Function(_FiltersChanged) _then)
      : super(_value, (v) => _then(v as _FiltersChanged));

  @override
  _FiltersChanged get _value => super._value as _FiltersChanged;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_FiltersChanged(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FiltersChanged implements _FiltersChanged {
  const _$_FiltersChanged(
      {this.stringValue =
          MastodonApiWebSocketsEventType.filtersChangedStringValue});

  @JsonKey(
      defaultValue: MastodonApiWebSocketsEventType.filtersChangedStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.filtersChanged(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FiltersChanged &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$FiltersChangedCopyWith<_FiltersChanged> get copyWith =>
      __$FiltersChangedCopyWithImpl<_FiltersChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return filtersChanged(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return filtersChanged?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return filtersChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return filtersChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(this);
    }
    return orElse();
  }
}

abstract class _FiltersChanged implements MastodonApiWebSocketsEventType {
  const factory _FiltersChanged({String stringValue}) = _$_FiltersChanged;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$FiltersChangedCopyWith<_FiltersChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AnnouncementCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$AnnouncementCopyWith(
          _Announcement value, $Res Function(_Announcement) then) =
      __$AnnouncementCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AnnouncementCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$AnnouncementCopyWith<$Res> {
  __$AnnouncementCopyWithImpl(
      _Announcement _value, $Res Function(_Announcement) _then)
      : super(_value, (v) => _then(v as _Announcement));

  @override
  _Announcement get _value => super._value as _Announcement;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Announcement(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Announcement implements _Announcement {
  const _$_Announcement(
      {this.stringValue =
          MastodonApiWebSocketsEventType.announcementStringValue});

  @JsonKey(defaultValue: MastodonApiWebSocketsEventType.announcementStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.announcement(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Announcement &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      __$AnnouncementCopyWithImpl<_Announcement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return announcement(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return announcement?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (announcement != null) {
      return announcement(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return announcement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return announcement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (announcement != null) {
      return announcement(this);
    }
    return orElse();
  }
}

abstract class _Announcement implements MastodonApiWebSocketsEventType {
  const factory _Announcement({String stringValue}) = _$_Announcement;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Conversation(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Conversation implements _Conversation {
  const _$_Conversation(
      {this.stringValue =
          MastodonApiWebSocketsEventType.conversationStringValue});

  @JsonKey(defaultValue: MastodonApiWebSocketsEventType.conversationStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEventType.conversation(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return conversation(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return conversation?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (conversation != null) {
      return conversation(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return conversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return conversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (conversation != null) {
      return conversation(this);
    }
    return orElse();
  }
}

abstract class _Conversation implements MastodonApiWebSocketsEventType {
  const factory _Conversation({String stringValue}) = _$_Conversation;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $MastodonApiWebSocketsEventTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventTypeCopyWithImpl<$Res>
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
    return 'MastodonApiWebSocketsEventType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) update,
    required TResult Function(String stringValue) notification,
    required TResult Function(String stringValue) delete,
    required TResult Function(String stringValue) filtersChanged,
    required TResult Function(String stringValue) announcement,
    required TResult Function(String stringValue) conversation,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? update,
    TResult Function(String stringValue)? notification,
    TResult Function(String stringValue)? delete,
    TResult Function(String stringValue)? filtersChanged,
    TResult Function(String stringValue)? announcement,
    TResult Function(String stringValue)? conversation,
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
    required TResult Function(_Update value) update,
    required TResult Function(_Notification value) notification,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FiltersChanged value) filtersChanged,
    required TResult Function(_Announcement value) announcement,
    required TResult Function(_Conversation value) conversation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_Notification value)? notification,
    TResult Function(_Delete value)? delete,
    TResult Function(_FiltersChanged value)? filtersChanged,
    TResult Function(_Announcement value)? announcement,
    TResult Function(_Conversation value)? conversation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements MastodonApiWebSocketsEventType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

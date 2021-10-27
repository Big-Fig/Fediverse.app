// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_push_loader_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationPushLoaderNotificationTearOff {
  const _$NotificationPushLoaderNotificationTearOff();

  _NotificationPushLoaderNotification call(
      {required INotification notification,
      required NotificationsPushHandlerMessage
          notificationsPushHandlerMessage}) {
    return _NotificationPushLoaderNotification(
      notification: notification,
      notificationsPushHandlerMessage: notificationsPushHandlerMessage,
    );
  }
}

/// @nodoc
const $NotificationPushLoaderNotification =
    _$NotificationPushLoaderNotificationTearOff();

/// @nodoc
mixin _$NotificationPushLoaderNotification {
  INotification get notification => throw _privateConstructorUsedError;
  NotificationsPushHandlerMessage get notificationsPushHandlerMessage =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationPushLoaderNotificationCopyWith<
          NotificationPushLoaderNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPushLoaderNotificationCopyWith<$Res> {
  factory $NotificationPushLoaderNotificationCopyWith(
          NotificationPushLoaderNotification value,
          $Res Function(NotificationPushLoaderNotification) then) =
      _$NotificationPushLoaderNotificationCopyWithImpl<$Res>;
  $Res call(
      {INotification notification,
      NotificationsPushHandlerMessage notificationsPushHandlerMessage});

  $NotificationsPushHandlerMessageCopyWith<$Res>
      get notificationsPushHandlerMessage;
}

/// @nodoc
class _$NotificationPushLoaderNotificationCopyWithImpl<$Res>
    implements $NotificationPushLoaderNotificationCopyWith<$Res> {
  _$NotificationPushLoaderNotificationCopyWithImpl(this._value, this._then);

  final NotificationPushLoaderNotification _value;
  // ignore: unused_field
  final $Res Function(NotificationPushLoaderNotification) _then;

  @override
  $Res call({
    Object? notification = freezed,
    Object? notificationsPushHandlerMessage = freezed,
  }) {
    return _then(_value.copyWith(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as INotification,
      notificationsPushHandlerMessage: notificationsPushHandlerMessage ==
              freezed
          ? _value.notificationsPushHandlerMessage
          : notificationsPushHandlerMessage // ignore: cast_nullable_to_non_nullable
              as NotificationsPushHandlerMessage,
    ));
  }

  @override
  $NotificationsPushHandlerMessageCopyWith<$Res>
      get notificationsPushHandlerMessage {
    return $NotificationsPushHandlerMessageCopyWith<$Res>(
        _value.notificationsPushHandlerMessage, (value) {
      return _then(_value.copyWith(notificationsPushHandlerMessage: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationPushLoaderNotificationCopyWith<$Res>
    implements $NotificationPushLoaderNotificationCopyWith<$Res> {
  factory _$NotificationPushLoaderNotificationCopyWith(
          _NotificationPushLoaderNotification value,
          $Res Function(_NotificationPushLoaderNotification) then) =
      __$NotificationPushLoaderNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {INotification notification,
      NotificationsPushHandlerMessage notificationsPushHandlerMessage});

  @override
  $NotificationsPushHandlerMessageCopyWith<$Res>
      get notificationsPushHandlerMessage;
}

/// @nodoc
class __$NotificationPushLoaderNotificationCopyWithImpl<$Res>
    extends _$NotificationPushLoaderNotificationCopyWithImpl<$Res>
    implements _$NotificationPushLoaderNotificationCopyWith<$Res> {
  __$NotificationPushLoaderNotificationCopyWithImpl(
      _NotificationPushLoaderNotification _value,
      $Res Function(_NotificationPushLoaderNotification) _then)
      : super(_value, (v) => _then(v as _NotificationPushLoaderNotification));

  @override
  _NotificationPushLoaderNotification get _value =>
      super._value as _NotificationPushLoaderNotification;

  @override
  $Res call({
    Object? notification = freezed,
    Object? notificationsPushHandlerMessage = freezed,
  }) {
    return _then(_NotificationPushLoaderNotification(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as INotification,
      notificationsPushHandlerMessage: notificationsPushHandlerMessage ==
              freezed
          ? _value.notificationsPushHandlerMessage
          : notificationsPushHandlerMessage // ignore: cast_nullable_to_non_nullable
              as NotificationsPushHandlerMessage,
    ));
  }
}

/// @nodoc

class _$_NotificationPushLoaderNotification
    implements _NotificationPushLoaderNotification {
  const _$_NotificationPushLoaderNotification(
      {required this.notification,
      required this.notificationsPushHandlerMessage});

  @override
  final INotification notification;
  @override
  final NotificationsPushHandlerMessage notificationsPushHandlerMessage;

  @override
  String toString() {
    return 'NotificationPushLoaderNotification(notification: $notification, notificationsPushHandlerMessage: $notificationsPushHandlerMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPushLoaderNotification &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.notificationsPushHandlerMessage,
                    notificationsPushHandlerMessage) ||
                other.notificationsPushHandlerMessage ==
                    notificationsPushHandlerMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, notification, notificationsPushHandlerMessage);

  @JsonKey(ignore: true)
  @override
  _$NotificationPushLoaderNotificationCopyWith<
          _NotificationPushLoaderNotification>
      get copyWith => __$NotificationPushLoaderNotificationCopyWithImpl<
          _NotificationPushLoaderNotification>(this, _$identity);
}

abstract class _NotificationPushLoaderNotification
    implements NotificationPushLoaderNotification {
  const factory _NotificationPushLoaderNotification(
          {required INotification notification,
          required NotificationsPushHandlerMessage
              notificationsPushHandlerMessage}) =
      _$_NotificationPushLoaderNotification;

  @override
  INotification get notification;
  @override
  NotificationsPushHandlerMessage get notificationsPushHandlerMessage;
  @override
  @JsonKey(ignore: true)
  _$NotificationPushLoaderNotificationCopyWith<
          _NotificationPushLoaderNotification>
      get copyWith => throw _privateConstructorUsedError;
}

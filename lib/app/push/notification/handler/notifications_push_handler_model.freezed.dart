// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_push_handler_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsPushHandlerMessage _$NotificationsPushHandlerMessageFromJson(
    Map<String, dynamic> json) {
  return _NotificationsPushHandlerMessage.fromJson(json);
}

/// @nodoc
class _$NotificationsPushHandlerMessageTearOff {
  const _$NotificationsPushHandlerMessageTearOff();

  _NotificationsPushHandlerMessage call(
      {@HiveField(0)
          required FediPushNotification body,
      @HiveField(1)
      @JsonKey(name: 'push_message')
          required PushMessage pushMessage}) {
    return _NotificationsPushHandlerMessage(
      body: body,
      pushMessage: pushMessage,
    );
  }

  NotificationsPushHandlerMessage fromJson(Map<String, Object> json) {
    return NotificationsPushHandlerMessage.fromJson(json);
  }
}

/// @nodoc
const $NotificationsPushHandlerMessage =
    _$NotificationsPushHandlerMessageTearOff();

/// @nodoc
mixin _$NotificationsPushHandlerMessage {
  @HiveField(0)
  FediPushNotification get body => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'push_message')
  PushMessage get pushMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsPushHandlerMessageCopyWith<NotificationsPushHandlerMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsPushHandlerMessageCopyWith<$Res> {
  factory $NotificationsPushHandlerMessageCopyWith(
          NotificationsPushHandlerMessage value,
          $Res Function(NotificationsPushHandlerMessage) then) =
      _$NotificationsPushHandlerMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) FediPushNotification body,
      @HiveField(1) @JsonKey(name: 'push_message') PushMessage pushMessage});

  $FediPushNotificationCopyWith<$Res> get body;
  $PushMessageCopyWith<$Res> get pushMessage;
}

/// @nodoc
class _$NotificationsPushHandlerMessageCopyWithImpl<$Res>
    implements $NotificationsPushHandlerMessageCopyWith<$Res> {
  _$NotificationsPushHandlerMessageCopyWithImpl(this._value, this._then);

  final NotificationsPushHandlerMessage _value;
  // ignore: unused_field
  final $Res Function(NotificationsPushHandlerMessage) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? pushMessage = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as FediPushNotification,
      pushMessage: pushMessage == freezed
          ? _value.pushMessage
          : pushMessage // ignore: cast_nullable_to_non_nullable
              as PushMessage,
    ));
  }

  @override
  $FediPushNotificationCopyWith<$Res> get body {
    return $FediPushNotificationCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value));
    });
  }

  @override
  $PushMessageCopyWith<$Res> get pushMessage {
    return $PushMessageCopyWith<$Res>(_value.pushMessage, (value) {
      return _then(_value.copyWith(pushMessage: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationsPushHandlerMessageCopyWith<$Res>
    implements $NotificationsPushHandlerMessageCopyWith<$Res> {
  factory _$NotificationsPushHandlerMessageCopyWith(
          _NotificationsPushHandlerMessage value,
          $Res Function(_NotificationsPushHandlerMessage) then) =
      __$NotificationsPushHandlerMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) FediPushNotification body,
      @HiveField(1) @JsonKey(name: 'push_message') PushMessage pushMessage});

  @override
  $FediPushNotificationCopyWith<$Res> get body;
  @override
  $PushMessageCopyWith<$Res> get pushMessage;
}

/// @nodoc
class __$NotificationsPushHandlerMessageCopyWithImpl<$Res>
    extends _$NotificationsPushHandlerMessageCopyWithImpl<$Res>
    implements _$NotificationsPushHandlerMessageCopyWith<$Res> {
  __$NotificationsPushHandlerMessageCopyWithImpl(
      _NotificationsPushHandlerMessage _value,
      $Res Function(_NotificationsPushHandlerMessage) _then)
      : super(_value, (v) => _then(v as _NotificationsPushHandlerMessage));

  @override
  _NotificationsPushHandlerMessage get _value =>
      super._value as _NotificationsPushHandlerMessage;

  @override
  $Res call({
    Object? body = freezed,
    Object? pushMessage = freezed,
  }) {
    return _then(_NotificationsPushHandlerMessage(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as FediPushNotification,
      pushMessage: pushMessage == freezed
          ? _value.pushMessage
          : pushMessage // ignore: cast_nullable_to_non_nullable
              as PushMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsPushHandlerMessage
    implements _NotificationsPushHandlerMessage {
  const _$_NotificationsPushHandlerMessage(
      {@HiveField(0) required this.body,
      @HiveField(1) @JsonKey(name: 'push_message') required this.pushMessage});

  factory _$_NotificationsPushHandlerMessage.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotificationsPushHandlerMessageFromJson(json);

  @override
  @HiveField(0)
  final FediPushNotification body;
  @override
  @HiveField(1)
  @JsonKey(name: 'push_message')
  final PushMessage pushMessage;

  @override
  String toString() {
    return 'NotificationsPushHandlerMessage(body: $body, pushMessage: $pushMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationsPushHandlerMessage &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.pushMessage, pushMessage) ||
                const DeepCollectionEquality()
                    .equals(other.pushMessage, pushMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(pushMessage);

  @JsonKey(ignore: true)
  @override
  _$NotificationsPushHandlerMessageCopyWith<_NotificationsPushHandlerMessage>
      get copyWith => __$NotificationsPushHandlerMessageCopyWithImpl<
          _NotificationsPushHandlerMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsPushHandlerMessageToJson(this);
  }
}

abstract class _NotificationsPushHandlerMessage
    implements NotificationsPushHandlerMessage {
  const factory _NotificationsPushHandlerMessage(
          {@HiveField(0)
              required FediPushNotification body,
          @HiveField(1)
          @JsonKey(name: 'push_message')
              required PushMessage pushMessage}) =
      _$_NotificationsPushHandlerMessage;

  factory _NotificationsPushHandlerMessage.fromJson(Map<String, dynamic> json) =
      _$_NotificationsPushHandlerMessage.fromJson;

  @override
  @HiveField(0)
  FediPushNotification get body => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'push_message')
  PushMessage get pushMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationsPushHandlerMessageCopyWith<_NotificationsPushHandlerMessage>
      get copyWith => throw _privateConstructorUsedError;
}

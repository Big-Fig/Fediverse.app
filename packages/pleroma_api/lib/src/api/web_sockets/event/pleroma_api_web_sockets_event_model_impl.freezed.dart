// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiWebSocketsEvent _$PleromaApiWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiWebSocketsEvent.fromJson(json);
}

/// @nodoc
class _$PleromaApiWebSocketsEventTearOff {
  const _$PleromaApiWebSocketsEventTearOff();

  _PleromaApiWebSocketsEvent call(
      {@JsonKey(name: 'event')
      @HiveField(0)
          required String type,
      @HiveField(2)
          required PleromaApiWebSocketsChannel channel,
      @HiveField(3)
          required PleromaApiStatus? status,
      @HiveField(4)
          required PleromaApiNotification? notification,
      @HiveField(5)
          required PleromaApiAnnouncement? announcement,
      @HiveField(6)
          required PleromaApiChat? chat,
      @HiveField(7)
          required PleromaApiConversation? conversation,
      @HiveField(8)
          required String? id,
      @HiveField(9)
          required PleromaApiAccountRelationshipFollowUpdate? followUpdate,
      @HiveField(10)
          required String? payload}) {
    return _PleromaApiWebSocketsEvent(
      type: type,
      channel: channel,
      status: status,
      notification: notification,
      announcement: announcement,
      chat: chat,
      conversation: conversation,
      id: id,
      followUpdate: followUpdate,
      payload: payload,
    );
  }

  PleromaApiWebSocketsEvent fromJson(Map<String, Object> json) {
    return PleromaApiWebSocketsEvent.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiWebSocketsEvent = _$PleromaApiWebSocketsEventTearOff();

/// @nodoc
mixin _$PleromaApiWebSocketsEvent {
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiWebSocketsChannel get channel => throw _privateConstructorUsedError;
  @HiveField(3)
  PleromaApiStatus? get status => throw _privateConstructorUsedError;
  @HiveField(4)
  PleromaApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  PleromaApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @HiveField(6)
  PleromaApiChat? get chat => throw _privateConstructorUsedError;
  @HiveField(7)
  PleromaApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(9)
  PleromaApiAccountRelationshipFollowUpdate? get followUpdate =>
      throw _privateConstructorUsedError;
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiWebSocketsEventCopyWith<PleromaApiWebSocketsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiWebSocketsEventCopyWith<$Res> {
  factory $PleromaApiWebSocketsEventCopyWith(PleromaApiWebSocketsEvent value,
          $Res Function(PleromaApiWebSocketsEvent) then) =
      _$PleromaApiWebSocketsEventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @HiveField(2) PleromaApiWebSocketsChannel channel,
      @HiveField(3) PleromaApiStatus? status,
      @HiveField(4) PleromaApiNotification? notification,
      @HiveField(5) PleromaApiAnnouncement? announcement,
      @HiveField(6) PleromaApiChat? chat,
      @HiveField(7) PleromaApiConversation? conversation,
      @HiveField(8) String? id,
      @HiveField(9) PleromaApiAccountRelationshipFollowUpdate? followUpdate,
      @HiveField(10) String? payload});

  $PleromaApiWebSocketsChannelCopyWith<$Res> get channel;
  $PleromaApiStatusCopyWith<$Res>? get status;
  $PleromaApiNotificationCopyWith<$Res>? get notification;
  $PleromaApiAnnouncementCopyWith<$Res>? get announcement;
  $PleromaApiChatCopyWith<$Res>? get chat;
  $PleromaApiConversationCopyWith<$Res>? get conversation;
  $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate;
}

/// @nodoc
class _$PleromaApiWebSocketsEventCopyWithImpl<$Res>
    implements $PleromaApiWebSocketsEventCopyWith<$Res> {
  _$PleromaApiWebSocketsEventCopyWithImpl(this._value, this._then);

  final PleromaApiWebSocketsEvent _value;
  // ignore: unused_field
  final $Res Function(PleromaApiWebSocketsEvent) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? channel = freezed,
    Object? status = freezed,
    Object? notification = freezed,
    Object? announcement = freezed,
    Object? chat = freezed,
    Object? conversation = freezed,
    Object? id = freezed,
    Object? followUpdate = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as PleromaApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAnnouncement?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as PleromaApiChat?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpdate: followUpdate == freezed
          ? _value.followUpdate
          : followUpdate // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationshipFollowUpdate?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PleromaApiWebSocketsChannelCopyWith<$Res> get channel {
    return $PleromaApiWebSocketsChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }

  @override
  $PleromaApiStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $PleromaApiStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $PleromaApiNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $PleromaApiNotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }

  @override
  $PleromaApiAnnouncementCopyWith<$Res>? get announcement {
    if (_value.announcement == null) {
      return null;
    }

    return $PleromaApiAnnouncementCopyWith<$Res>(_value.announcement!, (value) {
      return _then(_value.copyWith(announcement: value));
    });
  }

  @override
  $PleromaApiChatCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $PleromaApiChatCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value));
    });
  }

  @override
  $PleromaApiConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $PleromaApiConversationCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }

  @override
  $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate {
    if (_value.followUpdate == null) {
      return null;
    }

    return $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res>(
        _value.followUpdate!, (value) {
      return _then(_value.copyWith(followUpdate: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiWebSocketsEventCopyWith<$Res>
    implements $PleromaApiWebSocketsEventCopyWith<$Res> {
  factory _$PleromaApiWebSocketsEventCopyWith(_PleromaApiWebSocketsEvent value,
          $Res Function(_PleromaApiWebSocketsEvent) then) =
      __$PleromaApiWebSocketsEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @HiveField(2) PleromaApiWebSocketsChannel channel,
      @HiveField(3) PleromaApiStatus? status,
      @HiveField(4) PleromaApiNotification? notification,
      @HiveField(5) PleromaApiAnnouncement? announcement,
      @HiveField(6) PleromaApiChat? chat,
      @HiveField(7) PleromaApiConversation? conversation,
      @HiveField(8) String? id,
      @HiveField(9) PleromaApiAccountRelationshipFollowUpdate? followUpdate,
      @HiveField(10) String? payload});

  @override
  $PleromaApiWebSocketsChannelCopyWith<$Res> get channel;
  @override
  $PleromaApiStatusCopyWith<$Res>? get status;
  @override
  $PleromaApiNotificationCopyWith<$Res>? get notification;
  @override
  $PleromaApiAnnouncementCopyWith<$Res>? get announcement;
  @override
  $PleromaApiChatCopyWith<$Res>? get chat;
  @override
  $PleromaApiConversationCopyWith<$Res>? get conversation;
  @override
  $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate;
}

/// @nodoc
class __$PleromaApiWebSocketsEventCopyWithImpl<$Res>
    extends _$PleromaApiWebSocketsEventCopyWithImpl<$Res>
    implements _$PleromaApiWebSocketsEventCopyWith<$Res> {
  __$PleromaApiWebSocketsEventCopyWithImpl(_PleromaApiWebSocketsEvent _value,
      $Res Function(_PleromaApiWebSocketsEvent) _then)
      : super(_value, (v) => _then(v as _PleromaApiWebSocketsEvent));

  @override
  _PleromaApiWebSocketsEvent get _value =>
      super._value as _PleromaApiWebSocketsEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? channel = freezed,
    Object? status = freezed,
    Object? notification = freezed,
    Object? announcement = freezed,
    Object? chat = freezed,
    Object? conversation = freezed,
    Object? id = freezed,
    Object? followUpdate = freezed,
    Object? payload = freezed,
  }) {
    return _then(_PleromaApiWebSocketsEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as PleromaApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as PleromaApiAnnouncement?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as PleromaApiChat?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpdate: followUpdate == freezed
          ? _value.followUpdate
          : followUpdate // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationshipFollowUpdate?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiWebSocketsEvent implements _PleromaApiWebSocketsEvent {
  const _$_PleromaApiWebSocketsEvent(
      {@JsonKey(name: 'event') @HiveField(0) required this.type,
      @HiveField(2) required this.channel,
      @HiveField(3) required this.status,
      @HiveField(4) required this.notification,
      @HiveField(5) required this.announcement,
      @HiveField(6) required this.chat,
      @HiveField(7) required this.conversation,
      @HiveField(8) required this.id,
      @HiveField(9) required this.followUpdate,
      @HiveField(10) required this.payload});

  factory _$_PleromaApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiWebSocketsEventFromJson(json);

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  final String type;
  @override
  @HiveField(2)
  final PleromaApiWebSocketsChannel channel;
  @override
  @HiveField(3)
  final PleromaApiStatus? status;
  @override
  @HiveField(4)
  final PleromaApiNotification? notification;
  @override
  @HiveField(5)
  final PleromaApiAnnouncement? announcement;
  @override
  @HiveField(6)
  final PleromaApiChat? chat;
  @override
  @HiveField(7)
  final PleromaApiConversation? conversation;
  @override
  @HiveField(8)
  final String? id;
  @override
  @HiveField(9)
  final PleromaApiAccountRelationshipFollowUpdate? followUpdate;
  @override
  @HiveField(10)
  final String? payload;

  @override
  String toString() {
    return 'PleromaApiWebSocketsEvent(type: $type, channel: $channel, status: $status, notification: $notification, announcement: $announcement, chat: $chat, conversation: $conversation, id: $id, followUpdate: $followUpdate, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiWebSocketsEvent &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality()
                    .equals(other.channel, channel)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)) &&
            (identical(other.announcement, announcement) ||
                const DeepCollectionEquality()
                    .equals(other.announcement, announcement)) &&
            (identical(other.chat, chat) ||
                const DeepCollectionEquality().equals(other.chat, chat)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.followUpdate, followUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.followUpdate, followUpdate)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(channel) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(notification) ^
      const DeepCollectionEquality().hash(announcement) ^
      const DeepCollectionEquality().hash(chat) ^
      const DeepCollectionEquality().hash(conversation) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(followUpdate) ^
      const DeepCollectionEquality().hash(payload);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiWebSocketsEventCopyWith<_PleromaApiWebSocketsEvent>
      get copyWith =>
          __$PleromaApiWebSocketsEventCopyWithImpl<_PleromaApiWebSocketsEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiWebSocketsEventToJson(this);
  }
}

abstract class _PleromaApiWebSocketsEvent implements PleromaApiWebSocketsEvent {
  const factory _PleromaApiWebSocketsEvent(
      {@JsonKey(name: 'event')
      @HiveField(0)
          required String type,
      @HiveField(2)
          required PleromaApiWebSocketsChannel channel,
      @HiveField(3)
          required PleromaApiStatus? status,
      @HiveField(4)
          required PleromaApiNotification? notification,
      @HiveField(5)
          required PleromaApiAnnouncement? announcement,
      @HiveField(6)
          required PleromaApiChat? chat,
      @HiveField(7)
          required PleromaApiConversation? conversation,
      @HiveField(8)
          required String? id,
      @HiveField(9)
          required PleromaApiAccountRelationshipFollowUpdate? followUpdate,
      @HiveField(10)
          required String? payload}) = _$_PleromaApiWebSocketsEvent;

  factory _PleromaApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiWebSocketsEvent.fromJson;

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  PleromaApiWebSocketsChannel get channel => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  PleromaApiStatus? get status => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  PleromaApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  PleromaApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  PleromaApiChat? get chat => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  PleromaApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  PleromaApiAccountRelationshipFollowUpdate? get followUpdate =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiWebSocketsEventCopyWith<_PleromaApiWebSocketsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiWebSocketsRawEvent _$PleromaApiWebSocketsRawEventFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiWebSocketsRawEvent.fromJson(json);
}

/// @nodoc
class _$PleromaApiWebSocketsRawEventTearOff {
  const _$PleromaApiWebSocketsRawEventTearOff();

  _PleromaApiWebSocketsRawEvent call(
      {@JsonKey(name: 'event') @HiveField(0) required String type,
      @JsonKey(name: 'payload') @HiveField(10) required String? payload}) {
    return _PleromaApiWebSocketsRawEvent(
      type: type,
      payload: payload,
    );
  }

  PleromaApiWebSocketsRawEvent fromJson(Map<String, Object> json) {
    return PleromaApiWebSocketsRawEvent.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiWebSocketsRawEvent = _$PleromaApiWebSocketsRawEventTearOff();

/// @nodoc
mixin _$PleromaApiWebSocketsRawEvent {
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload')
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiWebSocketsRawEventCopyWith<PleromaApiWebSocketsRawEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiWebSocketsRawEventCopyWith<$Res> {
  factory $PleromaApiWebSocketsRawEventCopyWith(
          PleromaApiWebSocketsRawEvent value,
          $Res Function(PleromaApiWebSocketsRawEvent) then) =
      _$PleromaApiWebSocketsRawEventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload});
}

/// @nodoc
class _$PleromaApiWebSocketsRawEventCopyWithImpl<$Res>
    implements $PleromaApiWebSocketsRawEventCopyWith<$Res> {
  _$PleromaApiWebSocketsRawEventCopyWithImpl(this._value, this._then);

  final PleromaApiWebSocketsRawEvent _value;
  // ignore: unused_field
  final $Res Function(PleromaApiWebSocketsRawEvent) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiWebSocketsRawEventCopyWith<$Res>
    implements $PleromaApiWebSocketsRawEventCopyWith<$Res> {
  factory _$PleromaApiWebSocketsRawEventCopyWith(
          _PleromaApiWebSocketsRawEvent value,
          $Res Function(_PleromaApiWebSocketsRawEvent) then) =
      __$PleromaApiWebSocketsRawEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload});
}

/// @nodoc
class __$PleromaApiWebSocketsRawEventCopyWithImpl<$Res>
    extends _$PleromaApiWebSocketsRawEventCopyWithImpl<$Res>
    implements _$PleromaApiWebSocketsRawEventCopyWith<$Res> {
  __$PleromaApiWebSocketsRawEventCopyWithImpl(
      _PleromaApiWebSocketsRawEvent _value,
      $Res Function(_PleromaApiWebSocketsRawEvent) _then)
      : super(_value, (v) => _then(v as _PleromaApiWebSocketsRawEvent));

  @override
  _PleromaApiWebSocketsRawEvent get _value =>
      super._value as _PleromaApiWebSocketsRawEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
  }) {
    return _then(_PleromaApiWebSocketsRawEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiWebSocketsRawEvent implements _PleromaApiWebSocketsRawEvent {
  const _$_PleromaApiWebSocketsRawEvent(
      {@JsonKey(name: 'event') @HiveField(0) required this.type,
      @JsonKey(name: 'payload') @HiveField(10) required this.payload});

  factory _$_PleromaApiWebSocketsRawEvent.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiWebSocketsRawEventFromJson(json);

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  final String type;
  @override
  @JsonKey(name: 'payload')
  @HiveField(10)
  final String? payload;

  @override
  String toString() {
    return 'PleromaApiWebSocketsRawEvent(type: $type, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiWebSocketsRawEvent &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(payload);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiWebSocketsRawEventCopyWith<_PleromaApiWebSocketsRawEvent>
      get copyWith => __$PleromaApiWebSocketsRawEventCopyWithImpl<
          _PleromaApiWebSocketsRawEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiWebSocketsRawEventToJson(this);
  }
}

abstract class _PleromaApiWebSocketsRawEvent
    implements PleromaApiWebSocketsRawEvent {
  const factory _PleromaApiWebSocketsRawEvent(
          {@JsonKey(name: 'event') @HiveField(0) required String type,
          @JsonKey(name: 'payload') @HiveField(10) required String? payload}) =
      _$_PleromaApiWebSocketsRawEvent;

  factory _PleromaApiWebSocketsRawEvent.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiWebSocketsRawEvent.fromJson;

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'payload')
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiWebSocketsRawEventCopyWith<_PleromaApiWebSocketsRawEvent>
      get copyWith => throw _privateConstructorUsedError;
}

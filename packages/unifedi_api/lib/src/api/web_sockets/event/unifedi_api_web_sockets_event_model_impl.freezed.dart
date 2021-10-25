// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiWebSocketsEvent _$UnifediApiWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiWebSocketsEvent.fromJson(json);
}

/// @nodoc
class _$UnifediApiWebSocketsEventTearOff {
  const _$UnifediApiWebSocketsEventTearOff();

  _UnifediApiWebSocketsEvent call(
      {@JsonKey(name: 'event')
      @HiveField(0)
          required String type,
      @HiveField(2)
          required UnifediApiWebSocketsChannel channel,
      @HiveField(3)
          required UnifediApiStatus? status,
      @HiveField(4)
          required UnifediApiNotification? notification,
      @HiveField(5)
          required UnifediApiAnnouncement? announcement,
      @HiveField(6)
          required UnifediApiChat? chat,
      @HiveField(7)
          required UnifediApiConversation? conversation,
      @HiveField(8)
          required String? id,
      @HiveField(9)
          required UnifediApiAccountRelationshipFollowUpdate? followUpdate}) {
    return _UnifediApiWebSocketsEvent(
      type: type,
      channel: channel,
      status: status,
      notification: notification,
      announcement: announcement,
      chat: chat,
      conversation: conversation,
      id: id,
      followUpdate: followUpdate,
    );
  }

  UnifediApiWebSocketsEvent fromJson(Map<String, Object> json) {
    return UnifediApiWebSocketsEvent.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiWebSocketsEvent = _$UnifediApiWebSocketsEventTearOff();

/// @nodoc
mixin _$UnifediApiWebSocketsEvent {
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiWebSocketsChannel get channel => throw _privateConstructorUsedError;
  @HiveField(3)
  UnifediApiStatus? get status => throw _privateConstructorUsedError;
  @HiveField(4)
  UnifediApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  UnifediApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @HiveField(6)
  UnifediApiChat? get chat => throw _privateConstructorUsedError;
  @HiveField(7)
  UnifediApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(9)
  UnifediApiAccountRelationshipFollowUpdate? get followUpdate =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiWebSocketsEventCopyWith<UnifediApiWebSocketsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiWebSocketsEventCopyWith<$Res> {
  factory $UnifediApiWebSocketsEventCopyWith(UnifediApiWebSocketsEvent value,
          $Res Function(UnifediApiWebSocketsEvent) then) =
      _$UnifediApiWebSocketsEventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @HiveField(2) UnifediApiWebSocketsChannel channel,
      @HiveField(3) UnifediApiStatus? status,
      @HiveField(4) UnifediApiNotification? notification,
      @HiveField(5) UnifediApiAnnouncement? announcement,
      @HiveField(6) UnifediApiChat? chat,
      @HiveField(7) UnifediApiConversation? conversation,
      @HiveField(8) String? id,
      @HiveField(9) UnifediApiAccountRelationshipFollowUpdate? followUpdate});

  $UnifediApiWebSocketsChannelCopyWith<$Res> get channel;
  $UnifediApiStatusCopyWith<$Res>? get status;
  $UnifediApiNotificationCopyWith<$Res>? get notification;
  $UnifediApiAnnouncementCopyWith<$Res>? get announcement;
  $UnifediApiChatCopyWith<$Res>? get chat;
  $UnifediApiConversationCopyWith<$Res>? get conversation;
  $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate;
}

/// @nodoc
class _$UnifediApiWebSocketsEventCopyWithImpl<$Res>
    implements $UnifediApiWebSocketsEventCopyWith<$Res> {
  _$UnifediApiWebSocketsEventCopyWithImpl(this._value, this._then);

  final UnifediApiWebSocketsEvent _value;
  // ignore: unused_field
  final $Res Function(UnifediApiWebSocketsEvent) _then;

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
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as UnifediApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as UnifediApiAnnouncement?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as UnifediApiChat?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as UnifediApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpdate: followUpdate == freezed
          ? _value.followUpdate
          : followUpdate // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdate?,
    ));
  }

  @override
  $UnifediApiWebSocketsChannelCopyWith<$Res> get channel {
    return $UnifediApiWebSocketsChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }

  @override
  $UnifediApiStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $UnifediApiStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $UnifediApiNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $UnifediApiNotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }

  @override
  $UnifediApiAnnouncementCopyWith<$Res>? get announcement {
    if (_value.announcement == null) {
      return null;
    }

    return $UnifediApiAnnouncementCopyWith<$Res>(_value.announcement!, (value) {
      return _then(_value.copyWith(announcement: value));
    });
  }

  @override
  $UnifediApiChatCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $UnifediApiChatCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value));
    });
  }

  @override
  $UnifediApiConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $UnifediApiConversationCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }

  @override
  $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate {
    if (_value.followUpdate == null) {
      return null;
    }

    return $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res>(
        _value.followUpdate!, (value) {
      return _then(_value.copyWith(followUpdate: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiWebSocketsEventCopyWith<$Res>
    implements $UnifediApiWebSocketsEventCopyWith<$Res> {
  factory _$UnifediApiWebSocketsEventCopyWith(_UnifediApiWebSocketsEvent value,
          $Res Function(_UnifediApiWebSocketsEvent) then) =
      __$UnifediApiWebSocketsEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @HiveField(2) UnifediApiWebSocketsChannel channel,
      @HiveField(3) UnifediApiStatus? status,
      @HiveField(4) UnifediApiNotification? notification,
      @HiveField(5) UnifediApiAnnouncement? announcement,
      @HiveField(6) UnifediApiChat? chat,
      @HiveField(7) UnifediApiConversation? conversation,
      @HiveField(8) String? id,
      @HiveField(9) UnifediApiAccountRelationshipFollowUpdate? followUpdate});

  @override
  $UnifediApiWebSocketsChannelCopyWith<$Res> get channel;
  @override
  $UnifediApiStatusCopyWith<$Res>? get status;
  @override
  $UnifediApiNotificationCopyWith<$Res>? get notification;
  @override
  $UnifediApiAnnouncementCopyWith<$Res>? get announcement;
  @override
  $UnifediApiChatCopyWith<$Res>? get chat;
  @override
  $UnifediApiConversationCopyWith<$Res>? get conversation;
  @override
  $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res>? get followUpdate;
}

/// @nodoc
class __$UnifediApiWebSocketsEventCopyWithImpl<$Res>
    extends _$UnifediApiWebSocketsEventCopyWithImpl<$Res>
    implements _$UnifediApiWebSocketsEventCopyWith<$Res> {
  __$UnifediApiWebSocketsEventCopyWithImpl(_UnifediApiWebSocketsEvent _value,
      $Res Function(_UnifediApiWebSocketsEvent) _then)
      : super(_value, (v) => _then(v as _UnifediApiWebSocketsEvent));

  @override
  _UnifediApiWebSocketsEvent get _value =>
      super._value as _UnifediApiWebSocketsEvent;

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
  }) {
    return _then(_UnifediApiWebSocketsEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as UnifediApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as UnifediApiAnnouncement?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as UnifediApiChat?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as UnifediApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpdate: followUpdate == freezed
          ? _value.followUpdate
          : followUpdate // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdate?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiWebSocketsEvent implements _UnifediApiWebSocketsEvent {
  const _$_UnifediApiWebSocketsEvent(
      {@JsonKey(name: 'event') @HiveField(0) required this.type,
      @HiveField(2) required this.channel,
      @HiveField(3) required this.status,
      @HiveField(4) required this.notification,
      @HiveField(5) required this.announcement,
      @HiveField(6) required this.chat,
      @HiveField(7) required this.conversation,
      @HiveField(8) required this.id,
      @HiveField(9) required this.followUpdate});

  factory _$_UnifediApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiWebSocketsEventFromJson(json);

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  final String type;
  @override
  @HiveField(2)
  final UnifediApiWebSocketsChannel channel;
  @override
  @HiveField(3)
  final UnifediApiStatus? status;
  @override
  @HiveField(4)
  final UnifediApiNotification? notification;
  @override
  @HiveField(5)
  final UnifediApiAnnouncement? announcement;
  @override
  @HiveField(6)
  final UnifediApiChat? chat;
  @override
  @HiveField(7)
  final UnifediApiConversation? conversation;
  @override
  @HiveField(8)
  final String? id;
  @override
  @HiveField(9)
  final UnifediApiAccountRelationshipFollowUpdate? followUpdate;

  @override
  String toString() {
    return 'UnifediApiWebSocketsEvent(type: $type, channel: $channel, status: $status, notification: $notification, announcement: $announcement, chat: $chat, conversation: $conversation, id: $id, followUpdate: $followUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiWebSocketsEvent &&
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
                    .equals(other.followUpdate, followUpdate)));
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
      const DeepCollectionEquality().hash(followUpdate);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiWebSocketsEventCopyWith<_UnifediApiWebSocketsEvent>
      get copyWith =>
          __$UnifediApiWebSocketsEventCopyWithImpl<_UnifediApiWebSocketsEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiWebSocketsEventToJson(this);
  }
}

abstract class _UnifediApiWebSocketsEvent implements UnifediApiWebSocketsEvent {
  const factory _UnifediApiWebSocketsEvent(
      {@JsonKey(name: 'event')
      @HiveField(0)
          required String type,
      @HiveField(2)
          required UnifediApiWebSocketsChannel channel,
      @HiveField(3)
          required UnifediApiStatus? status,
      @HiveField(4)
          required UnifediApiNotification? notification,
      @HiveField(5)
          required UnifediApiAnnouncement? announcement,
      @HiveField(6)
          required UnifediApiChat? chat,
      @HiveField(7)
          required UnifediApiConversation? conversation,
      @HiveField(8)
          required String? id,
      @HiveField(9)
          required UnifediApiAccountRelationshipFollowUpdate?
              followUpdate}) = _$_UnifediApiWebSocketsEvent;

  factory _UnifediApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiWebSocketsEvent.fromJson;

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  UnifediApiWebSocketsChannel get channel => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  UnifediApiStatus? get status => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  UnifediApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  UnifediApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  UnifediApiChat? get chat => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  UnifediApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  UnifediApiAccountRelationshipFollowUpdate? get followUpdate =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiWebSocketsEventCopyWith<_UnifediApiWebSocketsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

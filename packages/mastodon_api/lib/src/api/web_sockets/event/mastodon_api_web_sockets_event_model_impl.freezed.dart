// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiWebSocketsEvent _$MastodonApiWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiWebSocketsEvent.fromJson(json);
}

/// @nodoc
class _$MastodonApiWebSocketsEventTearOff {
  const _$MastodonApiWebSocketsEventTearOff();

  _MastodonApiWebSocketsEvent call(
      {@JsonKey(name: 'event') @HiveField(0) required String type,
      @JsonKey(name: 'payload') @HiveField(10) required String? payload,
      @HiveField(2) required MastodonApiWebSocketsChannel channel,
      @HiveField(3) required MastodonApiStatus? status,
      @HiveField(4) required MastodonApiNotification? notification,
      @HiveField(5) required MastodonApiAnnouncement? announcement,
      @HiveField(7) required MastodonApiConversation? conversation,
      @HiveField(8) required String? id}) {
    return _MastodonApiWebSocketsEvent(
      type: type,
      payload: payload,
      channel: channel,
      status: status,
      notification: notification,
      announcement: announcement,
      conversation: conversation,
      id: id,
    );
  }

  MastodonApiWebSocketsEvent fromJson(Map<String, Object> json) {
    return MastodonApiWebSocketsEvent.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiWebSocketsEvent = _$MastodonApiWebSocketsEventTearOff();

/// @nodoc
mixin _$MastodonApiWebSocketsEvent {
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload')
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;
  @HiveField(2)
  MastodonApiWebSocketsChannel get channel =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  MastodonApiStatus? get status => throw _privateConstructorUsedError;
  @HiveField(4)
  MastodonApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  MastodonApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  MastodonApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiWebSocketsEventCopyWith<MastodonApiWebSocketsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiWebSocketsEventCopyWith<$Res> {
  factory $MastodonApiWebSocketsEventCopyWith(MastodonApiWebSocketsEvent value,
          $Res Function(MastodonApiWebSocketsEvent) then) =
      _$MastodonApiWebSocketsEventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload,
      @HiveField(2) MastodonApiWebSocketsChannel channel,
      @HiveField(3) MastodonApiStatus? status,
      @HiveField(4) MastodonApiNotification? notification,
      @HiveField(5) MastodonApiAnnouncement? announcement,
      @HiveField(7) MastodonApiConversation? conversation,
      @HiveField(8) String? id});

  $MastodonApiWebSocketsChannelCopyWith<$Res> get channel;
  $MastodonApiStatusCopyWith<$Res>? get status;
  $MastodonApiNotificationCopyWith<$Res>? get notification;
  $MastodonApiAnnouncementCopyWith<$Res>? get announcement;
  $MastodonApiConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class _$MastodonApiWebSocketsEventCopyWithImpl<$Res>
    implements $MastodonApiWebSocketsEventCopyWith<$Res> {
  _$MastodonApiWebSocketsEventCopyWithImpl(this._value, this._then);

  final MastodonApiWebSocketsEvent _value;
  // ignore: unused_field
  final $Res Function(MastodonApiWebSocketsEvent) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
    Object? channel = freezed,
    Object? status = freezed,
    Object? notification = freezed,
    Object? announcement = freezed,
    Object? conversation = freezed,
    Object? id = freezed,
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
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as MastodonApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAnnouncement?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as MastodonApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MastodonApiWebSocketsChannelCopyWith<$Res> get channel {
    return $MastodonApiWebSocketsChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }

  @override
  $MastodonApiStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $MastodonApiStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $MastodonApiNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $MastodonApiNotificationCopyWith<$Res>(_value.notification!,
        (value) {
      return _then(_value.copyWith(notification: value));
    });
  }

  @override
  $MastodonApiAnnouncementCopyWith<$Res>? get announcement {
    if (_value.announcement == null) {
      return null;
    }

    return $MastodonApiAnnouncementCopyWith<$Res>(_value.announcement!,
        (value) {
      return _then(_value.copyWith(announcement: value));
    });
  }

  @override
  $MastodonApiConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $MastodonApiConversationCopyWith<$Res>(_value.conversation!,
        (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiWebSocketsEventCopyWith<$Res>
    implements $MastodonApiWebSocketsEventCopyWith<$Res> {
  factory _$MastodonApiWebSocketsEventCopyWith(
          _MastodonApiWebSocketsEvent value,
          $Res Function(_MastodonApiWebSocketsEvent) then) =
      __$MastodonApiWebSocketsEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload,
      @HiveField(2) MastodonApiWebSocketsChannel channel,
      @HiveField(3) MastodonApiStatus? status,
      @HiveField(4) MastodonApiNotification? notification,
      @HiveField(5) MastodonApiAnnouncement? announcement,
      @HiveField(7) MastodonApiConversation? conversation,
      @HiveField(8) String? id});

  @override
  $MastodonApiWebSocketsChannelCopyWith<$Res> get channel;
  @override
  $MastodonApiStatusCopyWith<$Res>? get status;
  @override
  $MastodonApiNotificationCopyWith<$Res>? get notification;
  @override
  $MastodonApiAnnouncementCopyWith<$Res>? get announcement;
  @override
  $MastodonApiConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$MastodonApiWebSocketsEventCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsEventCopyWithImpl<$Res>
    implements _$MastodonApiWebSocketsEventCopyWith<$Res> {
  __$MastodonApiWebSocketsEventCopyWithImpl(_MastodonApiWebSocketsEvent _value,
      $Res Function(_MastodonApiWebSocketsEvent) _then)
      : super(_value, (v) => _then(v as _MastodonApiWebSocketsEvent));

  @override
  _MastodonApiWebSocketsEvent get _value =>
      super._value as _MastodonApiWebSocketsEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
    Object? channel = freezed,
    Object? status = freezed,
    Object? notification = freezed,
    Object? announcement = freezed,
    Object? conversation = freezed,
    Object? id = freezed,
  }) {
    return _then(_MastodonApiWebSocketsEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsChannel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as MastodonApiNotification?,
      announcement: announcement == freezed
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as MastodonApiAnnouncement?,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as MastodonApiConversation?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiWebSocketsEvent implements _MastodonApiWebSocketsEvent {
  const _$_MastodonApiWebSocketsEvent(
      {@JsonKey(name: 'event') @HiveField(0) required this.type,
      @JsonKey(name: 'payload') @HiveField(10) required this.payload,
      @HiveField(2) required this.channel,
      @HiveField(3) required this.status,
      @HiveField(4) required this.notification,
      @HiveField(5) required this.announcement,
      @HiveField(7) required this.conversation,
      @HiveField(8) required this.id});

  factory _$_MastodonApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiWebSocketsEventFromJson(json);

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  final String type;
  @override
  @JsonKey(name: 'payload')
  @HiveField(10)
  final String? payload;
  @override
  @HiveField(2)
  final MastodonApiWebSocketsChannel channel;
  @override
  @HiveField(3)
  final MastodonApiStatus? status;
  @override
  @HiveField(4)
  final MastodonApiNotification? notification;
  @override
  @HiveField(5)
  final MastodonApiAnnouncement? announcement;
  @override
  @HiveField(7)
  final MastodonApiConversation? conversation;
  @override
  @HiveField(8)
  final String? id;

  @override
  String toString() {
    return 'MastodonApiWebSocketsEvent(type: $type, payload: $payload, channel: $channel, status: $status, notification: $notification, announcement: $announcement, conversation: $conversation, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiWebSocketsEvent &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
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
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(channel) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(notification) ^
      const DeepCollectionEquality().hash(announcement) ^
      const DeepCollectionEquality().hash(conversation) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiWebSocketsEventCopyWith<_MastodonApiWebSocketsEvent>
      get copyWith => __$MastodonApiWebSocketsEventCopyWithImpl<
          _MastodonApiWebSocketsEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiWebSocketsEventToJson(this);
  }
}

abstract class _MastodonApiWebSocketsEvent
    implements MastodonApiWebSocketsEvent {
  const factory _MastodonApiWebSocketsEvent(
      {@JsonKey(name: 'event') @HiveField(0) required String type,
      @JsonKey(name: 'payload') @HiveField(10) required String? payload,
      @HiveField(2) required MastodonApiWebSocketsChannel channel,
      @HiveField(3) required MastodonApiStatus? status,
      @HiveField(4) required MastodonApiNotification? notification,
      @HiveField(5) required MastodonApiAnnouncement? announcement,
      @HiveField(7) required MastodonApiConversation? conversation,
      @HiveField(8) required String? id}) = _$_MastodonApiWebSocketsEvent;

  factory _MastodonApiWebSocketsEvent.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiWebSocketsEvent.fromJson;

  @override
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'payload')
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  MastodonApiWebSocketsChannel get channel =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  MastodonApiStatus? get status => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  MastodonApiNotification? get notification =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  MastodonApiAnnouncement? get announcement =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  MastodonApiConversation? get conversation =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiWebSocketsEventCopyWith<_MastodonApiWebSocketsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

MastodonApiWebSocketsRawEvent _$MastodonApiWebSocketsRawEventFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiWebSocketsRawEvent.fromJson(json);
}

/// @nodoc
class _$MastodonApiWebSocketsRawEventTearOff {
  const _$MastodonApiWebSocketsRawEventTearOff();

  _MastodonApiWebSocketsRawEvent call(
      {@JsonKey(name: 'event') @HiveField(0) required String type,
      @JsonKey(name: 'payload') @HiveField(10) required String? payload}) {
    return _MastodonApiWebSocketsRawEvent(
      type: type,
      payload: payload,
    );
  }

  MastodonApiWebSocketsRawEvent fromJson(Map<String, Object> json) {
    return MastodonApiWebSocketsRawEvent.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiWebSocketsRawEvent = _$MastodonApiWebSocketsRawEventTearOff();

/// @nodoc
mixin _$MastodonApiWebSocketsRawEvent {
  @JsonKey(name: 'event')
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload')
  @HiveField(10)
  String? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiWebSocketsRawEventCopyWith<MastodonApiWebSocketsRawEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiWebSocketsRawEventCopyWith<$Res> {
  factory $MastodonApiWebSocketsRawEventCopyWith(
          MastodonApiWebSocketsRawEvent value,
          $Res Function(MastodonApiWebSocketsRawEvent) then) =
      _$MastodonApiWebSocketsRawEventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload});
}

/// @nodoc
class _$MastodonApiWebSocketsRawEventCopyWithImpl<$Res>
    implements $MastodonApiWebSocketsRawEventCopyWith<$Res> {
  _$MastodonApiWebSocketsRawEventCopyWithImpl(this._value, this._then);

  final MastodonApiWebSocketsRawEvent _value;
  // ignore: unused_field
  final $Res Function(MastodonApiWebSocketsRawEvent) _then;

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
abstract class _$MastodonApiWebSocketsRawEventCopyWith<$Res>
    implements $MastodonApiWebSocketsRawEventCopyWith<$Res> {
  factory _$MastodonApiWebSocketsRawEventCopyWith(
          _MastodonApiWebSocketsRawEvent value,
          $Res Function(_MastodonApiWebSocketsRawEvent) then) =
      __$MastodonApiWebSocketsRawEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event') @HiveField(0) String type,
      @JsonKey(name: 'payload') @HiveField(10) String? payload});
}

/// @nodoc
class __$MastodonApiWebSocketsRawEventCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsRawEventCopyWithImpl<$Res>
    implements _$MastodonApiWebSocketsRawEventCopyWith<$Res> {
  __$MastodonApiWebSocketsRawEventCopyWithImpl(
      _MastodonApiWebSocketsRawEvent _value,
      $Res Function(_MastodonApiWebSocketsRawEvent) _then)
      : super(_value, (v) => _then(v as _MastodonApiWebSocketsRawEvent));

  @override
  _MastodonApiWebSocketsRawEvent get _value =>
      super._value as _MastodonApiWebSocketsRawEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
  }) {
    return _then(_MastodonApiWebSocketsRawEvent(
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
class _$_MastodonApiWebSocketsRawEvent
    implements _MastodonApiWebSocketsRawEvent {
  const _$_MastodonApiWebSocketsRawEvent(
      {@JsonKey(name: 'event') @HiveField(0) required this.type,
      @JsonKey(name: 'payload') @HiveField(10) required this.payload});

  factory _$_MastodonApiWebSocketsRawEvent.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiWebSocketsRawEventFromJson(json);

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
    return 'MastodonApiWebSocketsRawEvent(type: $type, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiWebSocketsRawEvent &&
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
  _$MastodonApiWebSocketsRawEventCopyWith<_MastodonApiWebSocketsRawEvent>
      get copyWith => __$MastodonApiWebSocketsRawEventCopyWithImpl<
          _MastodonApiWebSocketsRawEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiWebSocketsRawEventToJson(this);
  }
}

abstract class _MastodonApiWebSocketsRawEvent
    implements MastodonApiWebSocketsRawEvent {
  const factory _MastodonApiWebSocketsRawEvent(
          {@JsonKey(name: 'event') @HiveField(0) required String type,
          @JsonKey(name: 'payload') @HiveField(10) required String? payload}) =
      _$_MastodonApiWebSocketsRawEvent;

  factory _MastodonApiWebSocketsRawEvent.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiWebSocketsRawEvent.fromJson;

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
  _$MastodonApiWebSocketsRawEventCopyWith<_MastodonApiWebSocketsRawEvent>
      get copyWith => throw _privateConstructorUsedError;
}

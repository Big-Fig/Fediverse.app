// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_notification_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiNotification _$UnifediApiNotificationFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiNotification.fromJson(json);
}

/// @nodoc
class _$UnifediApiNotificationTearOff {
  const _$UnifediApiNotificationTearOff();

  _UnifediApiNotification call(
      {@HiveField(0)
          required UnifediApiAccount? account,
      @HiveField(1)
          required UnifediApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(3)
          required String id,
      @HiveField(4)
          required String type,
      @HiveField(5)
          required UnifediApiStatus? status,
      @HiveField(6)
          required String? emoji,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          required UnifediApiChatMessage? chatMessage,
      @HiveField(9)
          required UnifediApiAccountReport? report,
      @HiveField(10 + 0)
      @JsonKey(name: 'is_seen')
          required bool? isSeen,
      @HiveField(11 + 1)
      @JsonKey(name: 'is_muted')
          required bool? isMuted}) {
    return _UnifediApiNotification(
      account: account,
      target: target,
      createdAt: createdAt,
      id: id,
      type: type,
      status: status,
      emoji: emoji,
      chatMessage: chatMessage,
      report: report,
      isSeen: isSeen,
      isMuted: isMuted,
    );
  }

  UnifediApiNotification fromJson(Map<String, Object> json) {
    return UnifediApiNotification.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiNotification = _$UnifediApiNotificationTearOff();

/// @nodoc
mixin _$UnifediApiNotification {
  @HiveField(0)
  UnifediApiAccount? get account => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiAccount? get target => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  String get id => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;
  @HiveField(5)
  UnifediApiStatus? get status => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get emoji => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  UnifediApiChatMessage? get chatMessage => throw _privateConstructorUsedError;
  @HiveField(9)
  UnifediApiAccountReport? get report => throw _privateConstructorUsedError;
  @HiveField(10 + 0)
  @JsonKey(name: 'is_seen')
  bool? get isSeen => throw _privateConstructorUsedError;
  @HiveField(11 + 1)
  @JsonKey(name: 'is_muted')
  bool? get isMuted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiNotificationCopyWith<UnifediApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiNotificationCopyWith<$Res> {
  factory $UnifediApiNotificationCopyWith(UnifediApiNotification value,
          $Res Function(UnifediApiNotification) then) =
      _$UnifediApiNotificationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          UnifediApiAccount? account,
      @HiveField(1)
          UnifediApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(3)
          String id,
      @HiveField(4)
          String type,
      @HiveField(5)
          UnifediApiStatus? status,
      @HiveField(6)
          String? emoji,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          UnifediApiChatMessage? chatMessage,
      @HiveField(9)
          UnifediApiAccountReport? report,
      @HiveField(10 + 0)
      @JsonKey(name: 'is_seen')
          bool? isSeen,
      @HiveField(11 + 1)
      @JsonKey(name: 'is_muted')
          bool? isMuted});

  $UnifediApiAccountCopyWith<$Res>? get account;
  $UnifediApiAccountCopyWith<$Res>? get target;
  $UnifediApiStatusCopyWith<$Res>? get status;
  $UnifediApiChatMessageCopyWith<$Res>? get chatMessage;
  $UnifediApiAccountReportCopyWith<$Res>? get report;
}

/// @nodoc
class _$UnifediApiNotificationCopyWithImpl<$Res>
    implements $UnifediApiNotificationCopyWith<$Res> {
  _$UnifediApiNotificationCopyWithImpl(this._value, this._then);

  final UnifediApiNotification _value;
  // ignore: unused_field
  final $Res Function(UnifediApiNotification) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? target = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? emoji = freezed,
    Object? chatMessage = freezed,
    Object? report = freezed,
    Object? isSeen = freezed,
    Object? isMuted = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as UnifediApiChatMessage?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountReport?,
      isSeen: isSeen == freezed
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMuted: isMuted == freezed
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UnifediApiAccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $UnifediApiAccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $UnifediApiAccountCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $UnifediApiAccountCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value));
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
  $UnifediApiChatMessageCopyWith<$Res>? get chatMessage {
    if (_value.chatMessage == null) {
      return null;
    }

    return $UnifediApiChatMessageCopyWith<$Res>(_value.chatMessage!, (value) {
      return _then(_value.copyWith(chatMessage: value));
    });
  }

  @override
  $UnifediApiAccountReportCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $UnifediApiAccountReportCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiNotificationCopyWith<$Res>
    implements $UnifediApiNotificationCopyWith<$Res> {
  factory _$UnifediApiNotificationCopyWith(_UnifediApiNotification value,
          $Res Function(_UnifediApiNotification) then) =
      __$UnifediApiNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          UnifediApiAccount? account,
      @HiveField(1)
          UnifediApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(3)
          String id,
      @HiveField(4)
          String type,
      @HiveField(5)
          UnifediApiStatus? status,
      @HiveField(6)
          String? emoji,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          UnifediApiChatMessage? chatMessage,
      @HiveField(9)
          UnifediApiAccountReport? report,
      @HiveField(10 + 0)
      @JsonKey(name: 'is_seen')
          bool? isSeen,
      @HiveField(11 + 1)
      @JsonKey(name: 'is_muted')
          bool? isMuted});

  @override
  $UnifediApiAccountCopyWith<$Res>? get account;
  @override
  $UnifediApiAccountCopyWith<$Res>? get target;
  @override
  $UnifediApiStatusCopyWith<$Res>? get status;
  @override
  $UnifediApiChatMessageCopyWith<$Res>? get chatMessage;
  @override
  $UnifediApiAccountReportCopyWith<$Res>? get report;
}

/// @nodoc
class __$UnifediApiNotificationCopyWithImpl<$Res>
    extends _$UnifediApiNotificationCopyWithImpl<$Res>
    implements _$UnifediApiNotificationCopyWith<$Res> {
  __$UnifediApiNotificationCopyWithImpl(_UnifediApiNotification _value,
      $Res Function(_UnifediApiNotification) _then)
      : super(_value, (v) => _then(v as _UnifediApiNotification));

  @override
  _UnifediApiNotification get _value => super._value as _UnifediApiNotification;

  @override
  $Res call({
    Object? account = freezed,
    Object? target = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? emoji = freezed,
    Object? chatMessage = freezed,
    Object? report = freezed,
    Object? isSeen = freezed,
    Object? isMuted = freezed,
  }) {
    return _then(_UnifediApiNotification(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as UnifediApiChatMessage?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountReport?,
      isSeen: isSeen == freezed
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMuted: isMuted == freezed
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiNotification implements _UnifediApiNotification {
  const _$_UnifediApiNotification(
      {@HiveField(0) required this.account,
      @HiveField(1) required this.target,
      @HiveField(2) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(3) required this.id,
      @HiveField(4) required this.type,
      @HiveField(5) required this.status,
      @HiveField(6) required this.emoji,
      @HiveField(8) @JsonKey(name: 'chat_message') required this.chatMessage,
      @HiveField(9) required this.report,
      @HiveField(10 + 0) @JsonKey(name: 'is_seen') required this.isSeen,
      @HiveField(11 + 1) @JsonKey(name: 'is_muted') required this.isMuted});

  factory _$_UnifediApiNotification.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiNotificationFromJson(json);

  @override
  @HiveField(0)
  final UnifediApiAccount? account;
  @override
  @HiveField(1)
  final UnifediApiAccount? target;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(3)
  final String id;
  @override
  @HiveField(4)
  final String type;
  @override
  @HiveField(5)
  final UnifediApiStatus? status;
  @override
  @HiveField(6)
  final String? emoji;
  @override
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  final UnifediApiChatMessage? chatMessage;
  @override
  @HiveField(9)
  final UnifediApiAccountReport? report;
  @override
  @HiveField(10 + 0)
  @JsonKey(name: 'is_seen')
  final bool? isSeen;
  @override
  @HiveField(11 + 1)
  @JsonKey(name: 'is_muted')
  final bool? isMuted;

  @override
  String toString() {
    return 'UnifediApiNotification(account: $account, target: $target, createdAt: $createdAt, id: $id, type: $type, status: $status, emoji: $emoji, chatMessage: $chatMessage, report: $report, isSeen: $isSeen, isMuted: $isMuted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiNotification &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.target, target) ||
                const DeepCollectionEquality().equals(other.target, target)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.emoji, emoji) ||
                const DeepCollectionEquality().equals(other.emoji, emoji)) &&
            (identical(other.chatMessage, chatMessage) ||
                const DeepCollectionEquality()
                    .equals(other.chatMessage, chatMessage)) &&
            (identical(other.report, report) ||
                const DeepCollectionEquality().equals(other.report, report)) &&
            (identical(other.isSeen, isSeen) ||
                const DeepCollectionEquality().equals(other.isSeen, isSeen)) &&
            (identical(other.isMuted, isMuted) ||
                const DeepCollectionEquality().equals(other.isMuted, isMuted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(target) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(emoji) ^
      const DeepCollectionEquality().hash(chatMessage) ^
      const DeepCollectionEquality().hash(report) ^
      const DeepCollectionEquality().hash(isSeen) ^
      const DeepCollectionEquality().hash(isMuted);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiNotificationCopyWith<_UnifediApiNotification> get copyWith =>
      __$UnifediApiNotificationCopyWithImpl<_UnifediApiNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiNotificationToJson(this);
  }
}

abstract class _UnifediApiNotification implements UnifediApiNotification {
  const factory _UnifediApiNotification(
      {@HiveField(0)
          required UnifediApiAccount? account,
      @HiveField(1)
          required UnifediApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(3)
          required String id,
      @HiveField(4)
          required String type,
      @HiveField(5)
          required UnifediApiStatus? status,
      @HiveField(6)
          required String? emoji,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          required UnifediApiChatMessage? chatMessage,
      @HiveField(9)
          required UnifediApiAccountReport? report,
      @HiveField(10 + 0)
      @JsonKey(name: 'is_seen')
          required bool? isSeen,
      @HiveField(11 + 1)
      @JsonKey(name: 'is_muted')
          required bool? isMuted}) = _$_UnifediApiNotification;

  factory _UnifediApiNotification.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiNotification.fromJson;

  @override
  @HiveField(0)
  UnifediApiAccount? get account => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  UnifediApiAccount? get target => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  UnifediApiStatus? get status => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get emoji => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  UnifediApiChatMessage? get chatMessage => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  UnifediApiAccountReport? get report => throw _privateConstructorUsedError;
  @override
  @HiveField(10 + 0)
  @JsonKey(name: 'is_seen')
  bool? get isSeen => throw _privateConstructorUsedError;
  @override
  @HiveField(11 + 1)
  @JsonKey(name: 'is_muted')
  bool? get isMuted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiNotificationCopyWith<_UnifediApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

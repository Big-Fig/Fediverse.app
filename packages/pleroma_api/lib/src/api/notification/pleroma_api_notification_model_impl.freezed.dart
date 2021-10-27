// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_notification_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiNotificationPleromaPart _$PleromaApiNotificationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiNotificationPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiNotificationPleromaPartTearOff {
  const _$PleromaApiNotificationPleromaPartTearOff();

  _PleromaApiNotificationPleromaPart call(
      {@HiveField(0) @JsonKey(name: 'is_seen') required bool? isSeen,
      @HiveField(1) @JsonKey(name: 'is_muted') required bool? isMuted}) {
    return _PleromaApiNotificationPleromaPart(
      isSeen: isSeen,
      isMuted: isMuted,
    );
  }

  PleromaApiNotificationPleromaPart fromJson(Map<String, Object?> json) {
    return PleromaApiNotificationPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiNotificationPleromaPart =
    _$PleromaApiNotificationPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiNotificationPleromaPart {
  @HiveField(0)
  @JsonKey(name: 'is_seen')
  bool? get isSeen => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'is_muted')
  bool? get isMuted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiNotificationPleromaPartCopyWith<PleromaApiNotificationPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiNotificationPleromaPartCopyWith<$Res> {
  factory $PleromaApiNotificationPleromaPartCopyWith(
          PleromaApiNotificationPleromaPart value,
          $Res Function(PleromaApiNotificationPleromaPart) then) =
      _$PleromaApiNotificationPleromaPartCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'is_seen') bool? isSeen,
      @HiveField(1) @JsonKey(name: 'is_muted') bool? isMuted});
}

/// @nodoc
class _$PleromaApiNotificationPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiNotificationPleromaPartCopyWith<$Res> {
  _$PleromaApiNotificationPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiNotificationPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiNotificationPleromaPart) _then;

  @override
  $Res call({
    Object? isSeen = freezed,
    Object? isMuted = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$PleromaApiNotificationPleromaPartCopyWith<$Res>
    implements $PleromaApiNotificationPleromaPartCopyWith<$Res> {
  factory _$PleromaApiNotificationPleromaPartCopyWith(
          _PleromaApiNotificationPleromaPart value,
          $Res Function(_PleromaApiNotificationPleromaPart) then) =
      __$PleromaApiNotificationPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'is_seen') bool? isSeen,
      @HiveField(1) @JsonKey(name: 'is_muted') bool? isMuted});
}

/// @nodoc
class __$PleromaApiNotificationPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiNotificationPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiNotificationPleromaPartCopyWith<$Res> {
  __$PleromaApiNotificationPleromaPartCopyWithImpl(
      _PleromaApiNotificationPleromaPart _value,
      $Res Function(_PleromaApiNotificationPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiNotificationPleromaPart));

  @override
  _PleromaApiNotificationPleromaPart get _value =>
      super._value as _PleromaApiNotificationPleromaPart;

  @override
  $Res call({
    Object? isSeen = freezed,
    Object? isMuted = freezed,
  }) {
    return _then(_PleromaApiNotificationPleromaPart(
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
class _$_PleromaApiNotificationPleromaPart
    implements _PleromaApiNotificationPleromaPart {
  const _$_PleromaApiNotificationPleromaPart(
      {@HiveField(0) @JsonKey(name: 'is_seen') required this.isSeen,
      @HiveField(1) @JsonKey(name: 'is_muted') required this.isMuted});

  factory _$_PleromaApiNotificationPleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiNotificationPleromaPartFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'is_seen')
  final bool? isSeen;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_muted')
  final bool? isMuted;

  @override
  String toString() {
    return 'PleromaApiNotificationPleromaPart(isSeen: $isSeen, isMuted: $isMuted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiNotificationPleromaPart &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSeen, isMuted);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiNotificationPleromaPartCopyWith<
          _PleromaApiNotificationPleromaPart>
      get copyWith => __$PleromaApiNotificationPleromaPartCopyWithImpl<
          _PleromaApiNotificationPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiNotificationPleromaPartToJson(this);
  }
}

abstract class _PleromaApiNotificationPleromaPart
    implements PleromaApiNotificationPleromaPart {
  const factory _PleromaApiNotificationPleromaPart(
          {@HiveField(0) @JsonKey(name: 'is_seen') required bool? isSeen,
          @HiveField(1) @JsonKey(name: 'is_muted') required bool? isMuted}) =
      _$_PleromaApiNotificationPleromaPart;

  factory _PleromaApiNotificationPleromaPart.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiNotificationPleromaPart.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'is_seen')
  bool? get isSeen;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_muted')
  bool? get isMuted;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiNotificationPleromaPartCopyWith<
          _PleromaApiNotificationPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiNotification _$PleromaApiNotificationFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiNotification.fromJson(json);
}

/// @nodoc
class _$PleromaApiNotificationTearOff {
  const _$PleromaApiNotificationTearOff();

  _PleromaApiNotification call(
      {@HiveField(0)
          required PleromaApiAccount? account,
      @HiveField(1)
          required PleromaApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(3)
          required String id,
      @HiveField(4)
          required String type,
      @HiveField(5)
          required PleromaApiStatus? status,
      @HiveField(6)
          required String? emoji,
      @HiveField(7)
          required PleromaApiNotificationPleromaPart? pleroma,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          required PleromaApiChatMessage? chatMessage,
      @HiveField(9)
          required PleromaApiAccountReport? report}) {
    return _PleromaApiNotification(
      account: account,
      target: target,
      createdAt: createdAt,
      id: id,
      type: type,
      status: status,
      emoji: emoji,
      pleroma: pleroma,
      chatMessage: chatMessage,
      report: report,
    );
  }

  PleromaApiNotification fromJson(Map<String, Object?> json) {
    return PleromaApiNotification.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiNotification = _$PleromaApiNotificationTearOff();

/// @nodoc
mixin _$PleromaApiNotification {
  @HiveField(0)
  PleromaApiAccount? get account => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiAccount? get target => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  String get id => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;
  @HiveField(5)
  PleromaApiStatus? get status => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get emoji => throw _privateConstructorUsedError;
  @HiveField(7)
  PleromaApiNotificationPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  PleromaApiChatMessage? get chatMessage => throw _privateConstructorUsedError;
  @HiveField(9)
  PleromaApiAccountReport? get report => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiNotificationCopyWith<PleromaApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiNotificationCopyWith<$Res> {
  factory $PleromaApiNotificationCopyWith(PleromaApiNotification value,
          $Res Function(PleromaApiNotification) then) =
      _$PleromaApiNotificationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          PleromaApiAccount? account,
      @HiveField(1)
          PleromaApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(3)
          String id,
      @HiveField(4)
          String type,
      @HiveField(5)
          PleromaApiStatus? status,
      @HiveField(6)
          String? emoji,
      @HiveField(7)
          PleromaApiNotificationPleromaPart? pleroma,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          PleromaApiChatMessage? chatMessage,
      @HiveField(9)
          PleromaApiAccountReport? report});

  $PleromaApiAccountCopyWith<$Res>? get account;
  $PleromaApiAccountCopyWith<$Res>? get target;
  $PleromaApiStatusCopyWith<$Res>? get status;
  $PleromaApiNotificationPleromaPartCopyWith<$Res>? get pleroma;
  $PleromaApiChatMessageCopyWith<$Res>? get chatMessage;
  $PleromaApiAccountReportCopyWith<$Res>? get report;
}

/// @nodoc
class _$PleromaApiNotificationCopyWithImpl<$Res>
    implements $PleromaApiNotificationCopyWith<$Res> {
  _$PleromaApiNotificationCopyWithImpl(this._value, this._then);

  final PleromaApiNotification _value;
  // ignore: unused_field
  final $Res Function(PleromaApiNotification) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? target = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? emoji = freezed,
    Object? pleroma = freezed,
    Object? chatMessage = freezed,
    Object? report = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
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
              as PleromaApiStatus?,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotificationPleromaPart?,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountReport?,
    ));
  }

  @override
  $PleromaApiAccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $PleromaApiAccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $PleromaApiAccountCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $PleromaApiAccountCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value));
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
  $PleromaApiNotificationPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiNotificationPleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }

  @override
  $PleromaApiChatMessageCopyWith<$Res>? get chatMessage {
    if (_value.chatMessage == null) {
      return null;
    }

    return $PleromaApiChatMessageCopyWith<$Res>(_value.chatMessage!, (value) {
      return _then(_value.copyWith(chatMessage: value));
    });
  }

  @override
  $PleromaApiAccountReportCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $PleromaApiAccountReportCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiNotificationCopyWith<$Res>
    implements $PleromaApiNotificationCopyWith<$Res> {
  factory _$PleromaApiNotificationCopyWith(_PleromaApiNotification value,
          $Res Function(_PleromaApiNotification) then) =
      __$PleromaApiNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          PleromaApiAccount? account,
      @HiveField(1)
          PleromaApiAccount? target,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(3)
          String id,
      @HiveField(4)
          String type,
      @HiveField(5)
          PleromaApiStatus? status,
      @HiveField(6)
          String? emoji,
      @HiveField(7)
          PleromaApiNotificationPleromaPart? pleroma,
      @HiveField(8)
      @JsonKey(name: 'chat_message')
          PleromaApiChatMessage? chatMessage,
      @HiveField(9)
          PleromaApiAccountReport? report});

  @override
  $PleromaApiAccountCopyWith<$Res>? get account;
  @override
  $PleromaApiAccountCopyWith<$Res>? get target;
  @override
  $PleromaApiStatusCopyWith<$Res>? get status;
  @override
  $PleromaApiNotificationPleromaPartCopyWith<$Res>? get pleroma;
  @override
  $PleromaApiChatMessageCopyWith<$Res>? get chatMessage;
  @override
  $PleromaApiAccountReportCopyWith<$Res>? get report;
}

/// @nodoc
class __$PleromaApiNotificationCopyWithImpl<$Res>
    extends _$PleromaApiNotificationCopyWithImpl<$Res>
    implements _$PleromaApiNotificationCopyWith<$Res> {
  __$PleromaApiNotificationCopyWithImpl(_PleromaApiNotification _value,
      $Res Function(_PleromaApiNotification) _then)
      : super(_value, (v) => _then(v as _PleromaApiNotification));

  @override
  _PleromaApiNotification get _value => super._value as _PleromaApiNotification;

  @override
  $Res call({
    Object? account = freezed,
    Object? target = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? emoji = freezed,
    Object? pleroma = freezed,
    Object? chatMessage = freezed,
    Object? report = freezed,
  }) {
    return _then(_PleromaApiNotification(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
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
              as PleromaApiStatus?,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotificationPleromaPart?,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountReport?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiNotification implements _PleromaApiNotification {
  const _$_PleromaApiNotification(
      {@HiveField(0) required this.account,
      @HiveField(1) required this.target,
      @HiveField(2) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(3) required this.id,
      @HiveField(4) required this.type,
      @HiveField(5) required this.status,
      @HiveField(6) required this.emoji,
      @HiveField(7) required this.pleroma,
      @HiveField(8) @JsonKey(name: 'chat_message') required this.chatMessage,
      @HiveField(9) required this.report});

  factory _$_PleromaApiNotification.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiNotificationFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccount? account;
  @override
  @HiveField(1)
  final PleromaApiAccount? target;
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
  final PleromaApiStatus? status;
  @override
  @HiveField(6)
  final String? emoji;
  @override
  @HiveField(7)
  final PleromaApiNotificationPleromaPart? pleroma;
  @override
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  final PleromaApiChatMessage? chatMessage;
  @override
  @HiveField(9)
  final PleromaApiAccountReport? report;

  @override
  String toString() {
    return 'PleromaApiNotification(account: $account, target: $target, createdAt: $createdAt, id: $id, type: $type, status: $status, emoji: $emoji, pleroma: $pleroma, chatMessage: $chatMessage, report: $report)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiNotification &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.pleroma, pleroma) || other.pleroma == pleroma) &&
            (identical(other.chatMessage, chatMessage) ||
                other.chatMessage == chatMessage) &&
            (identical(other.report, report) || other.report == report));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, target, createdAt, id,
      type, status, emoji, pleroma, chatMessage, report);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiNotificationCopyWith<_PleromaApiNotification> get copyWith =>
      __$PleromaApiNotificationCopyWithImpl<_PleromaApiNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiNotificationToJson(this);
  }
}

abstract class _PleromaApiNotification implements PleromaApiNotification {
  const factory _PleromaApiNotification(
          {@HiveField(0)
              required PleromaApiAccount? account,
          @HiveField(1)
              required PleromaApiAccount? target,
          @HiveField(2)
          @JsonKey(name: 'created_at')
              required DateTime createdAt,
          @HiveField(3)
              required String id,
          @HiveField(4)
              required String type,
          @HiveField(5)
              required PleromaApiStatus? status,
          @HiveField(6)
              required String? emoji,
          @HiveField(7)
              required PleromaApiNotificationPleromaPart? pleroma,
          @HiveField(8)
          @JsonKey(name: 'chat_message')
              required PleromaApiChatMessage? chatMessage,
          @HiveField(9)
              required PleromaApiAccountReport? report}) =
      _$_PleromaApiNotification;

  factory _PleromaApiNotification.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiNotification.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccount? get account;
  @override
  @HiveField(1)
  PleromaApiAccount? get target;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @HiveField(3)
  String get id;
  @override
  @HiveField(4)
  String get type;
  @override
  @HiveField(5)
  PleromaApiStatus? get status;
  @override
  @HiveField(6)
  String? get emoji;
  @override
  @HiveField(7)
  PleromaApiNotificationPleromaPart? get pleroma;
  @override
  @HiveField(8)
  @JsonKey(name: 'chat_message')
  PleromaApiChatMessage? get chatMessage;
  @override
  @HiveField(9)
  PleromaApiAccountReport? get report;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiNotificationCopyWith<_PleromaApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

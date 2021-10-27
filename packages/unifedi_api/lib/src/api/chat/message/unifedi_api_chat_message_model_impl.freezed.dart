// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_chat_message_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiChatMessage _$UnifediApiChatMessageFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiChatMessage.fromJson(json);
}

/// @nodoc
class _$UnifediApiChatMessageTearOff {
  const _$UnifediApiChatMessageTearOff();

  _UnifediApiChatMessage call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'chat_id')
          required String chatId,
      @HiveField(2)
      @JsonKey(name: 'account_id')
          required String accountId,
      @HiveField(3)
          required String? content,
      @HiveField(4)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(5)
          required List<UnifediApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          required UnifediApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          required UnifediApiCard? card}) {
    return _UnifediApiChatMessage(
      id: id,
      chatId: chatId,
      accountId: accountId,
      content: content,
      createdAt: createdAt,
      emojis: emojis,
      mediaAttachment: mediaAttachment,
      card: card,
    );
  }

  UnifediApiChatMessage fromJson(Map<String, Object?> json) {
    return UnifediApiChatMessage.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiChatMessage = _$UnifediApiChatMessageTearOff();

/// @nodoc
mixin _$UnifediApiChatMessage {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'chat_id')
  String get chatId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get content => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  List<UnifediApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'attachment')
  UnifediApiMediaAttachment? get mediaAttachment =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  UnifediApiCard? get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiChatMessageCopyWith<UnifediApiChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiChatMessageCopyWith<$Res> {
  factory $UnifediApiChatMessageCopyWith(UnifediApiChatMessage value,
          $Res Function(UnifediApiChatMessage) then) =
      _$UnifediApiChatMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
      @JsonKey(name: 'chat_id')
          String chatId,
      @HiveField(2)
      @JsonKey(name: 'account_id')
          String accountId,
      @HiveField(3)
          String? content,
      @HiveField(4)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(5)
          List<UnifediApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          UnifediApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          UnifediApiCard? card});

  $UnifediApiMediaAttachmentCopyWith<$Res>? get mediaAttachment;
  $UnifediApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class _$UnifediApiChatMessageCopyWithImpl<$Res>
    implements $UnifediApiChatMessageCopyWith<$Res> {
  _$UnifediApiChatMessageCopyWithImpl(this._value, this._then);

  final UnifediApiChatMessage _value;
  // ignore: unused_field
  final $Res Function(UnifediApiChatMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? accountId = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? emojis = freezed,
    Object? mediaAttachment = freezed,
    Object? card = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiEmoji>?,
      mediaAttachment: mediaAttachment == freezed
          ? _value.mediaAttachment
          : mediaAttachment // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachment?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as UnifediApiCard?,
    ));
  }

  @override
  $UnifediApiMediaAttachmentCopyWith<$Res>? get mediaAttachment {
    if (_value.mediaAttachment == null) {
      return null;
    }

    return $UnifediApiMediaAttachmentCopyWith<$Res>(_value.mediaAttachment!,
        (value) {
      return _then(_value.copyWith(mediaAttachment: value));
    });
  }

  @override
  $UnifediApiCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $UnifediApiCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiChatMessageCopyWith<$Res>
    implements $UnifediApiChatMessageCopyWith<$Res> {
  factory _$UnifediApiChatMessageCopyWith(_UnifediApiChatMessage value,
          $Res Function(_UnifediApiChatMessage) then) =
      __$UnifediApiChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
      @JsonKey(name: 'chat_id')
          String chatId,
      @HiveField(2)
      @JsonKey(name: 'account_id')
          String accountId,
      @HiveField(3)
          String? content,
      @HiveField(4)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(5)
          List<UnifediApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          UnifediApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          UnifediApiCard? card});

  @override
  $UnifediApiMediaAttachmentCopyWith<$Res>? get mediaAttachment;
  @override
  $UnifediApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$UnifediApiChatMessageCopyWithImpl<$Res>
    extends _$UnifediApiChatMessageCopyWithImpl<$Res>
    implements _$UnifediApiChatMessageCopyWith<$Res> {
  __$UnifediApiChatMessageCopyWithImpl(_UnifediApiChatMessage _value,
      $Res Function(_UnifediApiChatMessage) _then)
      : super(_value, (v) => _then(v as _UnifediApiChatMessage));

  @override
  _UnifediApiChatMessage get _value => super._value as _UnifediApiChatMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? accountId = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? emojis = freezed,
    Object? mediaAttachment = freezed,
    Object? card = freezed,
  }) {
    return _then(_UnifediApiChatMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiEmoji>?,
      mediaAttachment: mediaAttachment == freezed
          ? _value.mediaAttachment
          : mediaAttachment // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachment?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as UnifediApiCard?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiChatMessage implements _UnifediApiChatMessage {
  const _$_UnifediApiChatMessage(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'chat_id') required this.chatId,
      @HiveField(2) @JsonKey(name: 'account_id') required this.accountId,
      @HiveField(3) required this.content,
      @HiveField(4) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(5) required this.emojis,
      @HiveField(6) @JsonKey(name: 'attachment') required this.mediaAttachment,
      @HiveField(7) required this.card});

  factory _$_UnifediApiChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiChatMessageFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'chat_id')
  final String chatId;
  @override
  @HiveField(2)
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @HiveField(3)
  final String? content;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(5)
  final List<UnifediApiEmoji>? emojis;
  @override
  @HiveField(6)
  @JsonKey(name: 'attachment')
  final UnifediApiMediaAttachment? mediaAttachment;
  @override
  @HiveField(7)
  final UnifediApiCard? card;

  @override
  String toString() {
    return 'UnifediApiChatMessage(id: $id, chatId: $chatId, accountId: $accountId, content: $content, createdAt: $createdAt, emojis: $emojis, mediaAttachment: $mediaAttachment, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiChatMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.emojis, emojis) &&
            (identical(other.mediaAttachment, mediaAttachment) ||
                other.mediaAttachment == mediaAttachment) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chatId,
      accountId,
      content,
      createdAt,
      const DeepCollectionEquality().hash(emojis),
      mediaAttachment,
      card);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiChatMessageCopyWith<_UnifediApiChatMessage> get copyWith =>
      __$UnifediApiChatMessageCopyWithImpl<_UnifediApiChatMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiChatMessageToJson(this);
  }
}

abstract class _UnifediApiChatMessage implements UnifediApiChatMessage {
  const factory _UnifediApiChatMessage(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'chat_id')
          required String chatId,
      @HiveField(2)
      @JsonKey(name: 'account_id')
          required String accountId,
      @HiveField(3)
          required String? content,
      @HiveField(4)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(5)
          required List<UnifediApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          required UnifediApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          required UnifediApiCard? card}) = _$_UnifediApiChatMessage;

  factory _UnifediApiChatMessage.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiChatMessage.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'chat_id')
  String get chatId;
  @override
  @HiveField(2)
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  @HiveField(3)
  String? get content;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @HiveField(5)
  List<UnifediApiEmoji>? get emojis;
  @override
  @HiveField(6)
  @JsonKey(name: 'attachment')
  UnifediApiMediaAttachment? get mediaAttachment;
  @override
  @HiveField(7)
  UnifediApiCard? get card;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiChatMessageCopyWith<_UnifediApiChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

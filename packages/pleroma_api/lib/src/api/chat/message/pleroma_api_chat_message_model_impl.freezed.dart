// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_chat_message_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiChatMessage _$PleromaApiChatMessageFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiChatMessage.fromJson(json);
}

/// @nodoc
class _$PleromaApiChatMessageTearOff {
  const _$PleromaApiChatMessageTearOff();

  _PleromaApiChatMessage call(
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
          required List<PleromaApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          required PleromaApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          required PleromaApiCard? card}) {
    return _PleromaApiChatMessage(
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

  PleromaApiChatMessage fromJson(Map<String, Object> json) {
    return PleromaApiChatMessage.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiChatMessage = _$PleromaApiChatMessageTearOff();

/// @nodoc
mixin _$PleromaApiChatMessage {
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
  List<PleromaApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'attachment')
  PleromaApiMediaAttachment? get mediaAttachment =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  PleromaApiCard? get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiChatMessageCopyWith<PleromaApiChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiChatMessageCopyWith<$Res> {
  factory $PleromaApiChatMessageCopyWith(PleromaApiChatMessage value,
          $Res Function(PleromaApiChatMessage) then) =
      _$PleromaApiChatMessageCopyWithImpl<$Res>;
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
          List<PleromaApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          PleromaApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          PleromaApiCard? card});

  $PleromaApiMediaAttachmentCopyWith<$Res>? get mediaAttachment;
  $PleromaApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class _$PleromaApiChatMessageCopyWithImpl<$Res>
    implements $PleromaApiChatMessageCopyWith<$Res> {
  _$PleromaApiChatMessageCopyWithImpl(this._value, this._then);

  final PleromaApiChatMessage _value;
  // ignore: unused_field
  final $Res Function(PleromaApiChatMessage) _then;

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
              as List<PleromaApiEmoji>?,
      mediaAttachment: mediaAttachment == freezed
          ? _value.mediaAttachment
          : mediaAttachment // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachment?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard?,
    ));
  }

  @override
  $PleromaApiMediaAttachmentCopyWith<$Res>? get mediaAttachment {
    if (_value.mediaAttachment == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentCopyWith<$Res>(_value.mediaAttachment!,
        (value) {
      return _then(_value.copyWith(mediaAttachment: value));
    });
  }

  @override
  $PleromaApiCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $PleromaApiCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiChatMessageCopyWith<$Res>
    implements $PleromaApiChatMessageCopyWith<$Res> {
  factory _$PleromaApiChatMessageCopyWith(_PleromaApiChatMessage value,
          $Res Function(_PleromaApiChatMessage) then) =
      __$PleromaApiChatMessageCopyWithImpl<$Res>;
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
          List<PleromaApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          PleromaApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          PleromaApiCard? card});

  @override
  $PleromaApiMediaAttachmentCopyWith<$Res>? get mediaAttachment;
  @override
  $PleromaApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$PleromaApiChatMessageCopyWithImpl<$Res>
    extends _$PleromaApiChatMessageCopyWithImpl<$Res>
    implements _$PleromaApiChatMessageCopyWith<$Res> {
  __$PleromaApiChatMessageCopyWithImpl(_PleromaApiChatMessage _value,
      $Res Function(_PleromaApiChatMessage) _then)
      : super(_value, (v) => _then(v as _PleromaApiChatMessage));

  @override
  _PleromaApiChatMessage get _value => super._value as _PleromaApiChatMessage;

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
    return _then(_PleromaApiChatMessage(
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
              as List<PleromaApiEmoji>?,
      mediaAttachment: mediaAttachment == freezed
          ? _value.mediaAttachment
          : mediaAttachment // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachment?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiChatMessage implements _PleromaApiChatMessage {
  const _$_PleromaApiChatMessage(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'chat_id') required this.chatId,
      @HiveField(2) @JsonKey(name: 'account_id') required this.accountId,
      @HiveField(3) required this.content,
      @HiveField(4) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(5) required this.emojis,
      @HiveField(6) @JsonKey(name: 'attachment') required this.mediaAttachment,
      @HiveField(7) required this.card});

  factory _$_PleromaApiChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiChatMessageFromJson(json);

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
  final List<PleromaApiEmoji>? emojis;
  @override
  @HiveField(6)
  @JsonKey(name: 'attachment')
  final PleromaApiMediaAttachment? mediaAttachment;
  @override
  @HiveField(7)
  final PleromaApiCard? card;

  @override
  String toString() {
    return 'PleromaApiChatMessage(id: $id, chatId: $chatId, accountId: $accountId, content: $content, createdAt: $createdAt, emojis: $emojis, mediaAttachment: $mediaAttachment, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiChatMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.chatId, chatId) ||
                const DeepCollectionEquality().equals(other.chatId, chatId)) &&
            (identical(other.accountId, accountId) ||
                const DeepCollectionEquality()
                    .equals(other.accountId, accountId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.emojis, emojis) ||
                const DeepCollectionEquality().equals(other.emojis, emojis)) &&
            (identical(other.mediaAttachment, mediaAttachment) ||
                const DeepCollectionEquality()
                    .equals(other.mediaAttachment, mediaAttachment)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(chatId) ^
      const DeepCollectionEquality().hash(accountId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(emojis) ^
      const DeepCollectionEquality().hash(mediaAttachment) ^
      const DeepCollectionEquality().hash(card);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiChatMessageCopyWith<_PleromaApiChatMessage> get copyWith =>
      __$PleromaApiChatMessageCopyWithImpl<_PleromaApiChatMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiChatMessageToJson(this);
  }
}

abstract class _PleromaApiChatMessage implements PleromaApiChatMessage {
  const factory _PleromaApiChatMessage(
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
          required List<PleromaApiEmoji>? emojis,
      @HiveField(6)
      @JsonKey(name: 'attachment')
          required PleromaApiMediaAttachment? mediaAttachment,
      @HiveField(7)
          required PleromaApiCard? card}) = _$_PleromaApiChatMessage;

  factory _PleromaApiChatMessage.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiChatMessage.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'chat_id')
  String get chatId => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get content => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  List<PleromaApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  @JsonKey(name: 'attachment')
  PleromaApiMediaAttachment? get mediaAttachment =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  PleromaApiCard? get card => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiChatMessageCopyWith<_PleromaApiChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

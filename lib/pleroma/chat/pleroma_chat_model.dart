import 'dart:convert';

import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_chat_model.g.dart';

abstract class IPleromaChat {
  String get id;

  int get unread;

  DateTime? get updatedAt;

  IPleromaAccount get account;

  IPleromaChatMessage? get lastMessage;
}

@JsonSerializable(explicitToJson: true)
class PleromaChat implements IPleromaChat {
  @override
  final String id;
  @override
  final int unread;

  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  final PleromaAccount account;

  @override
  @JsonKey(name: "last_message")
  final PleromaChatMessage? lastMessage;

  PleromaChat({
    required this.id,
    required this.unread,
    required this.account,
    required this.updatedAt,
    required this.lastMessage,
  });

  PleromaChat copyWith({
    String? id,
    bool? unread,
    PleromaAccount? account,
    DateTime? updatedAt,
    PleromaChatMessage? lastMessage,
  }) =>
      PleromaChat(
        id: id ?? this.id,
        unread: unread as int? ?? this.unread,
        account: account ?? this.account,
        updatedAt: updatedAt ?? this.updatedAt,
        lastMessage: lastMessage ?? this.lastMessage,
      );

  factory PleromaChat.fromJson(Map<String, dynamic> json) =>
      _$PleromaChatFromJson(json);

  factory PleromaChat.fromJsonString(String jsonString) =>
      _$PleromaChatFromJson(jsonDecode(jsonString));

  static List<PleromaChat> listFromJsonString(String str) =>
      List<PleromaChat>.from(
          json.decode(str).map((x) => PleromaChat.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaChatToJson(this);

  String toJsonString() => jsonEncode(_$PleromaChatToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChat &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          unread == other.unread &&
          updatedAt == other.updatedAt &&
          account == other.account &&
          lastMessage == other.lastMessage;

  @override
  int get hashCode =>
      id.hashCode ^
      unread.hashCode ^
      updatedAt.hashCode ^
      account.hashCode ^
      lastMessage.hashCode;

  @override
  String toString() {
    return 'PleromaChat{id: $id, unread: $unread, updatedAt: $updatedAt,'
        ' account: $account, lastMessage: $lastMessage}';
  }
}

abstract class IPleromaChatMessage {
  String get id;

  String get chatId;

  String get accountId;

  String? get content;

  DateTime get createdAt;

  List<IPleromaEmoji>? get emojis;

  IPleromaMediaAttachment? get mediaAttachment;

  IPleromaCard? get card;
}

@JsonSerializable(explicitToJson: true)
class PleromaChatMessage extends IPleromaChatMessage {
  @override
  final String id;
  @override
  @JsonKey(name: "chat_id")
  final String chatId;
  @override
  @JsonKey(name: "account_id")
  final String accountId;
  @override
  final String? content;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final List<PleromaEmoji>? emojis;
  @override
  @JsonKey(name: "attachment")
  final PleromaMediaAttachment? mediaAttachment;

  @override
  final PleromaCard? card;

  PleromaChatMessage({
    required this.id,
    required this.chatId,
    required this.accountId,
    required this.content,
    required this.createdAt,
    required this.emojis,
    required this.mediaAttachment,
    required this.card,
  });

  @override
  String toString() {
    return 'PleromaChatMessage{id: $id, chatId: $chatId, '
        'accountId: $accountId, content: $content,'
        ' createdAt: $createdAt, emojis: $emojis,'
        ' mediaAttachment: $mediaAttachment'
        ' card: $card'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatMessage &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          chatId == other.chatId &&
          accountId == other.accountId &&
          content == other.content &&
          createdAt == other.createdAt &&
          emojis == other.emojis &&
          mediaAttachment == other.mediaAttachment &&
          card == other.card;

  @override
  int get hashCode =>
      id.hashCode ^
      chatId.hashCode ^
      accountId.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      emojis.hashCode ^
      mediaAttachment.hashCode ^
      card.hashCode;

  factory PleromaChatMessage.fromJson(Map<String, dynamic> json) =>
      _$PleromaChatMessageFromJson(json);

  factory PleromaChatMessage.fromJsonString(String jsonString) =>
      _$PleromaChatMessageFromJson(jsonDecode(jsonString));

  static List<PleromaChatMessage> listFromJsonString(String str) =>
      List<PleromaChatMessage>.from(
          json.decode(str).map((x) => PleromaChatMessage.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaChatMessageToJson(this);

  String toJsonString() => jsonEncode(_$PleromaChatMessageToJson(this));
}

abstract class IPleromaChatMessageSendData {
  String? get content;

  String? get mediaId;

  String? get idempotencyKey;

  IPleromaChatMessageSendData copyWith({
    String? content,
    String? mediaId,
    String? idempotencyKey,
  });

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class PleromaChatMessageSendData implements IPleromaChatMessageSendData {
  @override
  final String? content;
  @override
  @JsonKey(name: "media_id")
  final String? mediaId;

  @override
  @JsonKey(name: "idempotency_key")
  final String? idempotencyKey;

  PleromaChatMessageSendData({
    required this.content,
    required this.mediaId,
    required this.idempotencyKey,
  });

  @override
  PleromaChatMessageSendData copyWith({
    String? content,
    String? mediaId,
    String? idempotencyKey,
  }) =>
      PleromaChatMessageSendData(
        content: content ?? this.content,
        mediaId: mediaId ?? this.mediaId,
        idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatMessageSendData &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          mediaId == other.mediaId;

  @override
  int get hashCode => content.hashCode ^ mediaId.hashCode;

  @override
  String toString() {
    return 'PleromaChatMessageSendData{content: $content, mediaId: $mediaId}';
  }

  factory PleromaChatMessageSendData.fromJson(Map<String, dynamic> json) =>
      _$PleromaChatMessageSendDataFromJson(json);

  factory PleromaChatMessageSendData.fromJsonString(String jsonString) =>
      _$PleromaChatMessageSendDataFromJson(jsonDecode(jsonString));

  static List<PleromaChatMessageSendData> listFromJsonString(String str) =>
      List<PleromaChatMessageSendData>.from(
          json.decode(str).map((x) => PleromaChatMessageSendData.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$PleromaChatMessageSendDataToJson(this);

  String toJsonString() => jsonEncode(_$PleromaChatMessageSendDataToJson(this));
}

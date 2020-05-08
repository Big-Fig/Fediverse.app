import 'dart:convert';

import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_chat_model.g.dart';

abstract class IPleromaChat {
  String get id;

  int get unread;

  IPleromaAccount get account;
}

@JsonSerializable()
class PleromaChat implements IPleromaChat {
  @override
  final String id;
  @override
  final int unread;
  @override
  final PleromaAccount account;

  PleromaChat(
      {@required this.id, @required this.unread, @required this.account});

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
  String toString() {
    return 'PleromaChat{id: $id, unread: $unread, account: $account}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChat &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          unread == other.unread &&
          account == other.account;
  @override
  int get hashCode => id.hashCode ^ unread.hashCode ^ account.hashCode;
}

abstract class IPleromaChatMessage {
  String get id;

  String get chatId;

  String get accountId;

  String get content;

  DateTime get createdAt;

  List<IPleromaEmoji> get emojis;
}

@JsonSerializable()
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
  final String content;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final List<PleromaEmoji> emojis;
  PleromaChatMessage(
      {@required this.id,
      @required this.chatId,
      @required this.accountId,
      @required this.content,
      @required this.createdAt,
      @required this.emojis});

  @override
  String toString() {
    return 'PleromaChatMessage{id: $id, chatId: $chatId, '
        'accountId: $accountId, content: $content,'
        ' createdAt: $createdAt, emojis: $emojis}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PleromaChatMessage && runtimeType == other.runtimeType &&
              id == other.id && chatId == other.chatId &&
              accountId == other.accountId && content == other.content &&
              createdAt == other.createdAt && emojis == other.emojis;
  @override
  int get hashCode =>
      id.hashCode ^ chatId.hashCode ^ accountId.hashCode ^ content
          .hashCode ^ createdAt.hashCode ^ emojis.hashCode;


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
  String get content;
  Map<String, dynamic> toJson();

}

@JsonSerializable()
class PleromaChatMessageSendData implements IPleromaChatMessageSendData {
  @override
  final String content;
  PleromaChatMessageSendData({@required this.content});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatMessageSendData &&
          runtimeType == other.runtimeType &&
          content == other.content;
  @override
  int get hashCode => content.hashCode;
  @override
  String toString() {
    return 'PleromaChatMessage{content: $content}';
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

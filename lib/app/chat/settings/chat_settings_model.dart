import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 92)
class ChatSettings implements IJsonObject, ISettings<ChatSettings> {
  @HiveField(0)
  @JsonKey(name: "replace_conversations_with_pleroma_chats")
  final bool replaceConversationsWithPleromaChats;
  @HiveField(1)
  @JsonKey(name: "count_conversations_in_chats_unread_badges")
  final bool countConversationsInChatsUnreadBadges;

  ChatSettings({
    @required this.replaceConversationsWithPleromaChats,
    @required this.countConversationsInChatsUnreadBadges,
  });

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);

  factory ChatSettings.fromJsonString(String jsonString) =>
      _$ChatSettingsFromJson(jsonDecode(jsonString));

  static List<ChatSettings> listFromJsonString(String str) =>
      List<ChatSettings>.from(
          json.decode(str).map((x) => ChatSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$ChatSettingsToJson(this);

  String toJsonString() => jsonEncode(_$ChatSettingsToJson(this));

  @override
  ChatSettings clone() => copyWith();

  ChatSettings copyWith({
    bool replaceConversationsWithPleromaChats,
    bool countConversationsInChatsUnreadBadges,
  }) =>
      ChatSettings(
        replaceConversationsWithPleromaChats:
            replaceConversationsWithPleromaChats ??
                this.replaceConversationsWithPleromaChats,
        countConversationsInChatsUnreadBadges:
            countConversationsInChatsUnreadBadges ??
                this.countConversationsInChatsUnreadBadges,
      );
}

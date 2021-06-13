import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'chat_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 92)
class ChatSettings implements IJsonObject, ISettings<ChatSettings> {
  @HiveField(0)
  @JsonKey(name: 'replace_conversations_with_pleroma_chats')
  final bool replaceConversationsWithPleromaChats;
  @HiveField(1)
  @JsonKey(name: 'count_conversations_in_chats_unread_badges')
  final bool countConversationsInChatsUnreadBadges;

  const ChatSettings({
    required this.replaceConversationsWithPleromaChats,
    required this.countConversationsInChatsUnreadBadges,
  });

  static ChatSettings fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatSettingsToJson(this);

  @override
  ChatSettings clone() => copyWith();

  ChatSettings copyWith({
    bool? replaceConversationsWithPleromaChats,
    bool? countConversationsInChatsUnreadBadges,
  }) =>
      ChatSettings(
        replaceConversationsWithPleromaChats:
            replaceConversationsWithPleromaChats ??
                this.replaceConversationsWithPleromaChats,
        countConversationsInChatsUnreadBadges:
            countConversationsInChatsUnreadBadges ??
                this.countConversationsInChatsUnreadBadges,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatSettings &&
          runtimeType == other.runtimeType &&
          replaceConversationsWithPleromaChats ==
              other.replaceConversationsWithPleromaChats &&
          countConversationsInChatsUnreadBadges ==
              other.countConversationsInChatsUnreadBadges;

  @override
  int get hashCode =>
      replaceConversationsWithPleromaChats.hashCode ^
      countConversationsInChatsUnreadBadges.hashCode;

  @override
  String toString() => 'ChatSettings{'
      'replaceConversationsWithPleromaChats: '
      '$replaceConversationsWithPleromaChats, '
      'countConversationsInChatsUnreadBadges: '
      '$countConversationsInChatsUnreadBadges'
      '}';
}

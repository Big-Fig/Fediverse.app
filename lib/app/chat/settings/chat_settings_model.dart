import 'package:fedi/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'chat_settings_model.g.dart';
part 'chat_settings_model.freezed.dart';

@HiveType(typeId: -32 + 92)
@freezed
class ChatSettings
    with _$ChatSettings
    implements IJsonObj, ISettings<ChatSettings> {
  const ChatSettings._();

  const factory ChatSettings({
    @HiveField(0)
    @JsonKey(name: 'replace_conversations_with_pleroma_chats')
        required bool replaceConversationsWithPleromaChats,
    @HiveField(1)
    @JsonKey(name: 'count_conversations_in_chats_unread_badges')
        required bool countConversationsInChatsUnreadBadges,
  }) = _ChatSettings;

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);
}

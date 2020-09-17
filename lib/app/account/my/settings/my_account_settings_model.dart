import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'my_account_settings_model.g.dart';

@HiveType(typeId: -32 + 57)
class MyAccountSettings implements IPreferencesObject {
  @HiveField(0)
  bool isRealtimeWebSocketsEnabled;
  @HiveField(1)
  bool isNewChatsEnabled;
  @HiveField(2)
  bool isAlwaysShowSpoiler;
  @HiveField(3)
  bool isAlwaysShowNsfw;
  @HiveField(4)
  String defaultVisibility;
  @HiveField(5)
  bool markMediaNsfwByDefault;
  @HiveField(6)
  bool foregroundSoundForChatAndDm;
  @HiveField(7)
  bool foregroundSoundForMention;

  MyAccountSettings({
    this.isRealtimeWebSocketsEnabled,
    this.isNewChatsEnabled,
    this.isAlwaysShowSpoiler,
    this.isAlwaysShowNsfw,
    this.defaultVisibility,
    this.markMediaNsfwByDefault,
    this.foregroundSoundForChatAndDm,
    this.foregroundSoundForMention,
  });

  MyAccountSettings copyWith({
    bool isRealtimeWebSocketsEnabled,
    bool isNewChatsEnabled,
    bool isAlwaysShowSpoiler,
    bool isAlwaysShowNsfw,
    String defaultVisibility,
    bool markMediaNsfwByDefault,
    bool foregroundSoundForChatAndDm,
    bool foregroundSoundForMention,
  }) =>
      MyAccountSettings(
        isRealtimeWebSocketsEnabled:
            isRealtimeWebSocketsEnabled ?? this.isRealtimeWebSocketsEnabled,
        isNewChatsEnabled: isNewChatsEnabled ?? this.isNewChatsEnabled,
        isAlwaysShowSpoiler: isAlwaysShowSpoiler ?? this.isAlwaysShowSpoiler,
        isAlwaysShowNsfw: isAlwaysShowNsfw ?? this.isAlwaysShowNsfw,
        defaultVisibility: defaultVisibility ?? this.defaultVisibility,
        markMediaNsfwByDefault:
            markMediaNsfwByDefault ?? this.markMediaNsfwByDefault,
        foregroundSoundForChatAndDm:
            foregroundSoundForChatAndDm ?? this.foregroundSoundForChatAndDm,
        foregroundSoundForMention:
            foregroundSoundForMention ?? this.foregroundSoundForMention,
      );
}

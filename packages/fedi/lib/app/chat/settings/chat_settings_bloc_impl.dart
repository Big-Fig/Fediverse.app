import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';

class ChatSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<ChatSettings>
    implements IChatSettingsBloc {
  ChatSettingsBloc({
    required IChatSettingsLocalPreferenceBloc<ChatSettings>
        globalLocalPreferencesBloc,
    required IChatSettingsLocalPreferenceBloc<ChatSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  Future<void> changeCountConversationsInChatsUnreadBadges({
    required bool appendConversationUnreadToUnreadBadge,
  }) async =>
      updateSettings(
        settingsData.copyWith(
          countConversationsInChatsUnreadBadges:
              appendConversationUnreadToUnreadBadge,
        ),
      );

  @override
  Future<void> changeReplaceConversationsWithUnifediChats({
    required bool replaceConversationsWithChats,
  }) async =>
      updateSettings(
        settingsData.copyWith(
          replaceConversationsWithUnifediChats: replaceConversationsWithChats,
        ),
      );

  @override
  bool get countConversationsInChatsUnreadBadges =>
      settingsData.countConversationsInChatsUnreadBadges;

  @override
  Stream<bool> get countConversationsInChatsUnreadBadgesStream =>
      settingsDataStream
          .map((settings) => settings.countConversationsInChatsUnreadBadges);

  @override
  bool get replaceConversationsWithUnifediChats =>
      settingsData.replaceConversationsWithUnifediChats;

  @override
  Stream<bool> get replaceConversationsWithUnifediChatsStream =>
      settingsDataStream
          .map((settings) => settings.replaceConversationsWithUnifediChats);
}

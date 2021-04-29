import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class ChatSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<ChatSettings>
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
  Future changeCountConversationsInChatsUnreadBadges(bool value) async =>
      updateSettings(
        settingsData.copyWith(
          countConversationsInChatsUnreadBadges: value,
        ),
      );

  @override
  Future changeReplaceConversationsWithPleromaChats(bool value) async =>
      updateSettings(
        settingsData.copyWith(
          replaceConversationsWithPleromaChats: value,
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
  bool get replaceConversationsWithPleromaChats =>
      settingsData.replaceConversationsWithPleromaChats;

  @override
  Stream<bool> get replaceConversationsWithPleromaChatsStream =>
      settingsDataStream
          .map((settings) => settings.replaceConversationsWithPleromaChats);
}

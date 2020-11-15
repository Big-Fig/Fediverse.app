import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalChatSettingsLocalPreferencesBloc
    extends ChatSettingsLocalPreferencesBloc
    implements IGlobalChatSettingsLocalPreferencesBloc {
  GlobalChatSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "chat.settings.global");

  @override
  ChatSettings get defaultValue => ChatSettings(
        replaceConversationsWithChats: true,
        countConversationsInChatsUnreadBadges: true,
      );
}

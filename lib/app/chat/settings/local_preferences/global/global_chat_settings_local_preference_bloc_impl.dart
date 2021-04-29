import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalChatSettingsLocalPreferenceBloc
    extends ChatSettingsLocalPreferenceBloc<ChatSettings>
    implements IGlobalChatSettingsLocalPreferenceBloc {
  GlobalChatSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "chat.settings.global");

  static const ChatSettings defaultValue = ChatSettings(
    replaceConversationsWithPleromaChats: true,
    countConversationsInChatsUnreadBadges: true,
  );

  @override
  ChatSettings get defaultPreferenceValue => defaultValue;
}

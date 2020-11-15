import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalChatSettingsLocalPreferencesBloc
    extends ChatSettingsLocalPreferencesBloc
    implements IGlobalChatSettingsLocalPreferencesBloc {
  GlobalChatSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "chat.settings.global");
}

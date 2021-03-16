import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceChatSettingsLocalPreferencesBloc
    extends ChatSettingsLocalPreferencesBloc
    implements IInstanceChatSettingsLocalPreferencesBloc {
  InstanceChatSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "chat.settings.instance.$userAtHost");
}

import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceChatSettingsLocalPreferenceBloc
    extends ChatSettingsLocalPreferenceBloc<ChatSettings?>
    implements IInstanceChatSettingsLocalPreferenceBloc {
  InstanceChatSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, 'chat.settings.instance.$userAtHost');

  static const ChatSettings? defaultValue = null;

  @override
  ChatSettings? get defaultPreferenceValue => defaultValue;
}

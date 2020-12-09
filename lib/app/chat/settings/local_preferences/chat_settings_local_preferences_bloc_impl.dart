import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class ChatSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<ChatSettings>
    implements IChatSettingsLocalPreferencesBloc {
  ChatSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService,
      String key,
      ) : super(
    preferencesService,
    key,
    1,
        (json) => ChatSettings.fromJson(json),
  );
}

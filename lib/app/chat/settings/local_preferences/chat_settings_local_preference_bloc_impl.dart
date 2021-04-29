import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class ChatSettingsLocalPreferenceBloc<T extends ChatSettings?>
    extends ObjectLocalPreferenceBloc<T>
    implements IChatSettingsLocalPreferenceBloc<T> {
  ChatSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => ChatSettings.fromJson(json) as T,
        );
}

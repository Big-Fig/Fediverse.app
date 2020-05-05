import 'package:fedi/refactored/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class MyAccountSettingsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<MyAccountSettings>
    implements IMyAccountSettingsLocalPreferenceBloc {
  MyAccountSettingsLocalPreferenceBloc(
      String userAtHost, ILocalPreferencesService preferencesService)
      : super(preferencesService, "account.my.$userAtHost.settings", 1);

  @override
  MyAccountSettings get defaultValue =>
      MyAccountSettings(isRealtimeWebSocketsEnabled: true);
}

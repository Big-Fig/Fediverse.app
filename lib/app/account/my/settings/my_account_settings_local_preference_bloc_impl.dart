import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class MyAccountSettingsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<MyAccountSettings>
    implements IMyAccountSettingsLocalPreferenceBloc {
  MyAccountSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String userAtHost,
  ) : super(
          preferencesService,
          "account.my.$userAtHost.settings",
          1,
          (json) => MyAccountSettings.fromJson(json),
        );

  @override
  MyAccountSettings get defaultValue =>
      MyAccountSettings(isRealtimeWebSocketsEnabled: true);
}

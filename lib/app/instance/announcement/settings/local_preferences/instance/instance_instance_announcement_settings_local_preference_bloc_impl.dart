import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance_announcement_settings_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceInstanceAnnouncementSettingsLocalPreferenceBloc
    extends InstanceAnnouncementSettingsLocalPreferenceBloc<
        InstanceAnnouncementSettings>
    implements IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc {
  InstanceInstanceAnnouncementSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          '$userAtHost.instance_announcement.settings',
        );

  static final defaultValue = InstanceAnnouncementSettings(
    withDismissed: true,
  );

  @override
  InstanceAnnouncementSettings get defaultPreferenceValue => defaultValue;
}

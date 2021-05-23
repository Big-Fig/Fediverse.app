import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class InstanceAnnouncementSettingsLocalPreferenceBloc<
        T extends InstanceAnnouncementSettings?>
    extends ObjectLocalPreferenceBloc<T>
    implements IInstanceAnnouncementSettingsLocalPreferenceBloc<T> {
  InstanceAnnouncementSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) =>
              InstanceAnnouncementSettings.fromJson(json) as T,
        );
}

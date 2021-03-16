import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class InstanceFilesCacheSettingsLocalPreferencesBloc
    extends FilesCacheSettingsLocalPreferencesBloc
    implements IInstanceFilesCacheSettingsLocalPreferencesBloc {
  InstanceFilesCacheSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "cache.files.settings.instance.$userAtHost");
}

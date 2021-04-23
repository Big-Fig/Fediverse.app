import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilesCacheSettingsLocalPreferencesBloc<T extends FilesCacheSettings?>
    implements ILocalPreferenceBloc<T> {
  static IFilesCacheSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilesCacheSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}

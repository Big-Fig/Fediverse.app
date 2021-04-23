import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDatabaseCacheSettingsLocalPreferencesBloc<
    T extends DatabaseCacheSettings?> implements ILocalPreferenceBloc<T> {
  static IDatabaseCacheSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDatabaseCacheSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}

import 'package:fedi_app/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDatabaseCacheSettingsLocalPreferenceBloc<
    T extends DatabaseCacheSettings?> implements ILocalPreferenceBloc<T> {
  static IDatabaseCacheSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDatabaseCacheSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}

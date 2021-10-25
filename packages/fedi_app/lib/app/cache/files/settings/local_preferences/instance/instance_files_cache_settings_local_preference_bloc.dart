import 'package:fedi_app/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/files_cache_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceFilesCacheSettingsLocalPreferenceBloc
    implements IFilesCacheSettingsLocalPreferenceBloc<FilesCacheSettings?> {
  static IInstanceFilesCacheSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceFilesCacheSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}

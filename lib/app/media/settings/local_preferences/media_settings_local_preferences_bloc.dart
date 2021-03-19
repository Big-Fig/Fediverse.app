import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<MediaSettings?> {
  static IMediaSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaSettingsLocalPreferencesBloc>(context, listen: listen);
}

import 'package:fedi_app/app/media/settings/local_preferences/media_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/media/settings/media_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalMediaSettingsLocalPreferenceBloc
    implements IMediaSettingsLocalPreferenceBloc<MediaSettings> {
  static IGlobalMediaSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalMediaSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}

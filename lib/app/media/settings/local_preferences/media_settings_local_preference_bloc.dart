import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaSettingsLocalPreferenceBloc<T extends MediaSettings?>
    implements ILocalPreferenceBloc<T> {
  static IMediaSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaSettingsLocalPreferenceBloc>(context, listen: listen);
}

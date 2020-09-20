import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPublicTimelineSettingsLocalPreferencesBloc
    implements ITimelineSettingsLocalPreferencesBloc {
  static IPublicTimelineSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPublicTimelineSettingsLocalPreferencesBloc>(context,
          listen: listen);
}

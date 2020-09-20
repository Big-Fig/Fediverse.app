import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalTimelineSettingsLocalPreferencesBloc
    implements ITimelineSettingsLocalPreferencesBloc {
  static ILocalTimelineSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ILocalTimelineSettingsLocalPreferencesBloc>(context,
          listen: listen);
}

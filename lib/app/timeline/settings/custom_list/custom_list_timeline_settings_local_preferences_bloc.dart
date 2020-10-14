import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListTimelineSettingsLocalPreferencesBloc
    implements ITimelineSettingsLocalPreferencesBloc {
  static ICustomListTimelineSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomListTimelineSettingsLocalPreferencesBloc>(context,
          listen: listen);
}

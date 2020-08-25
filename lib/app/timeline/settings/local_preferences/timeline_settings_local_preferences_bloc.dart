import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<TimelineSettingsLocalPreferences> {
  static ITimelineSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelineSettingsLocalPreferencesBloc>(context, listen: listen);
}

import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<TimelineSettings> {
  static ITimelineSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelineSettingsLocalPreferencesBloc>(context,
          listen: listen);
}

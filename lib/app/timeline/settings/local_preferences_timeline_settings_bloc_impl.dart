import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter/widgets.dart';

class LocalPreferencesTimelineSettingsBloc extends TimelineSettingsBloc {
  final ITimelineSettingsLocalPreferencesBloc settingsLocalPreferencesBloc;

  LocalPreferencesTimelineSettingsBloc({
    @required this.settingsLocalPreferencesBloc,
    @required TimelineSettings originalSettings,
  }) : super(originalSettings: originalSettings) {
    addDisposable(
      streamSubscription: timelineSettingsStream.listen(
        (timelineSettings) {
          settingsLocalPreferencesBloc.setValue(timelineSettings);
        },
      ),
    );
  }
}

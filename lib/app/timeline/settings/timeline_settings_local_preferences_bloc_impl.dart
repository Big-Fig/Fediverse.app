import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

abstract class TimelineSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelineSettings>
    implements ITimelineSettingsLocalPreferencesBloc {
  TimelineSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required String timelineId,
  }) : super(
          preferencesService,
          "$userAtHost.timeline.$timelineId",
          1,
          (json) => TimelineSettings.fromJson(json),
        );

  @override
  TimelineSettings get defaultValue => null;
}

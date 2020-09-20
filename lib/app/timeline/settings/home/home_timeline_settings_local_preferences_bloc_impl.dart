import 'package:fedi/app/timeline/settings/home/home_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class HomeTimelineSettingsLocalPreferencesBloc
    extends TimelineSettingsLocalPreferencesBloc
    implements IHomeTimelineSettingsLocalPreferencesBloc {
  HomeTimelineSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "home",
        );

  @override
  TimelineSettings get defaultValue => TimelineSettings.home(
        id: "home",
        onlyLocal: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
      );
}

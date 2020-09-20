import 'package:fedi/app/timeline/settings/local/local_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class LocalTimelineSettingsLocalPreferencesBloc
    extends TimelineSettingsLocalPreferencesBloc
    implements ILocalTimelineSettingsLocalPreferencesBloc {
  LocalTimelineSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "local",
        );

  @override
  TimelineSettings get defaultValue => TimelineSettings.public(
        id: "local",
        onlyLocal: true,
        onlyNotMuted: false,
        excludeVisibilities: null,
        onlyWithMedia: false,
        onlyRemote: false,
      );
}

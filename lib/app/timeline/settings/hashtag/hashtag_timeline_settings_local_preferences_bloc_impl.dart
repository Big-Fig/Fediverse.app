import 'package:fedi/app/timeline/settings/hashtag/hashtag_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class HashtagTimelineSettingsLocalPreferencesBloc
    extends TimelineSettingsLocalPreferencesBloc
    implements IHashtagTimelineSettingsLocalPreferencesBloc {
  final String hashtag;

  HashtagTimelineSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required this.hashtag,
  }) : super(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "hashtag.$hashtag",
        );

  @override
  TimelineSettings get defaultValue => TimelineSettings.hashtag(
        id: "hashtag.$hashtag",
        onlyLocal: false,
        onlyWithMedia: true,
        withMuted: false,
        excludeVisibilities: null,
        withHashtag: hashtag,
      );
}

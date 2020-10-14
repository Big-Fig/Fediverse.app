import 'package:fedi/app/timeline/settings/custom_list/custom_list_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class CustomListTimelineSettingsLocalPreferencesBloc
    extends TimelineSettingsLocalPreferencesBloc
    implements ICustomListTimelineSettingsLocalPreferencesBloc {
  final String customListId;

  CustomListTimelineSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required this.customListId,
  }) : super(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "list.$customListId",
        );

  @override
  TimelineSettings get defaultValue => TimelineSettings.list(
        id: "list.$customListId",
        onlyInListWithRemoteId: customListId,
        withMuted: false,
        excludeVisibilities: [],
      );
}

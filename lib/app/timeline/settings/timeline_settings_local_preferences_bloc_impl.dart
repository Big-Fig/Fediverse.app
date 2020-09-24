import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class TimelineSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelineSettings>
    implements ITimelineSettingsLocalPreferencesBloc {
  TimelineSettingsLocalPreferencesBloc.byId(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required String timelineId,
  }) : super(
          preferencesService,
          "$userAtHost.timeline.$timelineId",
          1,
          (json) => TimelineSettings.fromJson(json),
        );

  TimelineSettingsLocalPreferencesBloc.customList(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required ICustomList customList,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "custom_list.${customList.remoteId}",
        );
  TimelineSettingsLocalPreferencesBloc.hashtag(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required IHashtag hashtag,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: "hashtag.${hashtag.name}",
        );
  TimelineSettingsLocalPreferencesBloc.account(
      ILocalPreferencesService preferencesService, {
        @required String userAtHost,
        @required IAccount account,
      }) : this.byId(
    preferencesService,
    userAtHost: userAtHost,
    timelineId: "account.${account.remoteId}",
  );


  @override
  TimelineSettings get defaultValue => null;
}

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class TimelineLocalPreferencesBloc extends ObjectLocalPreferenceBloc<Timeline>
    implements ITimelineLocalPreferencesBloc {
  TimelineLocalPreferencesBloc.byId(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required String timelineId,
  }) : super(
          preferencesService,
          "$userAtHost.timeline.$timelineId",
          1,
          (json) => Timeline.fromJson(json),
        );

  TimelineLocalPreferencesBloc.customList(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required ICustomList customList,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: customList.calculateTimelineId(),
        );

  TimelineLocalPreferencesBloc.hashtag(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required IHashtag hashtag,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: hashtag.calculateTimelineId(),
        );

  TimelineLocalPreferencesBloc.account(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
    @required IAccount account,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: account.calculateTimelineId(),
        );

  @override
  Timeline get defaultValue => null;
}

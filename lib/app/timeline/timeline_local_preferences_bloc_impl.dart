import 'dart:developer';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class TimelineLocalPreferencesBloc extends ObjectLocalPreferenceBloc<Timeline?>
    implements ITimelineLocalPreferencesBloc {
  @override
  final Timeline? defaultValue;

  TimelineLocalPreferencesBloc.byId(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required String? timelineId,
    required this.defaultValue,
  }) : super(
          preferencesService: preferencesService,
          key: "$userAtHost.timeline.$timelineId",
          schemaVersion: 1,
          jsonConverter: (json) => Timeline.fromJson(json),
        );

  TimelineLocalPreferencesBloc.customList(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required ICustomList customList,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: customList.calculateTimelineId(),
          defaultValue: Timeline(
            id: customList.calculateTimelineId(),
            label: customList.title,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultCustomListSettings(
              onlyInRemoteList: customList.toPleromaList(),
            ),
            typeString: TimelineType.customList.toJsonValue(),
          ),
        );

  TimelineLocalPreferencesBloc.hashtag(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required IHashtag hashtag,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: hashtag.calculateTimelineId(),
          defaultValue: Timeline(
            id: hashtag.calculateTimelineId(),
            label: hashtag.name,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultHashtagSettings(
              withRemoteHashtag: hashtag.name,
            ),
            typeString: TimelineType.hashtag.toJsonValue(),
          ),
        );

  TimelineLocalPreferencesBloc.account(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required IAccount account,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: account.calculateTimelineId(),
          defaultValue: Timeline(
            id: account.calculateTimelineId(),
            label: account.acct,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultAccountSettings(
              onlyFromRemoteAccount: account.toPleromaAccount(),
            ),
            typeString: TimelineType.account.toJsonValue(),
          ),
        );
}

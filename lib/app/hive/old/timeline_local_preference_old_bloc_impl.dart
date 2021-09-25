import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<Timeline?>
    implements ITimelineLocalPreferenceBlocOld {
  @override
  final Timeline? defaultPreferenceValue;

  TimelineLocalPreferenceBlocOld.byId(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required String timelineId,
    required this.defaultPreferenceValue,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.timeline.new.$timelineId',
          schemaVersion: 1,
          jsonConverter: (json) => Timeline.fromJson(json),
        );

  TimelineLocalPreferenceBlocOld.customList(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required ICustomList customList,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: customList.calculateTimelineId(),
          defaultPreferenceValue: Timeline(
            id: customList.calculateTimelineId(),
            label: customList.title,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultCustomListSettings(
              onlyInRemoteList: customList.toPleromaList(),
            ),
            typeString: TimelineType.customList.toJsonValue(),
          ),
        );

  TimelineLocalPreferenceBlocOld.instancePublicTimeline(
    ILocalPreferencesService preferencesService, {
    required IUnifediApiInstance unifediApiInstance,
  }) : this.byId(
          preferencesService,
          userAtHost: unifediApiInstance.uri,
          timelineId: 'public',
          defaultPreferenceValue: Timeline(
            id: unifediApiInstance.uri,
            // ignore: no-equal-arguments
            label: unifediApiInstance.uri,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultPublicSettings(),
            typeString: TimelineType.public.toJsonValue(),
          ),
        );

  TimelineLocalPreferenceBlocOld.hashtag(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required IHashtag hashtag,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: hashtag.calculateTimelineId(),
          defaultPreferenceValue: Timeline(
            id: hashtag.calculateTimelineId(),
            label: hashtag.name,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultHashtagSettings(
              withRemoteHashtag: hashtag.name,
            ),
            typeString: TimelineType.hashtag.toJsonValue(),
          ),
        );

  TimelineLocalPreferenceBlocOld.account(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required IAccount account,
  }) : this.byId(
          preferencesService,
          userAtHost: userAtHost,
          timelineId: account.calculateTimelineId(),
          defaultPreferenceValue: Timeline(
            id: account.calculateTimelineId(),
            label: account.acct,
            isPossibleToDelete: true,
            settings: TimelineSettings.createDefaultAccountSettings(
              onlyFromRemoteAccount: account.toUnifediApiAccount(),
            ),
            typeString: TimelineType.account.toJsonValue(),
          ),
        );
}

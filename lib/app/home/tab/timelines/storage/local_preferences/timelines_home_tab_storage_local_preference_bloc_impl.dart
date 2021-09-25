import 'package:fedi/app/home/tab/timelines/storage/local_preferences/timelines_home_tab_storage_local_preference_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class TimelinesHomeTabStorageLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<TimelinesHomeTabStorage>
    implements ITimelinesHomeTabStorageLocalPreferenceBloc {
  TimelinesHomeTabStorageLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.timelines.storage.new',
          schemaVersion: 1,
          jsonConverter: (json) => TimelinesHomeTabStorage.fromJson(json),
        );

  static const TimelinesHomeTabStorage defaultValue = TimelinesHomeTabStorage(
    timelineIds: [],
  );

  @override
  TimelinesHomeTabStorage get defaultPreferenceValue => defaultValue;
}

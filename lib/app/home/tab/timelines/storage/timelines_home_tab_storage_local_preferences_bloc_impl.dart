import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class TimelinesHomeTabStorageLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelinesHomeTabStorage?>
    implements ITimelinesHomeTabStorageLocalPreferencesBloc {
  TimelinesHomeTabStorageLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: "$userAtHost.timelines.storage",
          schemaVersion: 1,
          jsonConverter: (json) => TimelinesHomeTabStorage.fromJson(json),
        );

  @override
  TimelinesHomeTabStorage? get defaultPreferenceValue => null;
}

import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

 class TimelinesHomeTabStorageLocalPreferences
    extends ObjectLocalPreferenceBloc<TimelinesHomeTabStorage>
    implements ITimelinesHomeTabStorageLocalPreferences {
  TimelinesHomeTabStorageLocalPreferences(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(
          preferencesService,
          "$userAtHost.timelines.storage",
          1,
          (json) => TimelinesHomeTabStorage.fromJson(json),
        );

  @override
  TimelinesHomeTabStorage get defaultValue => null;
}

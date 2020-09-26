import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timelines_home_tab_storage_bloc_impl.dart");

class TimelinesHomeTabStorageBloc extends DisposableOwner
    implements ITimelinesHomeTabStorageBloc {
  final ILocalPreferencesService preferencesService;
  final AuthInstance authInstance;
  final ITimelinesHomeTabStorageLocalPreferences preferences;

  TimelinesHomeTabStorageBloc({
    @required this.preferencesService,
    @required this.preferences,
    @required this.authInstance,
  });

  @override
  List<String> get timelineIds => storage?.timelineIds;

  @override
  Stream<List<String>> get timelineIdsStream =>
      storageStream.map((storage) => storage?.timelineIds);

  @override
  TimelinesHomeTabStorage get storage => preferences.value;

  @override
  Stream<TimelinesHomeTabStorage> get storageStream => preferences.stream;

  @override
  Future onItemsUpdated(List<String> timelineIds) async {
    _logger.finest(() => "onItemsChanged $timelineIds");
    var updatedStorage = storage.copyWith(timelineIds: timelineIds);
    await preferences.setValue(updatedStorage);
  }

  @override
  Future remove(String timelineId) async {
    timelineIds.remove(timelineIds);
    await onItemsUpdated(timelineIds);

    var settingsLocalPreferencesBloc = TimelineLocalPreferencesBloc.byId(
      preferencesService,
      userAtHost: authInstance.userAtHost,
      timelineId: timelineId,
    );

    await settingsLocalPreferencesBloc.clearValue();

    settingsLocalPreferencesBloc.dispose();
  }
}

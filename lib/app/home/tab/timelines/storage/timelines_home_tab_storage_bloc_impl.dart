import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
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
  List<Timeline> get items => storage?.items;

  @override
  Stream<List<Timeline>> get itemsStream =>
      storageStream.map((storage) => storage?.items);

  @override
  TimelinesHomeTabStorage get storage => preferences.value;

  @override
  Stream<TimelinesHomeTabStorage> get storageStream => preferences.stream;

  @override
  Future onItemsUpdated(List<Timeline> items) async {
    _logger.finest(() => "onItemsChanged $items");
    var updatedStorage = storage.copyWith(items: items);
    await preferences.setValue(updatedStorage);
  }

  @override
  Future remove(Timeline item) async {
    items.remove(item);
    await onItemsUpdated(items);

    var settingsLocalPreferencesBloc =
        TimelineSettingsLocalPreferencesBloc.byId(
      preferencesService,
      userAtHost: authInstance.userAtHost,
      timelineId: item.timelineSettingsId,
    );

    await settingsLocalPreferencesBloc.clearValue();

    settingsLocalPreferencesBloc.dispose();
  }
}

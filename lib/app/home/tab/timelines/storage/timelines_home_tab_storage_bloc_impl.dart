import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class TimelinesHomeTabStorageBloc extends DisposableOwner
    implements ITimelinesHomeTabStorageBloc {
  final ITimelinesHomeTabStorageLocalPreferences preferences;

  TimelinesHomeTabStorageBloc({@required this.preferences});

  @override
  List<TimelinesHomeTabItem> get items => storage?.items;

  @override
  Stream<List<TimelinesHomeTabItem>> get itemsStream =>
      storageStream.map((storage) => storage?.items);

  @override
  TimelinesHomeTabStorage get storage => preferences.value;

  @override
  Stream<TimelinesHomeTabStorage> get storageStream => preferences.stream;
}

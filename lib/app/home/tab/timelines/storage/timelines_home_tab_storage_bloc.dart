import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabStorageBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static ITimelinesHomeTabStorageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelinesHomeTabStorageBloc>(
        context,
        listen: listen,
      );

  TimelinesHomeTabStorageUiState? get uiState;

  Stream<TimelinesHomeTabStorageUiState> get uiStateStream;

  TimelinesHomeTabStorage? get storage;

  Stream<TimelinesHomeTabStorage?> get storageStream;

  List<String> get timelineIds;

  Stream<List<String>> get timelineIdsStream;

  List<Timeline> get timelines;

  Stream<List<Timeline>> get timelinesStream;

  Stream<List<Timeline>> get timelinesDistinctStream;

  List<TimelinesHomeTabStorageListItem> get timelineStorageItems;

  Stream<List<TimelinesHomeTabStorageListItem>> get timelineStorageItemsStream;

  Stream<List<TimelinesHomeTabStorageListItem>>
      get timelineStorageItemsDistinctStream;

  Future onItemsUpdated(List<Timeline> timelines);

  Future add(Timeline timeline);

  Future remove(Timeline timeline);

  void switchToEditUiState();

  void switchToViewUiState();

  void swapItemsAt(int oldIndex, int newIndex);

  int indexOfKey(Key key);

  Timeline timelineOfKey(Key key);
}

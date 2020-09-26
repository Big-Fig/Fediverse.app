import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabStorageBloc
    implements IAsyncInitLoadingBloc, Disposable {
  static ITimelinesHomeTabStorageBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabStorageBloc>(context, listen: listen);

  TimelinesHomeTabStorage get storage;

  Stream<TimelinesHomeTabStorage> get storageStream;

  List<String> get timelineIds;

  Stream<List<String>> get timelineIdsStream;

  List<Timeline> get timelines;

  Stream<List<Timeline>> get timelinesStream;

  Future onItemsUpdated(List<Timeline> timelines);

  Future remove(Timeline timeline);
}

import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabStorageBloc extends Disposable {
  static ITimelinesHomeTabStorageBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabStorageBloc>(context, listen: listen);

  TimelinesHomeTabStorage get storage;

  Stream<TimelinesHomeTabStorage> get storageStream;

  List<Timeline> get items;

  Stream<List<Timeline>> get itemsStream;

  Future onItemsUpdated(List<Timeline> items);

  Future remove(Timeline item);
}

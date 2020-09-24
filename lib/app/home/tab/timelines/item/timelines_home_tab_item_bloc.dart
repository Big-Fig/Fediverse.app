import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabItemBloc extends Disposable {
  static ITimelinesHomeTabItemBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabItemBloc>(context, listen: listen);

  TimelinesHomeTabItem get item;

  Stream<TimelinesHomeTabItem> get itemStream;

  String get label;

  Stream<String> get labelStream;

  TimelineSettings get settings;

  Stream<TimelineSettings> get settingsStream;
}

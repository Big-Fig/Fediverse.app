import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineBloc extends Disposable {
  static ITimelineBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineBloc>(context, listen: listen);

  Timeline get timeline;

  Stream<Timeline> get timelineStream;

  TimelineSettings get settings;

  Stream<TimelineSettings> get settingsStream;
}

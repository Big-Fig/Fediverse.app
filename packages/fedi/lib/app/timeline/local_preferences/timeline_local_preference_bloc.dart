import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineLocalPreferenceBlocOld
    implements ILocalPreferenceBloc<Timeline?> {
  static ITimelineLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelineLocalPreferenceBlocOld>(context, listen: listen);
}

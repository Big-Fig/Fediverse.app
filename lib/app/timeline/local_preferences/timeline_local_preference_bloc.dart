import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineLocalPreferenceBloc
    implements ILocalPreferenceBloc<Timeline?> {
  static ITimelineLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelineLocalPreferenceBloc>(context, listen: listen);
}

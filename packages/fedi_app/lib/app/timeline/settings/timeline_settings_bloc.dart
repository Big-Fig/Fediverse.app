import 'package:fedi_app/app/settings/settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsBloc
    implements ISettingsBloc<TimelineSettings?> {
  static ITimelineSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineSettingsBloc>(context, listen: listen);
}

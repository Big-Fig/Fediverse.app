import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsFormBloc extends IFormBloc {
  static ITimelineSettingsFormBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineSettingsFormBloc>(context, listen: listen);

  TimelineSettings get timelineSettings;

  Stream<TimelineSettings> get timelineSettingsStream;

  IFormBoolFieldBloc get excludeRepliesFieldBloc;

  IFormBoolFieldBloc get onlyWithMediaFieldBloc;

  IFormBoolFieldBloc get excludeNsfwSensitiveFieldBloc;

  IFormBoolFieldBloc get onlyRemoteFieldBloc;

  IFormBoolFieldBloc get onlyLocalFieldBloc;

  IFormBoolFieldBloc get onlyPinnedFieldBloc;

  IFormBoolFieldBloc get withMutedFieldBloc;

  IFormBoolFieldBloc get excludeReblogsFieldBloc;

  void fill(TimelineSettings newSettings);
}

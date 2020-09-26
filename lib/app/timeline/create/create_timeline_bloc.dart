import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreateTimelineBloc implements IFormBloc {
  static ICreateTimelineBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreateTimelineBloc>(context, listen: listen);

  IFormValueFieldBloc<TimelineType> get timelineTypeFieldBloc;

  IFormValueFieldBloc<TimelineSettings> get timelineSettingsFieldBloc;

  IFormStringFieldBloc get nameFieldBloc;

  Future save();
}

import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreateTimelineBloc implements IFormBloc {
  static ICreateTimelineBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreateTimelineBloc>(context, listen: listen);

  IStringValueFormFieldBloc get idFieldBloc;

  IStringValueFormFieldBloc get nameFieldBloc;

  IValueFormFieldBloc<TimelineType> get typeFieldBloc;

  ITimelineSettingsFormBloc get settingsFormBloc;

  Future save();
}

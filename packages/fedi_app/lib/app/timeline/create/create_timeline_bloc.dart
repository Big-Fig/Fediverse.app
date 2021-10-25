import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreateTimelineBloc implements IFormBloc {
  static ICreateTimelineBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreateTimelineBloc>(context, listen: listen);

  IStringValueFormFieldBloc get idFieldBloc;

  IStringValueFormFieldBloc get nameFieldBloc;

  ITimelineTypeSingleFromListValueFormFieldBloc get typeFieldBloc;

  ITimelineSettingsBloc get timelineSettingsBloc;

  IEditTimelineSettingsBloc? get editTimelineSettingsBloc;

  Stream<IEditTimelineSettingsBloc?> get editTimelineSettingsBlocStream;

  Future<void> save();

  void handleBackPressed();
}

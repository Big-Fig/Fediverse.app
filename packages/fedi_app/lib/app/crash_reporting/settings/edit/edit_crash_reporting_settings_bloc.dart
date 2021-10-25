import 'package:fedi_app/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditCrashReportingSettingsBloc
    implements IEditGlobalSettingsBloc<CrashReportingSettings?> {
  static IEditCrashReportingSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditCrashReportingSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get reportingEnabledFieldBloc;
}

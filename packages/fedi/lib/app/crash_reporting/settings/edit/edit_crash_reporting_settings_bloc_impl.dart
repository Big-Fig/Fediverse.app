import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/edit/edit_crash_reporting_settings_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';

class EditCrashReportingSettingsBloc
    extends EditGlobalSettingsBloc<CrashReportingSettings?>
    implements IEditCrashReportingSettingsBloc {
  final ICrashReportingSettingsBloc crashReportingSettingsBloc;

  @override
  final BoolValueFormFieldBloc reportingEnabledFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        reportingEnabledFieldBloc,
      ];

  EditCrashReportingSettingsBloc({
    required this.crashReportingSettingsBloc,
    required bool isEnabled,
  })  : reportingEnabledFieldBloc = BoolValueFormFieldBloc(
          originValue: crashReportingSettingsBloc.reportingEnabled,
          isEnabled: isEnabled,
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: crashReportingSettingsBloc,
          isAllItemsInitialized: true,
        ) {
    reportingEnabledFieldBloc.disposeWith(this);
  }

  @override
  CrashReportingSettings calculateCurrentFormFieldsSettings() =>
      CrashReportingSettings(
        reportingEnabled: reportingEnabledFieldBloc.currentValue!,
      );

  @override
  Future<void> fillSettingsToFormFields(
    CrashReportingSettings? settings,
  ) async {
    reportingEnabledFieldBloc.changeCurrentValue(
      settings!.reportingEnabled,
    );
  }
}

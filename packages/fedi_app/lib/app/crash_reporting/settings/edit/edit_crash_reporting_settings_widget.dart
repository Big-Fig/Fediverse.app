import 'package:fedi_app/app/crash_reporting/settings/edit/edit_crash_reporting_settings_bloc.dart';
import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditCrashReportingSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditCrashReportingSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditCrashReportingSettingsThemeFieldWidget(),
        ],
      );
}

class _EditCrashReportingSettingsThemeFieldWidget extends StatelessWidget {
  const _EditCrashReportingSettingsThemeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditCrashReportingSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.reportingEnabledFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_crashReporting_settings_field_reportingEnabled_name,
        ),
      );
}

import 'package:fedi/app/crash_reporting/settings/edit/edit_crash_reporting_settings_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditCrashReportingSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditCrashReportingSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditCrashReportingSettingsThemeFieldWidget(),
      ],
    );
  }
}

class _EditCrashReportingSettingsThemeFieldWidget extends StatelessWidget {
  const _EditCrashReportingSettingsThemeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditCrashReportingSettingsBloc,
        IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.reportingEnabledFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_crashReporting_settings_field_reportingEnabled_name,
      ),
    );
  }
}

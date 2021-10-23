import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/edit/edit_crash_reporting_settings_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/edit/edit_crash_reporting_settings_bloc_impl.dart';
import 'package:fedi/app/crash_reporting/settings/edit/edit_crash_reporting_settings_widget.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalCrashReportingSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_crashReporting_settings_title,
    child: DisposableProvider<IEditCrashReportingSettingsBloc>(
      create: (context) => EditCrashReportingSettingsBloc(
        crashReportingSettingsBloc: ICrashReportingSettingsBloc.of(
          context,
          listen: false,
        ),
        isEnabled: IConfigService.of(context, listen: false).crashlyticsEnabled,
      ),
      child: const EditCrashReportingSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/analytics/app/app_analytics_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc.dart';
import 'package:fedi_app/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi_app/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi_app/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('crash_reporting_permission_checker_bloc_impl.dart');

class CrashReportingPermissionCheckerBloc extends DisposableOwner
    implements ICrashReportingPermissionCheckerBloc {
  final IConfigService configService;
  final IAppAnalyticsBloc appAnalyticsBloc;
  final IAskCrashReportingPermissionLocalPreferenceBloc
      askCrashReportingPermissionLocalPreferenceBloc;
  final ICrashReportingSettingsLocalPreferenceBloc
      crashReportingSettingsLocalPreferenceBloc;

  CrashReportingPermissionCheckerBloc({
    @required required this.appAnalyticsBloc,
    @required required this.configService,
    required this.askCrashReportingPermissionLocalPreferenceBloc,
    required this.crashReportingSettingsLocalPreferenceBloc,
  });

  @override
  Future<void> onUserAnswer({
    required bool reportingEnabled,
  }) async {
    await askCrashReportingPermissionLocalPreferenceBloc.setValue(true);
    await crashReportingSettingsLocalPreferenceBloc.setValue(
      CrashReportingSettings(
        reportingEnabled: reportingEnabled,
      ),
    );
  }

  @override
  bool get isNeedAskPermission {
    if (configService.crashlyticsAskHandlingCountAppOpenedToShow == null) {
      return false;
    }

    final crashlyticsAskHandlingCountAppOpenedToShow =
        configService.crashlyticsAskHandlingCountAppOpenedToShow!;
    var isHandlingCrashlyticsAsked =
        askCrashReportingPermissionLocalPreferenceBloc.value;
    var reportingEnabled =
        crashReportingSettingsLocalPreferenceBloc.value.reportingEnabled;
    var appOpenedCount = appAnalyticsBloc.appOpenedCount;
    var isNeedCheckPermission = !reportingEnabled &&
        !isHandlingCrashlyticsAsked &&
        appOpenedCount >= crashlyticsAskHandlingCountAppOpenedToShow;
    _logger.finest(
      () =>
          ' crashlyticsAskHandlingCountAppOpenedToShow $crashlyticsAskHandlingCountAppOpenedToShow \n'
          ' isHandlingCrashlyticsAsked $isHandlingCrashlyticsAsked \n'
          ' reportingEnabled $reportingEnabled \n'
          ' appOpenedCount $appOpenedCount \n'
          ' isNeedCheckPermission $isNeedCheckPermission',
    );

    return isNeedCheckPermission;
  }

  static CrashReportingPermissionCheckerBloc createFromContext(
    BuildContext context,
  ) =>
      CrashReportingPermissionCheckerBloc(
        appAnalyticsBloc: IAppAnalyticsBloc.of(
          context,
          listen: false,
        ),
        configService: IConfigService.of(
          context,
          listen: false,
        ),
        crashReportingSettingsLocalPreferenceBloc:
            ICrashReportingSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        askCrashReportingPermissionLocalPreferenceBloc:
            IAskCrashReportingPermissionLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<ICrashReportingPermissionCheckerBloc>(
        create: CrashReportingPermissionCheckerBloc.createFromContext,
        child: child,
      );
}

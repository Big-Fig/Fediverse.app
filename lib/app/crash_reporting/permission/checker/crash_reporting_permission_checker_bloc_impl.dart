import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc.dart';
import 'package:fedi/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
  Future onUserAnswer(bool result) async {
    await askCrashReportingPermissionLocalPreferenceBloc.setValue(true);
    await crashReportingSettingsLocalPreferenceBloc.setValue(
      CrashReportingSettings(
        reportingEnabled: result,
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
  }) {
    return DisposableProvider<ICrashReportingPermissionCheckerBloc>(
      create: (context) =>
          CrashReportingPermissionCheckerBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }
}

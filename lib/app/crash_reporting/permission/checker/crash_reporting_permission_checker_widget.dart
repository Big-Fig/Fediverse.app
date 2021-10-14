import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/crash_reporting/permission/ask/ask_crash_reporting_permission_dialog.dart';
import 'package:fedi/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger('crash_reporting_permission_checker_widget.dart');

class CrashReportingPermissionCheckerWidget extends StatefulWidget {
  final Widget child;

  const CrashReportingPermissionCheckerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  CrashReportingPermissionCheckerWidgetState createState() =>
      CrashReportingPermissionCheckerWidgetState();
}

class CrashReportingPermissionCheckerWidgetState
    extends State<CrashReportingPermissionCheckerWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    checkCrashReportingPermission();
  }

  Future checkCrashReportingPermission() async {
    var configService = IConfigService.of(context, listen: false);

    if (configService.crashlyticsEnabled) {
      var crashReportingPermissionCheckerBloc =
          ICrashReportingPermissionCheckerBloc.of(context, listen: false);

      var isNeedAskPermission =
          crashReportingPermissionCheckerBloc.isNeedAskPermission;
      _logger.finest(() => 'isNeedAskPermission $isNeedAskPermission');

      if (isNeedAskPermission) {
        // todo: refactor
        // ignore: no-magic-number
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          const Duration(milliseconds: 100),
          () async {
            await showAskCrashReportingPermissionDialog(
              context: context,
              checkerBloc: crashReportingPermissionCheckerBloc,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

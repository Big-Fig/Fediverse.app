import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICrashReportingPermissionCheckerBloc extends IDisposable {
  static ICrashReportingPermissionCheckerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICrashReportingPermissionCheckerBloc>(
        context,
        listen: listen,
      );

  bool get isNeedAskPermission;

  Future onUserAnswer(bool result);
}

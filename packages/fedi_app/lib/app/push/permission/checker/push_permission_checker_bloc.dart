import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushPermissionCheckerBloc extends IDisposable {
  static IPushPermissionCheckerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushPermissionCheckerBloc>(context, listen: listen);

  bool get isNeedCheckPermission;

  Future<bool> checkAndSubscribe();

  Future<void> onCheckDismissed();
}

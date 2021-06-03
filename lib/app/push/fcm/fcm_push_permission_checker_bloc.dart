import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFcmPushPermissionCheckerBloc extends IDisposable {
  static IFcmPushPermissionCheckerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFcmPushPermissionCheckerBloc>(context, listen: listen);

  bool get isNeedCheckPermission;

  Future<bool> checkAndSubscribe();

  Future onCheckDismissed();
}

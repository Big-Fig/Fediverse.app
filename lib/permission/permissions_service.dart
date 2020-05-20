import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

abstract class IPermissionsService implements Disposable {
  static IPermissionsService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPermissionsService>(context, listen: listen);

  Future<PermissionStatus> checkPermissionStatus(PermissionGroup permission);

  Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
      List<PermissionGroup> list);
}

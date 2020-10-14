import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

abstract class IPermissionsService implements Disposable {
  static IPermissionsService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPermissionsService>(context, listen: listen);

  Future<PermissionStatus> checkPermissionStatus(Permission permission);

  Future<Map<Permission, PermissionStatus>> requestPermissions(
      List<Permission> list);
}

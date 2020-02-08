import 'package:fedi/disposable/disposable.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionsService implements Disposable {
  Future<PermissionStatus> checkPermissionStatus(PermissionGroup permission);

  Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
      List<PermissionGroup> list);
}

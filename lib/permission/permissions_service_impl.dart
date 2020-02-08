import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService extends DisposableOwner implements IPermissionsService {
  final PermissionHandler permissionHandler = PermissionHandler();

  @override
  Future<PermissionStatus> checkPermissionStatus(PermissionGroup permission) {
    return permissionHandler.checkPermissionStatus(permission);
  }

  @override
  Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
      List<PermissionGroup> list) {
    return permissionHandler.requestPermissions(list);
  }
}

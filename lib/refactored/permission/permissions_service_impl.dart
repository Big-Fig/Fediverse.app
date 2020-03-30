import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/permission/permissions_service.dart';
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

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService extends DisposableOwner
    implements IPermissionsService {
  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) =>
      permission.status;

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> list,
  ) =>
      list.request();
}

import 'package:fedi/refactored/permission/camera_permission_bloc.dart';
import 'package:fedi/refactored/permission/permission_bloc_impl.dart';
import 'package:fedi/refactored/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionBloc extends PermissionBloc
    implements ICameraPermissionBloc {
  CameraPermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, PermissionGroup.camera);
}

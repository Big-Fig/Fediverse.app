import 'package:fedi_app/permission/camera_permission_bloc.dart';
import 'package:fedi_app/permission/permission_bloc_impl.dart';
import 'package:fedi_app/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionBloc extends PermissionBloc
    implements ICameraPermissionBloc {
  CameraPermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, Permission.camera);
}

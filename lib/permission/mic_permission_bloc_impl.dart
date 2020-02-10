import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class MicPermissionBloc extends PermissionBloc implements IMicPermissionBloc {
  MicPermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, PermissionGroup.microphone);
}

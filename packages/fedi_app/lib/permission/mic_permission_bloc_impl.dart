import 'package:fedi_app/permission/mic_permission_bloc.dart';
import 'package:fedi_app/permission/permission_bloc_impl.dart';
import 'package:fedi_app/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class MicPermissionBloc extends PermissionBloc implements IMicPermissionBloc {
  MicPermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, Permission.microphone);
}

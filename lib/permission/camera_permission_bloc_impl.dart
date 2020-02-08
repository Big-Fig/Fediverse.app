import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPermissionBloc extends PermissionBloc
    implements IContactsPermissionBloc {
  ContactsPermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, PermissionGroup.camera);
}

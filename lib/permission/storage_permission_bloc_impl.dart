import 'package:fedi/permission/permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionBloc extends PermissionBloc
    implements IStoragePermissionBloc {
  StoragePermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, PermissionGroup.storage);
}

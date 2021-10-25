import 'package:fedi_app/permission/permission_bloc_impl.dart';
import 'package:fedi_app/permission/permissions_service.dart';
import 'package:fedi_app/permission/storage_permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionBloc extends PermissionBloc
    implements IStoragePermissionBloc {
  StoragePermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, Permission.storage);
}

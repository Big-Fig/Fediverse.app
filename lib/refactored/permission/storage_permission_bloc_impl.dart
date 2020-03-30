import 'package:fedi/refactored/permission/storage_permission_bloc.dart';
import 'package:fedi/refactored/permission/mic_permission_bloc.dart';
import 'package:fedi/refactored/permission/permission_bloc_impl.dart';
import 'package:fedi/refactored/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionBloc extends PermissionBloc implements IStoragePermissionBloc {
  StoragePermissionBloc(IPermissionsService permissionsService)
      : super(permissionsService, PermissionGroup.storage);
}

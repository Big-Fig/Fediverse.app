import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/permission/permission_bloc.dart';
import 'package:fedi/refactored/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

abstract class PermissionBloc extends DisposableOwner
    implements IPermissionBloc {
  final IPermissionsService permissionsService;
  final PermissionGroup permission;

  PermissionBloc(this.permissionsService, this.permission); // ignore:

  Stream<bool> get permissionGrantedStream =>
      permissionStatusStream.map(IPermissionBloc.mapPermissionStatusToBool);

  bool get permissionGranted =>
      IPermissionBloc.mapPermissionStatusToBool(permissionStatus);

  // close_sinks
  final BehaviorSubject<PermissionStatus> _permissionStatusSubject =
      BehaviorSubject();

  Stream<PermissionStatus> get permissionStatusStream =>
      _permissionStatusSubject.stream;

  PermissionStatus get permissionStatus => _permissionStatusSubject.value;

  Future<PermissionStatus> checkPermissionStatus() async {
    var permissionStatus =
        await permissionsService.checkPermissionStatus(permission);
    _permissionStatusSubject.add(permissionStatus);
    return permissionStatus;
  }

  Future<PermissionStatus> requestPermission() async {
    var permissionStatus =
        (await permissionsService.requestPermissions([permission]))[permission];
    _permissionStatusSubject.add(permissionStatus);
    return permissionStatus;
  }
}

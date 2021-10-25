import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/permission/permission_bloc.dart';
import 'package:fedi_app/permission/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

abstract class PermissionBloc extends DisposableOwner
    implements IPermissionBloc {
  final IPermissionsService permissionsService;
  final Permission permission;

  PermissionBloc(this.permissionsService, this.permission); // ignore:

  @override
  Stream<bool?> get permissionGrantedStream =>
      permissionStatusStream.map(IPermissionBloc.mapPermissionStatusToBool);

  @override
  bool? get permissionGranted =>
      IPermissionBloc.mapPermissionStatusToBool(permissionStatus);

  // close_sinks
  final BehaviorSubject<PermissionStatus?> _permissionStatusSubject =
      BehaviorSubject();

  @override
  Stream<PermissionStatus?> get permissionStatusStream =>
      _permissionStatusSubject.stream;

  @override
  PermissionStatus? get permissionStatus => _permissionStatusSubject.value;

  @override
  Future<PermissionStatus> checkPermissionStatus() async {
    var permissionStatus =
        await permissionsService.checkPermissionStatus(permission);
    _permissionStatusSubject.add(permissionStatus);

    return permissionStatus;
  }

  @override
  Future<PermissionStatus?> requestPermission() async {
    var permissionStatus =
        (await permissionsService.requestPermissions([permission]))[permission];
    _permissionStatusSubject.add(permissionStatus);

    return permissionStatus;
  }
}

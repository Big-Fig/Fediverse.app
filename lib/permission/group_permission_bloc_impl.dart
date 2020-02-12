import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class GroupPermissionBloc extends AsyncInitLoadingBloc
    implements IPermissionBloc {
  final List<IPermissionBloc> permissionBlocs;
  GroupPermissionBloc(this.permissionBlocs);

  Stream<bool> get permissionGrantedStream =>
      permissionStatusStream.map(IPermissionBloc.mapPermissionStatusToBool);

  bool get permissionGranted =>
      IPermissionBloc.mapPermissionStatusToBool(permissionStatus);

  // ignore: close_sinks
  BehaviorSubject<PermissionStatus> permissionStatusSubject = BehaviorSubject();

  @override
  PermissionStatus get permissionStatus => permissionStatusSubject.value;

  @override
  Stream<PermissionStatus> get permissionStatusStream =>
      permissionStatusSubject.stream;

  @override
  Future<PermissionStatus> requestPermission() async {
    var permissionStatuses = <PermissionStatus>[];
    for(var permissionBloc in permissionBlocs) {
      permissionStatuses.add(await permissionBloc.requestPermission());
    }

    return _onPermissionStatusesChanged(permissionStatuses);
  }

  PermissionStatus _onPermissionStatusesChanged(List<PermissionStatus> permissionStatuses) {

    var allGranted = true;
    for (var permissionStatus in permissionStatuses) {

      allGranted &= IPermissionBloc.mapPermissionStatusToBool(permissionStatus);
      if (!allGranted) {
        break;
      }
    }

    PermissionStatus status;
    if (allGranted) {
      status = PermissionStatus.granted;
    } else {
      status = PermissionStatus.denied;
    }

    permissionStatusSubject.add(status);
    return status;
  }

  @override
  Future<PermissionStatus> checkPermissionStatus() async {
    var permissionStatuses = <PermissionStatus>[];
    for(var permissionBloc in permissionBlocs) {
      permissionStatuses.add(await permissionBloc.checkPermissionStatus());
    }

    return _onPermissionStatusesChanged(permissionStatuses);
  }

  @override
  Future internalAsyncInit() async {
    var status = await checkPermissionStatus();

    permissionStatusSubject.add(status);
  }
}

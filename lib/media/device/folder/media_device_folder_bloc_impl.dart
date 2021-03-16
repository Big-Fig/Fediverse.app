import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class MediaDeviceFolderBloc extends AsyncInitLoadingBloc
    implements IMediaDeviceFolderBloc {
  final IStoragePermissionBloc storagePermissionBloc;

  MediaDeviceFolderBloc({
    required this.storagePermissionBloc,
  });

  @override
  Future internalAsyncInit() async {
    await storagePermissionBloc.checkPermissionStatus();

    if (storagePermissionBloc.permissionGranted!) {
      await _initAfterPermissionGranted();
    } else {
      addDisposable(
        streamSubscription:
            storagePermissionBloc.permissionGrantedStream.distinct().listen(
          (granted) {
            // if (granted && files?.isNotEmpty != true) {
            //   _initAfterPermissionGranted();
            // }
          },
        ),
      );
    }
  }

  Future _initAfterPermissionGranted() async {
    // return await reloadFiles();
  }

  @override
  Future<PermissionStatus> checkPermissionStatus() =>
      storagePermissionBloc.checkPermissionStatus();

  @override
  bool? get permissionGranted => storagePermissionBloc.permissionGranted;

  @override
  Stream<bool?> get permissionGrantedStream =>
      storagePermissionBloc.permissionGrantedStream;

  @override
  PermissionStatus? get permissionStatus =>
      storagePermissionBloc.permissionStatus;

  @override
  Stream<PermissionStatus?> get permissionStatusStream =>
      storagePermissionBloc.permissionStatusStream;

  @override
  Future<PermissionStatus?> requestPermission() =>
      storagePermissionBloc.requestPermission();
}

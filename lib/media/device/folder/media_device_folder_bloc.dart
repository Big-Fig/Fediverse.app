import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFolderBloc
    implements IDisposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static IMediaDeviceFolderBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaDeviceFolderBloc>(context, listen: listen);

  Future<List<IMediaDeviceFileMetadata>> loadPagedFiles({
    required int? pageIndex,
    required int? itemsCountPerPage,
    required IMediaDeviceFileMetadata? olderThan,
    required IMediaDeviceFileMetadata? newerThan,
  });
}

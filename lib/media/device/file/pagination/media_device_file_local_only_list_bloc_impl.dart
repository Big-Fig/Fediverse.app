import 'package:fedi/app/list/local_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_list_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MediaDeviceFileLocalOnlyListBloc extends DisposableOwner
    implements IMediaDeviceFileLocalOnlyListBloc {
  final IMediaDeviceFolderBloc folderBloc;

  MediaDeviceFileLocalOnlyListBloc({
    @required this.folderBloc,
  });

  static MediaDeviceFileLocalOnlyListBloc createFromContext(
    BuildContext context, {
    @required IMediaDeviceFolderBloc folderBloc,
  }) =>
      MediaDeviceFileLocalOnlyListBloc(
        folderBloc: folderBloc,
      );

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required IMediaDeviceFolderBloc folderBloc,
  }) {
    return DisposableProvider<IMediaDeviceFileLocalOnlyListBloc>(
      create: (context) =>
          MediaDeviceFileLocalOnlyListBloc.createFromContext(
        context,
        folderBloc: folderBloc,
      ),
      child: ProxyProvider<IMediaDeviceFileLocalOnlyListBloc,
          ILocalOnlyListBloc<IMediaDeviceFileMetadata>>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }

  @override
  Future<List<IMediaDeviceFileMetadata>> loadItemsFromLocalForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required IMediaDeviceFileMetadata olderThan,
    @required IMediaDeviceFileMetadata newerThan,
  }) =>
      folderBloc.loadPagedFiles(
          pageIndex: pageIndex,
          itemsCountPerPage: itemsCountPerPage,
          olderThan: olderThan,
          newerThan: newerThan);
}

import 'package:fedi/app/media/picker/media_picker_file_grid_widget.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PermissionButtonBuilder = Widget Function(
    BuildContext context, WidgetBuilder grantedBuilder);

class FileGalleryFolderWidget extends StatelessWidget {
  final MediaDeviceFileCallback onFileSelectedCallback;
  final WidgetBuilder headerItemBuilder;
  final Widget loadingWidget;
  final PermissionButtonBuilder permissionButtonBuilder;

  FileGalleryFolderWidget({
    @required this.onFileSelectedCallback,
    @required this.headerItemBuilder,
    @required this.loadingWidget,
    @required this.permissionButtonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var folderBloc = IMediaDeviceFolderBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => permissionButtonBuilder(
        context,
        (context) {
          return MediaPickerFileGridWidget(
            onFileSelectedCallback: onFileSelectedCallback,
            loadingWidget: loadingWidget,
            headerItemBuilder: headerItemBuilder,
          );
          // return buildPermissionGrantedView(context);
        },
      ),
      loadingWidget: loadingWidget,
      asyncInitLoadingBloc: folderBloc,
    );
  }
}

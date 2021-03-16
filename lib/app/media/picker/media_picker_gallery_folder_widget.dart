import 'package:fedi/app/media/picker/media_picker_file_grid_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final _logger = Logger("media_picker_gallery_folder_widget.dart");

typedef PermissionButtonBuilder = Widget Function(
    BuildContext context, WidgetBuilder grantedBuilder);

class FileGalleryFolderWidget extends StatelessWidget {
  final WidgetBuilder headerItemBuilder;
  final PermissionButtonBuilder permissionButtonBuilder;

  FileGalleryFolderWidget({
    required this.headerItemBuilder,
    required this.permissionButtonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var folderBloc = IMediaDeviceFolderBloc.of(context);
    _logger.finest(() => "build");
    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => permissionButtonBuilder(
        context,
        (context) {
          _logger.finest(() => "async finished build");
          return MediaPickerFileGridWidget(
            headerItemBuilder: headerItemBuilder,
          );
          // return buildPermissionGrantedView(context);
        },
      ),
      loadingWidget: const FediCircularProgressIndicator(),
      asyncInitLoadingBloc: folderBloc,
    );
  }
}

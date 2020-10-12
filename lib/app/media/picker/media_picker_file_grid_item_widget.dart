import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/media/device/file/media_device_file_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaPickerFileGridItemWidget extends StatelessWidget {
  final MediaDeviceFileCallback onFileSelectedCallback;
  final Widget loadingWidget;

  MediaPickerFileGridItemWidget({
    @required this.onFileSelectedCallback,
    @required this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    var fileBloc = IMediaDeviceFileBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => buildLoadedWidget(context, fileBloc),
      asyncInitLoadingBloc: fileBloc,
      loadingWidget: loadingWidget,
    );
  }

  Widget buildLoadedWidget(
      BuildContext context, IMediaDeviceFileBloc galleryFileBloc) {
    return InkWell(
      onTap: () async {
        onFileSelectedCallback(await galleryFileBloc.retrieveFile());
      },
      child: Stack(
        children: <Widget>[
          buildPreviewImage(galleryFileBloc),
          Center(child: buildIcon(galleryFileBloc))
        ],
      ),
    );
  }

  Widget buildIcon(IMediaDeviceFileBloc fileBloc) {
    return fileBloc.type == MediaDeviceFileType.video
        ? Icon(
            FediIcons.play,
            color: Colors.white,
          )
        : SizedBox.shrink();
  }

  Widget buildPreviewImage(IMediaDeviceFileBloc fileBloc) {
    var thumbImageData = fileBloc.thumbImageData;

    if (thumbImageData == null) {
      return Center(child: loadingWidget);
    }
    return Image.memory(
      thumbImageData,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

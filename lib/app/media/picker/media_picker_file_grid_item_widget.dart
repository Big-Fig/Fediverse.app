import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
      loadingFinishedBuilder: (context) => _MediaPickerFileGridItemBodyWidget(
          onFileSelectedCallback: onFileSelectedCallback,
          loadingWidget: loadingWidget),
      asyncInitLoadingBloc: fileBloc,
      loadingWidget: loadingWidget,
    );
  }
}

class _MediaPickerFileGridItemBodyWidget extends StatelessWidget {
  const _MediaPickerFileGridItemBodyWidget({
    Key key,
    @required this.onFileSelectedCallback,
    @required this.loadingWidget,
  }) : super(key: key);

  final MediaDeviceFileCallback onFileSelectedCallback;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFileBloc = IMediaDeviceFileBloc.of(context);
    return InkWell(
      onTap: () async {
        onFileSelectedCallback(
            context, await mediaDeviceFileBloc.retrieveFile());
      },
      child: Stack(
        children: <Widget>[
          _MediaPickerFileGridItemPreviewWidget(
            loadingWidget: loadingWidget,
          ),
          const _MediaPickerFileGridItemIconWidget(),
        ],
      ),
    );
  }
}

class _MediaPickerFileGridItemIconWidget extends StatelessWidget {
  const _MediaPickerFileGridItemIconWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFileBloc = IMediaDeviceFileBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Center(
      child: mediaDeviceFileBloc.type == MediaDeviceFileType.video
          ? Icon(
              FediIcons.play,
              color: fediUiColorTheme.white,
            )
          : SizedBox.shrink(),
    );
  }
}

class _MediaPickerFileGridItemPreviewWidget extends StatelessWidget {
  const _MediaPickerFileGridItemPreviewWidget({
    Key key,
    @required this.loadingWidget,
  }) : super(key: key);

  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFileBloc = IMediaDeviceFileBloc.of(context);

    var thumbImageData = mediaDeviceFileBloc.thumbImageData;

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

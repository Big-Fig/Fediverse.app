import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/media/device/file/media_device_file_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaPickerFileGridItemWidget extends StatelessWidget {
  const MediaPickerFileGridItemWidget();

  @override
  Widget build(BuildContext context) {
    var fileBloc = IMediaDeviceFileBloc.of(context);

    return Container(
      color: IFediUiColorTheme.of(context).darkGrey,
      child: AsyncInitLoadingWidget(
        loadingFinishedBuilder: (context) =>
            const _MediaPickerFileGridItemBodyWidget(
          loadingWidget: _MediaPickerFileGridItemLoadingWidget(),
        ),
        asyncInitLoadingBloc: fileBloc,
        loadingWidget: const _MediaPickerFileGridItemLoadingWidget(),
      ),
    );
  }
}

class _MediaPickerFileGridItemBodyWidget extends StatelessWidget {
  const _MediaPickerFileGridItemBodyWidget({
    Key key,
    @required this.loadingWidget,
  }) : super(key: key);

  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFileBloc = IMediaDeviceFileBloc.of(context);
    return InkWell(
      onTap: () async {
        var mediaPickerBloc = IMediaPickerBloc.of(
          context,
          listen: false,
        );

        var mediaDeviceFile = await mediaDeviceFileBloc.retrieveFile();
        mediaPickerBloc.onFileSelected(mediaDeviceFile);
      },
      child: const _MediaPickerFileGridItemPreviewWidget(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFileBloc = IMediaDeviceFileBloc.of(context);

    var thumbImageData = mediaDeviceFileBloc.thumbImageData;

    if (thumbImageData == null) {
      return const _MediaPickerFileGridItemLoadingWidget();
    }

    return Stack(
      children: [
        Image.memory(
          thumbImageData,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        const _MediaPickerFileGridItemIconWidget(),
      ],
    );
  }
}

class _MediaPickerFileGridItemLoadingWidget extends StatelessWidget {
  const _MediaPickerFileGridItemLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediCircularProgressIndicator(
        color: IFediUiColorTheme.of(context).white,
      ),
    );
  }
}

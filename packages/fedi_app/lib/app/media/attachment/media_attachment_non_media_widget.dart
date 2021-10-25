import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi_app/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi_app/app/media/file/path/media_file_path_widget.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentNonMediaWidget extends StatelessWidget {
  final double opacity;
  final Widget? actionsWidget;

  // final String filePath;

  const MediaAttachmentNonMediaWidget({
    Key? key,
    required this.actionsWidget, // @required this.filePath,
    this.opacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProxyProvider<IUnifediApiMediaAttachment, IMediaFilePathBloc>(
        update: (context, value, _) => MediaFilePathBloc(
          path: value.remoteUrl,
          customName: value.description,
        ),
        child: MediaFilePathWidget(
          opacity: opacity,
          actionsWidget: actionsWidget,
        ),
      );
}

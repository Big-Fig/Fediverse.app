import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi/app/media/file/path/media_file_path_widget.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentNonMediaWidget extends StatelessWidget {
  final double opacity;
  final Widget? actionsWidget;

  // final String filePath;

  const MediaAttachmentNonMediaWidget({
    this.opacity = 1.0,
    required this.actionsWidget, // @required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IUnifediApiMediaAttachment,
        IMediaFilePathBloc>(
      update: (context, value, _) {
        return MediaFilePathBloc(
          path: value.remoteUrl,
          customName: value.description,
        );
      },
      child: MediaFilePathWidget(
        opacity: opacity,
        actionsWidget: actionsWidget,
      ),
    );
  }
}

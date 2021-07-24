import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi/app/media/file/path/media_file_path_widget.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/material.dart';

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
    return DisposableProxyProvider<IPleromaApiMediaAttachment,
        IMediaFilePathBloc>(
      update: (context, value, _) => MediaFilePathBloc(path: value.remoteUrl),
      child: MediaFilePathWidget(
        opacity: opacity,
        actionsWidget: actionsWidget,
      ),
    );
  }
}

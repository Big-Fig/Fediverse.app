import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi/app/media/file/path/media_file_path_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';

class MediaAttachmentNonMediaWidget extends StatelessWidget {
  final double opacity;
  final Widget actionsWidget;

  // final String filePath;

  const MediaAttachmentNonMediaWidget({
    this.opacity = 1.0,
    @required this.actionsWidget, // @required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IPleromaMediaAttachment, IMediaFilePathBloc>(
      update: (context, value, _) => MediaFilePathBloc(path: value.remoteUrl),
      child: MediaFilePathWidget(
        opacity: opacity,
        actionsWidget: actionsWidget,
      ),
    );
  }
}

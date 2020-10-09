import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';

class MediaAttachmentVideoWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentVideoWidget(this.mediaAttachment);

  @override
  Widget build(BuildContext context) {
    return VideoMediaPlayerBloc.provideToContext(
      context,
      mediaPlayerSource:
          MediaPlayerSource.network(networkUrl: mediaAttachment.url),
      child: FediVideoPlayerWidget(),
      desiredAspectRatio:
          VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
    );
  }
}

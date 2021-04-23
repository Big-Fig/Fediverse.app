import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_provider.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/material.dart';

class MediaAttachmentVideoWidget extends StatelessWidget {
  const MediaAttachmentVideoWidget();

  @override
  Widget build(BuildContext context) {
    var mediaSettingsBloc = IMediaSettingsBloc.of(context);
    return DisposableProxyProvider<IPleromaMediaAttachment,
        IVideoMediaPlayerBloc>(
      update: (context, mediaAttachment, _) =>
          VideoMediaPlayerBloc.createFromContext(
        context,
        isFullscreen: false,
        desiredAspectRatio:
            VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
        autoInit: mediaSettingsBloc.autoInit,
        autoPlay: mediaSettingsBloc.autoPlay,
        mediaPlayerSource:
            MediaPlayerSource.network(networkUrl: mediaAttachment.url),
      ),
      child: VideoMediaPlayerBlocProxyProvider(
        child: const FediVideoPlayerWidget(),
      ),
    );
  }
}

import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/media/settings/media_settings_bloc.dart';
import 'package:fedi_app/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi_app/media/player/media_player_model.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentVideoWidget extends StatelessWidget {
  const MediaAttachmentVideoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSettingsBloc = IMediaSettingsBloc.of(context);

    return DisposableProxyProvider<IUnifediApiMediaAttachment,
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
      child: const VideoMediaPlayerBlocProxyProvider(
        child: FediVideoPlayerWidget(),
      ),
    );
  }
}

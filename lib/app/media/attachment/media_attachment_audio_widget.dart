import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/ui/media/player/audio/fedi_audio_player_widget.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc_impl.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc_provider.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentAudioWidget extends StatelessWidget {
  const MediaAttachmentAudioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSettingsBloc = IMediaSettingsBloc.of(context);

    return DisposableProxyProvider<IUnifediApiMediaAttachment,
        IAudioMediaPlayerBloc>(
      update: (context, mediaAttachment, _) =>
          AudioMediaPlayerBloc.createFromContext(
        context,
        autoInit: mediaSettingsBloc.autoInit,
        autoPlay: mediaSettingsBloc.autoPlay,
        mediaPlayerSource:
            MediaPlayerSource.network(networkUrl: mediaAttachment.url),
      ),
      child: const AudioMediaPlayerBlocProxyProvider(
        child: FediAudioPlayerWidget(),
      ),
    );
  }
}

import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/media/player/audio/audio_media_player_bloc.dart';
import 'package:fedi_app/media/player/audio/audio_media_player_bloc_provider.dart';
import 'package:fedi_app/media/player/media_player_bloc_impl.dart';
import 'package:fedi_app/media/player/media_player_model.dart';
import 'package:flutter/widgets.dart';

class AudioMediaPlayerBloc extends MediaPlayerBloc
    implements IAudioMediaPlayerBloc {
  AudioMediaPlayerBloc({
    required MediaPlayerSource mediaPlayerSource,
    required bool? autoInit,
    required bool? autoPlay,
  }) : super(
          mediaPlayerSource: mediaPlayerSource,
          autoInit: autoInit,
          autoPlay: autoPlay,
        );

  static AudioMediaPlayerBloc createFromContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required bool? autoInit,
    required bool? autoPlay,
  }) =>
      AudioMediaPlayerBloc(
        mediaPlayerSource: mediaPlayerSource,
        autoInit: autoInit,
        autoPlay: autoPlay,
      );

  static Widget provideToContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required Widget child,
    required bool? autoInit,
    required bool? autoPlay,
  }) =>
      DisposableProvider<IAudioMediaPlayerBloc>(
        create: (context) => AudioMediaPlayerBloc.createFromContext(
          context,
          mediaPlayerSource: mediaPlayerSource,
          autoInit: autoInit,
          autoPlay: autoPlay,
        ),
        child: AudioMediaPlayerBlocProxyProvider(
          child: child,
        ),
      );
}

import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/media_player_bloc_impl.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AudioMediaPlayerBloc extends MediaPlayerBloc
    implements IAudioMediaPlayerBloc {
  AudioMediaPlayerBloc({@required MediaPlayerSource mediaPlayerSource})
      : super(
          mediaPlayerSource: mediaPlayerSource,
        );

  static AudioMediaPlayerBloc createFromContext(
    BuildContext context, {
    @required MediaPlayerSource mediaPlayerSource,
  }) =>
      AudioMediaPlayerBloc(mediaPlayerSource: mediaPlayerSource);

  static Widget provideToContext(
    BuildContext context, {
    @required MediaPlayerSource mediaPlayerSource,
    @required Widget child,
  }) {
    return DisposableProvider<IAudioMediaPlayerBloc>(
      create: (context) => AudioMediaPlayerBloc.createFromContext(
        context,
        mediaPlayerSource: mediaPlayerSource,
      ),
      child: ProxyProvider<IAudioMediaPlayerBloc, IMediaPlayerBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}

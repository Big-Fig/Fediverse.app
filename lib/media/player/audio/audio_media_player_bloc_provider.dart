import 'package:fedi/media/player/audio/audio_media_player_bloc.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AudioMediaPlayerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AudioMediaPlayerBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAudioMediaPlayerBloc, IMediaPlayerBloc>(
        update: (context, value, _) => value,
        child: child,
      );
}

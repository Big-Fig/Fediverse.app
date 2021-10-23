import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class VideoMediaPlayerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const VideoMediaPlayerBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IVideoMediaPlayerBloc, IMediaPlayerBloc>(
        update: (context, value, _) => value,
        child: child,
      );
}

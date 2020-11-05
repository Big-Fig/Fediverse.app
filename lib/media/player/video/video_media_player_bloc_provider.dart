import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class VideoMediaPlayerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  VideoMediaPlayerBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IVideoMediaPlayerBloc, IMediaPlayerBloc>(
      update: (context, value, _) => value,
      child: child,
    );
  }
}

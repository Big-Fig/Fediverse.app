import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAudioMediaPlayerBloc implements IMediaPlayerBloc {
  static IAudioMediaPlayerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAudioMediaPlayerBloc>(context, listen: listen);
}

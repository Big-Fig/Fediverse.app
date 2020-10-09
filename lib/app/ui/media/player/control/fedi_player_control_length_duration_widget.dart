import 'package:fedi/app/ui/media/player/control/fedi_player_control_duration_widget.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediPlayerControlLengthDurationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<Duration>(
        stream: mediaPlayerBloc.lengthDurationStream,
        initialData: mediaPlayerBloc.lengthDuration,
        builder: (context, snapshot) {
          var duration = snapshot.data;
          return FediPlayerControlDurationWidget(
            duration: duration,
          );
        });
  }
}

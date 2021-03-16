import 'package:fedi/app/ui/media/player/control/fedi_player_control_duration_widget.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediPlayerControlLengthDurationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<Duration>(
        stream: mediaPlayerBloc.lengthDurationStream,
        builder: (context, snapshot) {
          var duration = snapshot.data;
          return Provider<Duration?>.value(
            value: duration,
            child: const FediPlayerControlDurationWidget(),
          );
        });
  }

  const FediPlayerControlLengthDurationWidget();
}

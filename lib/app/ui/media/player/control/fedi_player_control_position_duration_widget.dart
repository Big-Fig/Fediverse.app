import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_duration_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediPlayerControlPositionDurationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isBufferingStream,
        initialData: mediaPlayerBloc.isBuffering,
        builder: (context, snapshot) {
          var isBuffering = snapshot.data;

          if (isBuffering) {
            return FediCircularProgressIndicator(
              color: IFediUiColorTheme.of(context).white,
              size: 22.0,
            );
          } else {
            return StreamBuilder<Duration>(
                stream: mediaPlayerBloc.positionDurationStream,
                initialData: mediaPlayerBloc.positionDuration,
                builder: (context, snapshot) {
                  var duration = snapshot.data;
                  return FediPlayerControlDurationWidget(
                    duration: duration,
                  );
                });
          }
        });
  }
}

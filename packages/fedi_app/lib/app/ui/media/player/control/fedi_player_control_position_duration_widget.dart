import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_duration_widget.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediPlayerControlPositionDurationWidget extends StatelessWidget {
  const FediPlayerControlPositionDurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isBufferingStream,
      initialData: mediaPlayerBloc.isBuffering,
      builder: (context, snapshot) {
        var isBuffering = snapshot.data!;

        if (isBuffering) {
          return const _FediPlayerControlPositionDurationLoadingWidget();
        } else {
          return const _FediPlayerControlPositionDurationBodyWidget();
        }
      },
    );
  }
}

class _FediPlayerControlPositionDurationBodyWidget extends StatelessWidget {
  const _FediPlayerControlPositionDurationBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<Duration>(
      stream: mediaPlayerBloc.positionDurationStream,
      builder: (context, snapshot) {
        var duration = snapshot.data;

        return Provider<Duration?>.value(
          value: duration,
          child: const FediPlayerControlDurationWidget(),
        );
      },
    );
  }
}

class _FediPlayerControlPositionDurationLoadingWidget extends StatelessWidget {
  const _FediPlayerControlPositionDurationLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediCircularProgressIndicator(
        color: IFediUiColorTheme.of(context).white,
        // ignore: no-magic-number
        size: 22.0,
      );
}

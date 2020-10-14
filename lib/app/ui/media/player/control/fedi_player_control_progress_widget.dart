import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPlayerControlProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: FediColors.white,
        inactiveTrackColor: FediColors.grey,
        disabledActiveTrackColor: FediColors.mediumGrey,
        disabledInactiveTrackColor: FediColors.mediumGrey,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 1.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
        thumbColor: Colors.white,
        disabledThumbColor: FediColors.mediumGrey,
      ),
      child: StreamBuilder<bool>(
          stream: mediaPlayerBloc.isInitializedStream,
          initialData: mediaPlayerBloc.isInitialized,
          builder: (context, snapshot) {
            var isInitialized = snapshot.data;

            return StreamBuilder<double>(
                stream: mediaPlayerBloc.currentPlaybackPercentStream,
                initialData: mediaPlayerBloc.currentPlaybackPercent,
                builder: (context, snapshot) {
                  var currentPlaybackPercent = snapshot.data ?? 0.0;
                  return Slider(
                    value: currentPlaybackPercent,
                    min: 0.0,
                    max: 1.0,
                    onChanged: isInitialized
                        ? (value) {
                            mediaPlayerBloc.seekToPercent(value);
                          }
                        : null,
                  );
                });
          }),
    );
  }
}

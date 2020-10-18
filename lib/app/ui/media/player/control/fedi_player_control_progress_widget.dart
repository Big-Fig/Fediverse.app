import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPlayerControlProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: IFediUiColorTheme.of(context).white,
        inactiveTrackColor: IFediUiColorTheme.of(context).grey,
        disabledActiveTrackColor: IFediUiColorTheme.of(context).mediumGrey,
        disabledInactiveTrackColor: IFediUiColorTheme.of(context).mediumGrey,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 1.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
        thumbColor: fediUiColorTheme.white,
        disabledThumbColor: IFediUiColorTheme.of(context).mediumGrey,
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

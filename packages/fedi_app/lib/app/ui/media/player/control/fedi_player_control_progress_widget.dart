import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPlayerControlProgressWidget extends StatelessWidget {
  const FediPlayerControlProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: fediUiColorTheme.white,
        inactiveTrackColor: fediUiColorTheme.grey,
        disabledActiveTrackColor: fediUiColorTheme.mediumGrey,
        disabledInactiveTrackColor: fediUiColorTheme.mediumGrey,
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 1.0,
        // ignore: no-magic-number
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4.0),
        // ignore: no-equal-arguments
        thumbColor: fediUiColorTheme.white,
        // ignore: no-equal-arguments
        disabledThumbColor: fediUiColorTheme.mediumGrey,
      ),
      child: const _FediPlayerControlProgressPlaybackWidget(),
    );
  }
}

class _FediPlayerControlProgressPlaybackWidget extends StatelessWidget {
  const _FediPlayerControlProgressPlaybackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isInitializedStream,
      builder: (context, snapshot) {
        var isInitialized = snapshot.data ?? false;

        return StreamBuilder<double>(
          stream: mediaPlayerBloc.currentPlaybackPercentStream,
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
          },
        );
      },
    );
  }
}

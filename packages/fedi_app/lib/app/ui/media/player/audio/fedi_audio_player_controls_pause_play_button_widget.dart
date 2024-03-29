import 'package:fedi_app/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediAudioPlayerControlsPausePlayButtonWidget extends StatelessWidget {
  const FediAudioPlayerControlsPausePlayButtonWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isInitializingStream,
      builder: (context, snapshot) {
        var isInitializing = snapshot.data ?? true;

        if (isInitializing) {
          return const _FediAudioPlayerControlsPausePlayButtonLoadingWidget();
        } else {
          return const _FediAudioPlayerControlsPausePlayButtonBodyWidget();
        }
      },
    );
  }
}

class _FediAudioPlayerControlsPausePlayButtonBodyWidget
    extends StatelessWidget {
  const _FediAudioPlayerControlsPausePlayButtonBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isPlayingStream,
      builder: (context, snapshot) {
        var isPlaying = snapshot.data ?? false;

        return AsyncOperationButtonBuilderWidget(
          showProgressDialog: false,
          builder: (BuildContext context, void Function()? onPressed) =>
              FediIconButton(
            icon: Icon(isPlaying ? FediIcons.pause : FediIcons.play),
            // ignore: no-magic-number
            iconSize: 16.0,
            color: IFediUiColorTheme.of(context).white,
            onPressed: onPressed,
          ),
          asyncButtonAction: () async {
            await mediaPlayerBloc.togglePlay();
          },
        );
      },
    );
  }
}

class _FediAudioPlayerControlsPausePlayButtonLoadingWidget
    extends StatelessWidget {
  const _FediAudioPlayerControlsPausePlayButtonLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalBigPadding,
        child: FediCircularProgressIndicator(
          color: IFediUiColorTheme.of(context).white,
          // ignore: no-magic-number
          size: 22.0,
        ),
      );
}

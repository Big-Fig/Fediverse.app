import 'package:fedi_app/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPlayerControlToggleMuteButtonWidget extends StatelessWidget {
  const FediPlayerControlToggleMuteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isInitializedStream,
      builder: (context, snapshot) {
        var isInitialized = snapshot.data ?? false;

        if (isInitialized) {
          return const _FediPlayerControlToggleMuteButtonInitializedWidget();
        } else {
          return const _FediPlayerControlToggleMuteButtonNotInitializedWidget();
        }
      },
    );
  }
}

class _FediPlayerControlToggleMuteButtonInitializedWidget
    extends StatelessWidget {
  const _FediPlayerControlToggleMuteButtonInitializedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isMutedStream,
      builder: (context, snapshot) {
        var isMuted = snapshot.data ?? false;

        return AsyncOperationButtonBuilderWidget<void>(
          builder: (BuildContext context, void Function()? onPressed) =>
              FediIconButton(
            icon: Icon(isMuted ? FediIcons.sound_off : FediIcons.sound_on),
            color: IFediUiColorTheme.of(context).white,
            // ignore: no-magic-number
            iconSize: 16.0,
            onPressed: onPressed,
          ),
          asyncButtonAction: () => mediaPlayerBloc.toggleMute(),
        );
      },
    );
  }
}

class _FediPlayerControlToggleMuteButtonNotInitializedWidget
    extends StatelessWidget {
  const _FediPlayerControlToggleMuteButtonNotInitializedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: const Icon(FediIcons.sound_on),
        color: IFediUiColorTheme.of(context).grey,
        // todo: refactor
        // ignore: no-magic-number
        iconSize: 16.0,
        onPressed: null,
      );
}

import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/media/player/audio/fedi_audio_player_controls_pause_play_button_widget.dart';
import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_panel_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediAudioPlayerWidget extends StatelessWidget {
  const FediAudioPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: IFediUiColorTheme.of(context).darkGrey,
        child: Stack(
          children: [
            Row(
              children: const [
                FediAudioPlayerControlsPausePlayButtonWidget(),
                Expanded(
                  child: FediPlayerControlPanelWidget(),
                ),
              ],
            ),
            const _FediAudioPlayerErrorWidget(),
          ],
        ),
      );

  Widget buildErrorWidget(IMediaPlayerBloc mediaPlayerBloc) =>
      const _FediAudioPlayerErrorWidget();
}

class _FediAudioPlayerErrorWidget extends StatelessWidget {
  const _FediAudioPlayerErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
      stream: mediaPlayerBloc.isHaveErrorStream,
      builder: (context, snapshot) {
        var isHaveError = snapshot.data ?? false;
        if (isHaveError) {
          return Positioned.fill(
            child: Container(
              // ignore: no-magic-number
              color: IFediUiColorTheme.of(context).error.withOpacity(0.8),
              child: const Padding(
                padding: FediPadding.horizontalBigPadding,
                child: _FediAudioPlayerErrorBodyWidget(),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _FediAudioPlayerErrorBodyWidget extends StatelessWidget {
  const _FediAudioPlayerErrorBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _FediAudioPlayerErrorReloadButtonWidget(),
          _FediAudioPlayerErrorBodyContentWidget(),
          _FediAudioPlayerShowErrorButtonWidget(),
        ],
      );
}

class _FediAudioPlayerErrorBodyContentWidget extends StatelessWidget {
  const _FediAudioPlayerErrorBodyContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          S.of(context).app_media_player_error_desc,
          style: IFediUiTextTheme.of(context).bigShortBoldWhite,
        ),
      );
}

class _FediAudioPlayerShowErrorButtonWidget extends StatelessWidget {
  const _FediAudioPlayerShowErrorButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: const Icon(FediIcons.warning),
        color: IFediUiColorTheme.of(context).white,
        onPressed: () {
          var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);
          IToastService.of(context, listen: false).showErrorToast(
            context: context,
            title: mediaPlayerBloc.error.toString(),
            content: null,
          );
        },
      );
}

class _FediAudioPlayerErrorReloadButtonWidget extends StatelessWidget {
  const _FediAudioPlayerErrorReloadButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: const Icon(FediIcons.refresh),
        color: IFediUiColorTheme.of(context).white,
        onPressed: () {
          var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);
          // ignore: cascade_invocations
          mediaPlayerBloc.reloadAfterError();
        },
      );
}

import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/media/player/audio/fedi_audio_player_controls_pause_play_button_widget.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_panel_widget.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediAudioPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);
    return Container(
      color: IFediUiColorTheme.of(context).darkGrey,
      child: Stack(
        children: [
          Row(
            children: [
              FediAudioPlayerControlsPausePlayButtonWidget(),
              Expanded(
                child: FediPlayerControlPanelWidget(),
              ),
            ],
          ),
          buildErrorWidget(mediaPlayerBloc)
        ],
      ),
    );
  }

  Widget buildErrorWidget(IMediaPlayerBloc mediaPlayerBloc) =>
      StreamBuilder<bool>(
          stream: mediaPlayerBloc.isHaveErrorStream,
          initialData: mediaPlayerBloc.isHaveError,
          builder: (context, snapshot) {
            var isHaveError = snapshot.data;
            if (isHaveError) {
              return Positioned.fill(
                child: Container(
                  color: IFediUiColorTheme.of(context).error.withOpacity(0.8),
                  child: Padding(
                    padding: FediPadding.horizontalBigPadding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FediIconButton(

                          icon: Icon(FediIcons.reload),
                          color: IFediUiColorTheme.of(context).white,
                          onPressed: () {
                            mediaPlayerBloc.reloadAfterError();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            S.of(context).app_media_player_error_desc,
                            style: IFediUiTextTheme.of(context).bigShortBoldWhite,
                          ),
                        ),
                        FediIconButton(

                          icon: Icon(FediIcons.warning),
                          color: IFediUiColorTheme.of(context).white,
                          onPressed: () {
                            showErrorFediNotificationOverlay(
                              context: context,
                              contentText: mediaPlayerBloc.error.toString(),
                              titleText: null,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          });
}

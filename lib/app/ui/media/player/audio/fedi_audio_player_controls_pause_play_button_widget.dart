import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';

class FediAudioPlayerControlsPausePlayButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isInitializingStream,
        initialData: mediaPlayerBloc.isInitializing,
        builder: (context, snapshot) {
          var isInitializing = snapshot.data;

          if (isInitializing) {
            return buildLoading();
          } else {
            return StreamBuilder<bool>(
                stream: mediaPlayerBloc.isPlayingStream,
                initialData: mediaPlayerBloc.isPlaying,
                builder: (context, snapshot) {
                  var isPlaying = snapshot.data;
                  return AsyncOperationButtonBuilderWidget(
                    showProgressDialog: false,
                    builder: (BuildContext context, void Function() onPressed) {
                      return FediIconButton(
                        icon:
                            Icon(isPlaying ? FediIcons.pause : FediIcons.play),
                        color: FediColors.white,
                        onPressed: onPressed,
                      );
                    },
                    asyncButtonAction: () async {
                      await mediaPlayerBloc.togglePlay();
                    },
                  );
                });
          }
        });
  }

  Widget buildLoading() {
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: FediCircularProgressIndicator(
        color: FediColors.white,
        size: 22.0,
      ),
    );
  }
}

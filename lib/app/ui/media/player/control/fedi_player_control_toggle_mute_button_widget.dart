import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPlayerControlToggleMuteButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isInitializedStream,
        initialData: mediaPlayerBloc.isInitialized,
        builder: (context, snapshot) {
          var isInitialized = snapshot.data;

          if (isInitialized) {
            return StreamBuilder<bool>(
                stream: mediaPlayerBloc.isMutedStream,
                initialData: mediaPlayerBloc.isMuted,
                builder: (context, snapshot) {
                  var isMuted = snapshot.data;

                  return AsyncOperationButtonBuilderWidget(
                    builder: (BuildContext context, void Function() onPressed) {
                      return FediIconButton(
                        icon: Icon(
                            isMuted ? FediIcons.sound_off : FediIcons.sound_on),
                        color: FediColors.white,
                        iconSize: 16.0,
                        onPressed: onPressed,
                      );
                    },
                    asyncButtonAction: () => mediaPlayerBloc.toggleMute(),
                  );
                });
          } else {
            return FediIconButton(
              icon: Icon(FediIcons.sound_on),
              color: FediColors.grey,
              iconSize: 16.0,
              onPressed: () {},
            );
          }
        });
  }
}

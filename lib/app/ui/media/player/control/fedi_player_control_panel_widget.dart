import 'package:fedi/app/ui/media/player/control/fedi_player_control_length_duration_widget.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_position_duration_widget.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_progress_widget.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_toggle_mute_button_widget.dart';
import 'package:flutter/cupertino.dart';

class FediPlayerControlPanelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: const [
          FediPlayerControlPositionDurationWidget(),
          Expanded(
            child: FediPlayerControlProgressWidget(),
          ),
          FediPlayerControlLengthDurationWidget(),
          FediPlayerControlToggleMuteButtonWidget(),
        ],
      );

  const FediPlayerControlPanelWidget();
}

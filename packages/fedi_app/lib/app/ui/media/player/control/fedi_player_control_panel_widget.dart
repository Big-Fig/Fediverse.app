import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_length_duration_widget.dart';
import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_position_duration_widget.dart';
import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_progress_widget.dart';
import 'package:fedi_app/app/ui/media/player/control/fedi_player_control_toggle_mute_button_widget.dart';
import 'package:flutter/cupertino.dart';

class FediPlayerControlPanelWidget extends StatelessWidget {
  const FediPlayerControlPanelWidget({Key? key}) : super(key: key);

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
}

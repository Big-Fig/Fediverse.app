import 'package:fedi/app/chat/selection/action/chat_selection_action_list_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class ChatSelectionWidget extends StatelessWidget {
  const ChatSelectionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: FediPadding.horizontalBigPadding,
          child: const ChatSelectionActionListWidget(),
        ),
        const FediUltraLightGreyDivider(),
      ],
    );
  }
}

import 'package:fedi_app/app/chat/selection/action/chat_selection_action_list_widget.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class ChatSelectionWidget extends StatelessWidget {
  const ChatSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: FediPadding.horizontalBigPadding,
            child: ChatSelectionActionListWidget(),
          ),
          FediUltraLightGreyDivider(),
        ],
      );
}

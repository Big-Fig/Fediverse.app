import 'package:fedi/app/ui/list/fedi_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ConversationListTapToLoadOverlayWidget extends StatelessWidget {
  const ConversationListTapToLoadOverlayWidget();

  @override
  Widget build(BuildContext context) => FediListTapToLoadOverlayWidget(
        textBuilder: (context, updateItemsCount) => S
            .of(context)
            .app_conversation_list_newItems_action_tapToLoadNew(
                updateItemsCount),
      );
}

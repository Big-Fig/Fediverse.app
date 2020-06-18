import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/list/fedi_list_tap_to_load_overlay_widget.dart';
import 'package:flutter/cupertino.dart';

class ConversationListTapToLoadOverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FediListTapToLoadOverlayWidget(
      textBuilder: (context, updateItemsCount) => plural(
          "app.conversation.list.new_items.action.tap_to_load_new",
          updateItemsCount),
    );
}

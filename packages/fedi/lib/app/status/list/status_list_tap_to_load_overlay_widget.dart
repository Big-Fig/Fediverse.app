import 'package:fedi/app/ui/list/fedi_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class StatusListTapToLoadOverlayWidget extends StatelessWidget {
  const StatusListTapToLoadOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FediListTapToLoadOverlayWidget(
        textBuilder: (context, updateItemsCount) => S
            .of(context)
            .app_status_list_newItems_action_tapToLoadNew(updateItemsCount),
      );
}

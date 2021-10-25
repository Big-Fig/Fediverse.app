import 'package:fedi_app/app/ui/list/fedi_list_tap_to_load_overlay_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class NotificationListTapToLoadOverlayWidget extends StatelessWidget {
  const NotificationListTapToLoadOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FediListTapToLoadOverlayWidget(
        textBuilder: (context, updateItemsCount) =>
            S.of(context).app_notification_list_newItems_action_tapToLoadNew(
                  updateItemsCount,
                ),
      );
}

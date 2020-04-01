import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_list_item_timeline_widget.dart");

class NotificationListItemWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    _logger.finest(() => "build ${notificationBloc.remoteId}");

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
//            buildMainContentWidget(context, notificationBloc),
//            if (showEmojiPicker)
//              NotificationEmojiReactionPickerWidget(
//                emojiReactionSelectedCallback:
//                    (String emojiName, String emoji) {
//                  setState(() {
//                    showEmojiPicker = !showEmojiPicker;
//                  });
//                  notificationBloc.requestToggleEmojiReaction(emoji: emoji);
//                },
//              ),
          ],
        ),
      ),
    );
  }

}


import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/date_time/date_time_dynamic_time_ago_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationCreatedAtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: false);

    return StreamBuilder<DateTime>(
        stream: notificationBloc.createdAtStream,
        initialData: notificationBloc.createdAt,
        builder: (context, snapshot) {
          var createdAt = snapshot.data;

          return DateTimeDynamicTimeAgoWidget(
            dateTime: createdAt,
            textStyle: FediTextStyles.smallShortGrey,
          );
        });
  }
}

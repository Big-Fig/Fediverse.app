import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationCreatedAtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: false);

    return InitialDataStreamBuilder<DateTime>(
        stream: notificationBloc.createdAtStream,
        initialData: notificationBloc.createdAt,
        builder: (context, snapshot) {
          var createdAt = snapshot.data;

          return Text(
            timeago.format(createdAt, locale: 'en_short'),
          );
        });
  }

}

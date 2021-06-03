import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/date_time/date_time_dynamic_time_ago_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationCreatedAtWidget extends StatelessWidget {
  final TextStyle? textStyle;

  NotificationCreatedAtWidget({
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).smallShortGrey;

    var notificationBloc = INotificationBloc.of(context);

    return StreamBuilder<DateTime?>(
      stream: notificationBloc.createdAtStream,
      initialData: notificationBloc.createdAt,
      builder: (context, snapshot) {
        var createdAt = snapshot.data;

        return DateTimeDynamicTimeAgoWidget(
          dateTime: createdAt,
          textStyle: textStyle,
        );
      },
    );
  }
}

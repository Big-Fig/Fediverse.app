import 'package:fedi_app/app/notification/notification_bloc.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/date_time/timeago/date_time_dynamic_timeago_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationCreatedAtWidget extends StatelessWidget {
  final TextStyle? textStyle;

  const NotificationCreatedAtWidget({
    Key? key,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).smallShortGrey;

    var notificationBloc = INotificationBloc.of(context);

    return StreamBuilder<DateTime>(
      stream: notificationBloc.createdAtStream,
      initialData: notificationBloc.createdAt,
      builder: (context, snapshot) {
        var createdAt = snapshot.data!;

        return DateTimeDynamicTimeagoWidget(
          dateTime: createdAt,
          textStyle: textStyle,
        );
      },
    );
  }
}

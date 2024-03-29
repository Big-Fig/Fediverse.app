import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/date_time/timeago/date_time_dynamic_timeago_widget.dart';
import 'package:flutter/cupertino.dart';

class StatusCreatedAtWidget extends StatelessWidget {
  const StatusCreatedAtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<DateTime?>(
      stream: statusBloc.createdAtStream,
      initialData: statusBloc.createdAt,
      builder: (context, snapshot) {
        var createdAt = snapshot.data!;

        return DateTimeDynamicTimeagoWidget(
          dateTime: createdAt,
          textStyle: IFediUiTextTheme.of(context).smallShortGrey,
        );
      },
    );
  }
}

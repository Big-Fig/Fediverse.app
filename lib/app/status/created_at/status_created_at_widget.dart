import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/date_time/date_time_dynamic_time_ago_widget.dart';
import 'package:flutter/cupertino.dart';

class StatusCreatedAtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return StreamBuilder<DateTime>(
        stream: statusBloc.createdAtStream,
        initialData: statusBloc.createdAt,
        builder: (context, snapshot) {
          var createdAt = snapshot.data;

          return DateTimeDynamicTimeAgoWidget(
            dateTime: createdAt,
            textStyle: FediTextStyles.smallShortGrey,
          );
        });
  }

  const StatusCreatedAtWidget();
}

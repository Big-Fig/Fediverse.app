import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class StatusCreatedAtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return StreamBuilder<DateTime>(
        stream: statusBloc.createdAtStream,
        initialData: statusBloc.createdAt,
        builder: (context, snapshot) {
          var createdAt = snapshot.data;

          // todo: locale
          return Text(
            timeago.format(createdAt, locale: 'en_short'),
            style: TextStyle(fontSize: 12, color: FediColors.grey),
          );
        });
  }

  const StatusCreatedAtWidget();
}

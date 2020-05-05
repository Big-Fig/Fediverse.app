import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusBloc implements Disposable {
  static IScheduledStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IScheduledStatusBloc>(context, listen: listen);

  IScheduledStatus get scheduledStatus;

  Stream<IScheduledStatus> get scheduledStatusStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  Future reSchedule({@required DateTime scheduledAt});

  Future cancelSchedule();
}

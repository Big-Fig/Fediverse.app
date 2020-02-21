import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';

abstract class StatusWidget extends StatelessWidget {
  final IStatus initialStatusData;

  StatusWidget({@required this.initialStatusData});

  @override
  Widget build(BuildContext context) {
    var statusRepository = IStatusRepository.of(context, listen: true);

    return StreamBuilder<IStatus>(
        stream: statusRepository.watchById(initialStatusData.localId),
        initialData: initialStatusData,
        builder: (context, snapshot) {
          var status = snapshot.data;

          return buildStatusWidget(context, status);
        });
  }

  Widget buildStatusWidget(BuildContext context, IStatus status);
}

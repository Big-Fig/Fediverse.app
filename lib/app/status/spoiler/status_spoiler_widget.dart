import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: statusBloc.spoilerTextStream,
        initialData: statusBloc.spoilerText,
        builder: (context, snapshot) {
          var spoiler = snapshot.data;

          if (spoiler?.isNotEmpty == true) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(spoiler),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const StatusSpoilerWidget();
}

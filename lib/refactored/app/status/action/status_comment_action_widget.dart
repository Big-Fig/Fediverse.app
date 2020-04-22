import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCommentActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return Row(
      children: <Widget>[
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.comment),
          tooltip: AppLocalizations.of(context).tr("app.status.action.comment"),
          onPressed: () {
            goToStatusThreadPage(context, statusBloc.status);
          },
        ),
        StreamBuilder<int>(
            stream: statusBloc.repliesCountStream,
            initialData: statusBloc.repliesCount,
            builder: (context, snapshot) {
              var repliesCount = snapshot.data;
              if (repliesCount == null) {
                return SizedBox.shrink();
              }
              return Text(repliesCount.toString());
            })
      ],
    );
  }
}

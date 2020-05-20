import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCommentActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return Row(
      children: <Widget>[
        IconButton(
          color: FediColors.darkGrey,
          iconSize: 20.0,
          icon: Icon(FediIcons.message),
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
              return Text(
                repliesCount.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: FediColors.darkGrey,
                ),
              );
            })
      ],
    );
  }

  const StatusCommentActionWidget();
}

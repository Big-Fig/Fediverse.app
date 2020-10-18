import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCommentActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return Row(
      children: <Widget>[
        FediIconButton(
          color: IFediUiColorTheme.of(context).darkGrey,
          iconSize: FediSizes.bigIconSize,
          icon: Icon(FediIcons.message),
          tooltip: tr("app.status.action.comment"),
          onPressed: () {
            goToStatusThreadPage(
              context,
              status: statusBloc.status,
              initialMediaAttachment: null,
            );
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

              return StatusActionCounterWidget(
                value: repliesCount,
                onPressed: () {
                  goToStatusThreadPage(
                    context,
                    status: statusBloc.status,
                    initialMediaAttachment: null,
                  );
                },
              );
            })
      ],
    );
  }

  const StatusCommentActionWidget();
}

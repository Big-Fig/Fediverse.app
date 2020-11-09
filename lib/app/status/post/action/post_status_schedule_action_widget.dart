import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/schedule/post_status_schedule_dialog.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusScheduleActionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc.isScheduledStream,
        initialData: postStatusBloc.isScheduled,
        builder: (context, snapshot) {
          var isScheduled = snapshot.data;

          Null Function() onPressed;
          onPressed = () {
            showPostStatusScheduleDialog(context, postStatusBloc);
          };

          return FediIconButton(
            icon: Icon(
              FediIcons.schedule,
              color:
                  isScheduled ? IFediUiColorTheme.of(context).primary : IFediUiColorTheme.of(context).darkGrey,
            ),
            onPressed: onPressed,
          );
        });
  }

  const PostStatusScheduleActionWidget();
}

import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/ui/badge/fedi_stream_bool_badge_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPollActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<PostMessageSelectedAction>(
        stream: postMessageBloc.selectedActionStream,
        initialData: postMessageBloc.selectedAction,
        builder: (context, snapshot) {
          var selectedAction = snapshot.data;

          var button = FediIconButton(
            icon: Icon(
              Icons.poll,
              color: selectedAction == PostMessageSelectedAction.poll
                  ? FediColors.primary
                  : FediColors.darkGrey,
            ),
            onPressed: () {
              postMessageBloc.togglePollActionSelection();
            },
          );
          var postStatusPollBloc =
              IPostStatusPollBloc.of(context, listen: false);

          return StreamBuilder<bool>(
              stream: postStatusPollBloc.isSomethingChangedStream,
              initialData: postStatusPollBloc.isSomethingChanged,
              builder: (context, snapshot) {
                var isSomethingChanged = snapshot.data;
                if (isSomethingChanged) {
                  return FediStreamBoolBadgeWidget(
                    offset: 8.0,
                    stream: postStatusPollBloc
                        .pollOptionsGroupBloc.itemsStream
                        .map((items) => items?.isNotEmpty == true),
                    child: button,
                  );
                } else {
                  return button;
                }
              });
        });
  }
}

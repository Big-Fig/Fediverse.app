import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
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
          return FediIconButton(
            icon: Icon(
              Icons.poll,
              color: selectedAction == PostMessageSelectedAction.poll
                  ? FediColors.primaryColor
                  : FediColors.darkGrey,
            ),
            onPressed: () {
              postMessageBloc.togglePollActionSelection();
            },
          );
        });
  }
}

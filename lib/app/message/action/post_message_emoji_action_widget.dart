import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageEmojiActionWidget extends StatelessWidget {
  const PostMessageEmojiActionWidget();

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<PostMessageSelectedAction?>(
      stream: postMessageBloc.selectedActionStream,
      initialData: postMessageBloc.selectedAction,
      builder: (context, snapshot) {
        var selectedAction = snapshot.data;
        return FediIconButton(
          icon: Icon(
            FediIcons.emoji,
            color: selectedAction == PostMessageSelectedAction.emoji
                ? IFediUiColorTheme.of(context).primary
                : IFediUiColorTheme.of(context).darkGrey,
          ),
          onPressed: () {
            postMessageBloc.toggleEmojiActionSelection();
          },
        );
      },
    );
  }
}

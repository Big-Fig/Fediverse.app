import 'package:fedi_app/app/message/post_message_bloc.dart';
import 'package:fedi_app/app/message/post_message_model.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageAttachActionWidget extends StatelessWidget {
  const PostMessageAttachActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<bool>(
      stream: postMessageBloc
          .uploadMediaAttachmentsBloc.isPossibleToAttachMediaStream,
      initialData:
          postMessageBloc.uploadMediaAttachmentsBloc.isPossibleToAttachMedia,
      builder: (context, snapshot) {
        var isPossibleToAttach = snapshot.data!;

        Future<void> Function()? onPressed;
        if (isPossibleToAttach) {
          onPressed = () async {
            postMessageBloc.toggleAttachActionSelection();
          };
        }

        return StreamBuilder<PostMessageSelectedAction?>(
          stream: postMessageBloc.selectedActionStream,
          initialData: postMessageBloc.selectedAction,
          builder: (context, snapshot) {
            var selectedAction = snapshot.data;

            return FediIconButton(
              icon: Icon(
                FediIcons.plus,
                color: isPossibleToAttach
                    ? selectedAction == PostMessageSelectedAction.attach
                        ? IFediUiColorTheme.of(context).primary
                        : IFediUiColorTheme.of(context).darkGrey
                    : IFediUiColorTheme.of(context).lightGrey,
              ),
              onPressed: onPressed,
            );
          },
        );
      },
    );
  }
}

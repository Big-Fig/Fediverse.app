import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageAttachActionWidget extends StatelessWidget {
  PostMessageAttachActionWidget();

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream:
            postMessageBloc.mediaAttachmentsBloc.isPossibleToAttachMediaStream,
        initialData:
            postMessageBloc.mediaAttachmentsBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          var onPressed;
          if (isPossibleToAttach) {
            onPressed = () async {
              postMessageBloc.toggleAttachActionSelection();
            };
          }

          return StreamBuilder<PostMessageSelectedAction>(
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
              });
        });
  }
}

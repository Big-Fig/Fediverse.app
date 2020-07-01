import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusAttachActionWidget extends StatelessWidget {
  PostStatusAttachActionWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc
            .mediaAttachmentsBloc.isPossibleToAttachMediaStream,
        initialData:
            postStatusBloc.mediaAttachmentsBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          var onPressed;
          if (isPossibleToAttach) {
            onPressed = () async {
              postStatusBloc.toggleAttachActionSelection();
            };
          }

          return IconButton(
            icon: Icon(
              FediIcons.plus,
              color: isPossibleToAttach
                  ? FediColors.darkGrey
                  : FediColors.lightGrey,
            ),
            onPressed: onPressed,
          );
        });
  }
}

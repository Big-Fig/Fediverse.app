import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_camera_image_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_camera_video_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_media_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_post_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/refactored/app/status/post/mentions/post_status_mentions_widget.dart';
import 'package:fedi/refactored/app/status/post/message/message_post_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          PostStatusMentionsWidget(),
          Flexible(
              child: MessagePostStatusWidget(
            expanded: true,
          )),
          UploadMediaAttachmentGridWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PostStatusMentionActionWidget(),
                  PostStatusVisibilityActionWidget(),
                  PostStatusAttachCameraVideoActionWidget(),
                  PostStatusAttachCameraImageActionWidget(),
                  PostStatusAttachMediaActionWidget(),
                ],
              ),
              PostStatusPostActionWidget(successCallback: (status) {
                Navigator.of(context).pop();
              })
            ],
          )
        ],
      ),
    );
  }
}

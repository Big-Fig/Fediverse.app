import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_media_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_post_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/refactored/app/status/post/mentions/post_status_mentions_widget.dart';
import 'package:fedi/refactored/app/status/post/message/message_post_status_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadPostStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PostStatusMentionsWidget(),
          Flexible(
              child: MessagePostStatusWidget(
            expanded: false,
          )),
          ProxyProvider<IPostStatusBloc, IUploadMediaAttachmentGridBloc>(
              update: (context, value, previous) =>
              value.mediaAttachmentGridBloc,
              child: UploadMediaAttachmentGridWidget()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PostStatusMentionActionWidget(),
                  PostStatusAttachMediaActionWidget(),
                  PostStatusNsfwActionWidget(),
                  PostStatusScheduleActionWidget()
                ],
              ),
              PostStatusPostActionWidget(successCallback: (context) {
                // nothing
              })
            ],
          )
        ],
      ),
    );
  }
}

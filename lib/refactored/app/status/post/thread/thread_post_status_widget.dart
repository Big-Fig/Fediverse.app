import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_camera_image_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_camera_video_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_media_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_post_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_widget.dart';
import 'package:fedi/refactored/app/status/post/mentions/post_status_mentions_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThreadPostStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PostStatusMentionsWidget(),
          Flexible(child: buildTextField(context, postStatusBloc)),
          UploadMediaAttachmentGridWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PostStatusMentionActionWidget(),
                  PostStatusAttachCameraVideoActionWidget(),
                  PostStatusAttachCameraImageActionWidget(),
                  PostStatusAttachMediaActionWidget(),
                ],
              ),
              PostStatusPostActionWidget(successCallback: (status) {
                // nothing
              })
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context, IPostStatusBloc postStatusBloc) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(),
        ),
        labelText: AppLocalizations.of(context)
            .tr("timeline.status.details.action.reply"),
      ),
      autofocus: false,
      controller: postStatusBloc.inputTextController,
      maxLines: null,
      minLines: null,
      expands: false,
    );
  }
}

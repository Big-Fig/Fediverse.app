import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/status/post/action/post_status_attach_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_text_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/app/status/post/attach/post_status_attach_widget.dart';
import 'package:fedi/app/status/post/input/post_status_compose_input_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostStatusComposeWidget extends StatelessWidget {
  final bool expanded;
  final bool goBackOnSuccess;
  final bool displayAccountAvatar;
  final int maxLines;
  final String hintText;

  const PostStatusComposeWidget({
    @required this.expanded,
    @required this.displayAccountAvatar,
    @required this.maxLines,
    this.hintText,
    @required this.goBackOnSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), //child: ListView(
//  shrinkWrap: true,
      child: Column(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          displayAccountAvatar
              ? Row(
                  children: <Widget>[buildAvatar(), buildInputWidget()],
                )
              : buildInputWidget(),
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ProxyProvider<IPostStatusBloc,
                    IUploadMediaAttachmentsCollectionBloc>(
                update: (context, value, previous) =>
                    value.mediaAttachmentsBloc,
                child: UploadMediaAttachmentsWidget()),
          ),
          if (!displayAccountAvatar && expanded) FediLightGreyDivider(),
          buildActions(),
          PostStatusAttachWidget()
        ],
      ),
    );
  }

  Widget buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    PostStatusAttachActionWidget(),
                    PostStatusVisibilityActionWidget(),
                    PostStatusScheduleActionWidget(),
                    PostStatusMentionActionWidget(),
                    PostStatusNsfwActionWidget(),
                  ],
                ),
              ),
            ),
          ),
          PostStatusPostTextActionWidget(successCallback: (context) {
            if (goBackOnSuccess) {
              Navigator.of(context).pop();
            }
          })
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyAccountAvatarWidget(
        imageSize: 48,
        progressSize: 48,
      ),
    );
  }

  Widget buildInputWidget() => Flexible(
        child: PostStatusComposeInputWidget(
          expanded: expanded,
          hintText: hintText,
          maxLines: maxLines,
        ),
      );
}

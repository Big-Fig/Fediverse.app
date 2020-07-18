import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/post_message_attach_widget.dart';
import 'package:fedi/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_text_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/app/status/post/input/post_status_compose_input_widget.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeWidget extends StatelessWidget {
  final bool expanded;
  final bool goBackOnSuccess;
  final bool displayAccountAvatar;
  final int maxLines;
  final String hintText;
  final bool showPostAction;

  const PostStatusComposeWidget({
    @required this.expanded,
    @required this.displayAccountAvatar,
    @required this.maxLines,
    @required this.showPostAction,
    this.hintText,
    @required this.goBackOnSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding, //child: ListView(
//  shrinkWrap: true,
      child: Column(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          displayAccountAvatar
              ? Row(
                  children: <Widget>[
                    buildAvatar(),
                    Flexible(
                      child: PostStatusComposeInputWidget(
                        expanded: expanded,
                        hintText: hintText,
                        maxLines: maxLines,
                      ),
                    )
                  ],
                )
              : Expanded(
                  child: PostStatusComposeInputWidget(
                    expanded: false,
                    hintText: hintText,
                    maxLines: maxLines,
                  ),
                ),
//          const FediBigVerticalSpacer(),
          UploadMediaAttachmentsWidget(
            scrollable: false,
            heightOnKeyboardOpen: null,
          ),
          if (!displayAccountAvatar && expanded) FediLightGreyDivider(),
          buildActions(),
          PostMessageAttachWidget()
        ],
      ),
    );
  }

  Widget buildActions() {
    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              height: 35,
              child: Padding(
                padding: FediPadding.horizontalSmallPadding,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    PostMessageAttachActionWidget(),
                    PostStatusVisibilityActionWidget(),
                    PostStatusScheduleActionWidget(),
                    PostStatusMentionActionWidget(),
                    PostStatusNsfwActionWidget(),
                  ],
                ),
              ),
            ),
          ),
          if (showPostAction)
            PostStatusPostTextActionWidget(successCallback: (context) {
              if (goBackOnSuccess) {
                Navigator.of(context).pop();
              }
            }),
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: MyAccountAvatarWidget(
        imageSize: FediSizes.accountAvatarBigSize,
        progressSize: FediSizes.accountAvatarProgressBigSize,
      ),
    );
  }
}

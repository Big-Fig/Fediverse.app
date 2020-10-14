import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_selected_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_poll_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_text_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/app/status/post/input/post_status_compose_input_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeWidget extends StatelessWidget {
  final bool expanded;
  final bool displaySubjectField;
  final bool goBackOnSuccess;
  final bool displayAccountAvatar;
  final int maxLines;
  final String hintText;
  final bool showPostAction;
  final bool autofocus;

  const PostStatusComposeWidget({
    @required this.displaySubjectField,
    @required this.expanded,
    @required this.displayAccountAvatar,
    @required this.maxLines,
    @required this.showPostAction,
    this.hintText,
    @required this.goBackOnSuccess,
    @required this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    return Padding(
      padding: FediPadding.allSmallPadding, //child: ListView(
//  shrinkWrap: true,
      child: Column(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          if (displaySubjectField) ...[
            FediTransparentEditTextField(
              textEditingController: postStatusBloc.subjectTextController,
              focusNode: postStatusBloc.subjectFocusNode,
              hintText: tr("app.status.post.field.subject.hint"),
              expanded: false,
              autofocus: false,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (String value) async {
                postStatusBloc.subjectFocusNode.requestFocus();
                postStatusBloc.inputFocusNode.requestFocus();
              },
              errorText: null,
              highlightMentions: true,
              maxLength: null,
            ),
            FediUltraLightGreyDivider(),
          ],
          displayAccountAvatar
              ? Row(
                  children: <Widget>[
                    buildAvatar(),
                    Flexible(
                      child: PostStatusComposeInputWidget(
                        autofocus: autofocus,
                        expanded: expanded,
                        hintText: hintText,
                        maxLines: maxLines,
                      ),
                    )
                  ],
                )
              : Expanded(
                  child: PostStatusComposeInputWidget(
                    autofocus: autofocus,
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
          if (!displayAccountAvatar && expanded)
            FediLightGreyDivider(),
          buildActions(context),
          PostMessageSelectedActionWidget()
        ],
      ),
    );
  }

  Widget buildActions(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);
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
                    StreamBuilder<String>(
                        stream: postMessageBloc.inputTextStream,
                        initialData: postMessageBloc.inputText,
                        builder: (context, snapshot) {
                          var inputText = snapshot.data;
                          if (inputText?.trim()?.isNotEmpty == true) {
                            return PostMessageEmojiActionWidget();
                          } else {
                            return PostMessageAttachActionWidget();
                          }
                        }),
                    PostStatusVisibilityActionWidget(),
                    PostStatusScheduleActionWidget(),
                    PostStatusMentionActionWidget(),
                    PostStatusNsfwActionWidget(),
                    PostStatusPollActionWidget()
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

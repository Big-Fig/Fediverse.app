import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_all_widget.dart';
import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi/app/message/post_message_selected_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_expire_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_poll_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_icon_in_circle_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/app/status/post/input/post_status_compose_input_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeWidget extends StatelessWidget {
  final bool expanded;
  final bool displaySubjectField;
  final bool goBackOnSuccess;
  final bool displayAccountAvatar;
  final int? maxLines;
  final String? hintText;
  final bool showPostAction;
  final bool autofocus;

  const PostStatusComposeWidget({
    Key? key,
    required this.displaySubjectField,
    required this.expanded,
    required this.displayAccountAvatar,
    required this.maxLines,
    required this.showPostAction,
    this.hintText,
    required this.goBackOnSuccess,
    required this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Column(
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          children: <Widget>[
            if (displaySubjectField) ...[
              const _PostStatusComposeSubjectFieldWidget(),
              const FediUltraLightGreyDivider(),
            ],
            if (displayAccountAvatar)
              _PostStatusComposeInputWithAvatarWidget(
                autofocus: autofocus,
                expanded: expanded,
                hintText: hintText,
                maxLines: maxLines,
              )
            else
              Expanded(
                child: PostStatusComposeInputWidget(
                  autofocus: autofocus,
                  expanded: false,
                  hintText: hintText,
                  maxLines: maxLines,
                ),
              ),
//          const FediBigVerticalSpacer(),

            const UploadMediaAttachmentListAllWidget(
              scrollable: false,
              heightOnKeyboardOpen: null,
            ),
            if (!displayAccountAvatar && expanded) const FediLightGreyDivider(),
            _buildActions(showPostAction),
            const PostMessageSelectedActionWidget(),
          ],
        ),
      );

  Widget _buildActions(bool showPostAction) {
    if (showPostAction) {
      return const _PostStatusComposeActionsWidget(
        showPostAction: true,
      );
    } else {
      return const _PostStatusComposeActionsWidget(
        showPostAction: false,
      );
    }
  }
}

class _PostStatusComposeActionsWidget extends StatelessWidget {
  const _PostStatusComposeActionsWidget({
    Key? key,
    required this.showPostAction,
  }) : super(key: key);

  final bool showPostAction;

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SizedBox(
              // todo: refactor
              // ignore: no-magic-number
              height: 35,
              child: Padding(
                padding: FediPadding.horizontalSmallPadding,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    StreamBuilder<bool>(
                      stream: postStatusBloc.isAnyTextEnteredStream,
                      builder: (context, snapshot) {
                        var isAnyTextEntered = snapshot.data;
                        if (isAnyTextEntered == true) {
                          return const PostMessageEmojiActionWidget();
                        } else {
                          return const PostMessageAttachActionWidget();
                        }
                      },
                    ),
                    const PostStatusVisibilityActionWidget(),
                    const PostStatusScheduleActionWidget(),
                    const PostStatusMentionActionWidget(),
                    const PostStatusNsfwActionWidget(),
                    const PostStatusPollActionWidget(),
                    if (postStatusBloc.isExpirePossible)
                      const PostStatusExpireActionWidget(),
                  ],
                ),
              ),
            ),
          ),
          if (showPostAction)
            const Padding(
              padding: FediPadding.horizontalSmallPadding,
              child: PostStatusPostIconInCircleActionWidget(),
            ),
        ],
      ),
    );
  }
}

class _PostStatusComposeInputWithAvatarWidget extends StatelessWidget {
  const _PostStatusComposeInputWithAvatarWidget({
    Key? key,
    required this.autofocus,
    required this.expanded,
    required this.hintText,
    required this.maxLines,
  }) : super(key: key);

  final bool autofocus;
  final bool expanded;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: FediPadding.allSmallPadding,
            child: MyAccountAvatarWidget(
              imageSize: FediSizes.accountAvatarBigSize,
              progressSize: FediSizes.accountAvatarProgressBigSize,
            ),
          ),
          Flexible(
            child: PostStatusComposeInputWidget(
              autofocus: autofocus,
              expanded: expanded,
              hintText: hintText,
              maxLines: maxLines,
            ),
          ),
        ],
      );
}

class _PostStatusComposeSubjectFieldWidget extends StatelessWidget {
  const _PostStatusComposeSubjectFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

    return FediTransparentEditTextField(
      textEditingController: postStatusBloc.subjectTextController,
      focusNode: postStatusBloc.subjectFocusNode,
      hintText: S.of(context).app_status_post_field_subject,
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
    );
  }
}

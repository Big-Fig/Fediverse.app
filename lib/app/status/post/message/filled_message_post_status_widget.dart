import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/post/action/post_status_attach_media_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_icon_action_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/edit/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilledMessagePostStatusWidget extends StatelessWidget {
  final bool expanded;
  final String hintText;
  final int maxLines;

  FilledMessagePostStatusWidget({
    @required this.expanded,
    @required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return Row(
      children: [
        PostStatusAttachMediaActionWidget(
          iconSize: FediSizes.filledEditTextIconSize,
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: FediFilledEditTextField(
            focusNode: postStatusBloc.focusNode,
            hintText: hintText ?? tr("app.status.post.field.message.hint"),
            textEditingController: postStatusBloc.inputTextController,
            expanded: expanded,
            autofocus: expanded,
            maxLines: maxLines,
            textInputAction: TextInputAction.send,
            onSubmitted: (String value) async {
              if (postStatusBloc.isReadyToPost) {
                await postStatusBloc.postStatus();
              } else {
                await SimpleAlertDialog(
                        context: context,
                        title: tr("app.status.post.error.empty.dialog.title"))
                    .show(context);
              }
            },
            ending: buildEmojiPicker(context, postStatusBloc),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        PostStatusPostTextActionWidget(),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  IconButton buildEmojiPicker(
      BuildContext context, IPostStatusBloc postStatusBloc) {
    return IconButton(
      icon: Icon(
        FediIcons.emoji,
        size: FediSizes.filledEditTextIconSize,
        color: FediColors.darkGrey,
      ),
      onPressed: () {
        showEmojiPickerModalPopup(context,
            emojiReactionSelectedCallback: (String emojiName, String emoji) {
          postStatusBloc.appendText("$emoji");
        });
      },
    );
  }
}

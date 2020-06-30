import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/post/action/chat_post_message_attach_media_action_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {
  const ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return FediFilledEditTextField(
      leading: const ChatPostMessageAttachMediaActionWidget(
        iconSize: FediSizes.filledEditTextIconSize,
      ),
      ending: buildEmojiPicker(context, chatPostMessageBloc),
      hintText: tr("app.chat.post.field.content.hint"),
      textEditingController: chatPostMessageBloc.inputTextController,
      expanded: false,
      autofocus: false,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (chatPostMessageBloc.isReadyToPost) {
          await chatPostMessageBloc.postMessage();
        } else {
          await SimpleAlertDialog(
                  context: context,
                  title: tr("app.chat.post.error.empty.dialog.title"))
              .show(context);
        }
      },
      maxLines: 1,
      errorText: null,
    );
  }

  IconButton buildEmojiPicker(
      BuildContext context, IChatPostMessageBloc chatPostMessageBloc) {
    return IconButton(
      icon: Icon(
        FediIcons.emoji,
        size: FediSizes.filledEditTextIconSize,
        color: FediColors.darkGrey,
      ),
      onPressed: () {
        showEmojiPickerModalPopup(context,
            emojiReactionSelectedCallback: (String emojiName, String emoji) {
          chatPostMessageBloc.appendText("$emoji");
        });
      },
    );
  }
}

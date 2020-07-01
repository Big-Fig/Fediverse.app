import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatPostMessageBloc = IChatPostMessageBloc.of(context, listen: false);

    return IconButton(
      icon: Icon(
        FediIcons.emoji,
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

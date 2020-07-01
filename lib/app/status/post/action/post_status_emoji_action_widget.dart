import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return IconButton(
      icon: Icon(
        FediIcons.emoji,
        color:
         FediColors.darkGrey,
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

import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return Row(children: [
      IconButton(
        color: FediColors.darkGrey,
        iconSize: 20.0,
        icon: Icon(FediIcons.emoji),
        onPressed: () {
          _showEmojiPicker(context, statusBloc);
        },),
      StreamBuilder<int>(
          stream: statusBloc.reblogPlusOriginalEmojiReactionsCountStream,
          initialData: statusBloc.reblogPlusOriginalEmojiReactionsCount,
          builder: (context, snapshot) {
            var favouritesCount = snapshot.data;
            if (favouritesCount == null) {
              return SizedBox.shrink();
            }
            return GestureDetector(onTap: () {
              _showEmojiPicker(context, statusBloc);
            },
                child: Text(favouritesCount.toString(), style: TextStyle(
                  fontSize: 12, color: FediColors.darkGrey,),));
          }),
    ],);
  }

  void _showEmojiPicker(BuildContext context, IStatusBloc statusBloc) {
    showEmojiPickerModalPopup(context,
        emojiReactionSelectedCallback: (String emojiName, String emoji) {
          statusBloc.toggleEmojiReaction(emoji: emoji);
        });
  }


}

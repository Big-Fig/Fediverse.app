import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusEmojiReactionListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusEmojiReactionBloc =
        IStatusEmojiReactionBloc.of(context, listen: true);
    return StreamBuilder<IPleromaStatusEmojiReaction>(
        stream: statusEmojiReactionBloc.emojiReactionStream,
        initialData: statusEmojiReactionBloc.emojiReaction,
        builder: (context, snapshot) {
          var emojiReaction = snapshot.data;

          if (emojiReaction == null) {
            // may occurs when user delete own reaction when new count is 0
            return SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Container(
              width: 65,
              child: GestureDetector(
                onTap: () {
                  statusEmojiReactionBloc.requestToggleEmojiReaction();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      emojiReaction.name,
                      style: TextStyle(fontSize: 22),
                    ),
                    if (emojiReaction.count > 1)
                      Text(
                        " : ${emojiReaction.count}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: emojiReaction.me
                                ? FediColors.darkGrey
                                : FediColors.grey),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

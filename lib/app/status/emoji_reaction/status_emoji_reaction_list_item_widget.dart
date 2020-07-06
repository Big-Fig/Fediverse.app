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

          var color =
              emojiReaction.me ? FediColors.primaryColor : FediColors.lightGrey;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: InkWell(
              onTap: () {
                statusEmojiReactionBloc.requestToggleEmojiReaction();
              },
              child: Container(
                height: 36.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(
                    color: color,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        emojiReaction.name,
                        style: TextStyle(fontSize: 16, height: 14 / 16),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${emojiReaction.count}",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: color),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}


import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusEmojiReactionListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusEmojiReactionBloc = IStatusEmojiReactionBloc.of(context, listen: true);
    return StreamBuilder<IPleromaStatusEmojiReaction>(
      stream: statusEmojiReactionBloc.emojiReactionStream,
      initialData: statusEmojiReactionBloc.emojiReaction,
      builder: (context, snapshot) {
        var emojiReaction = snapshot.data;

        if(emojiReaction == null) {
          // may occurs when user delete own reaction when new count is 0
          return SizedBox.shrink();
        }

        return Container(
          width: 65,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(0),
              color: emojiReaction.me ? Colors.blue : Colors.black12,
              onPressed: () {
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
                          color: emojiReaction.me ? Colors.white : Colors.black),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

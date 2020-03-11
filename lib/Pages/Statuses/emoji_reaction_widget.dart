import 'package:fedi/Pages/Statuses/emoji_reaction_bloc.dart';
import 'package:fedi/Pages/Statuses/emoji_readtion_provider.dart';
import 'package:fedi/Pleroma/Models/emoji_reaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmojiReactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emojiBloc = Provider.of<EmojiReactionProvider>(context);
    return StreamBuilder(
      stream: emojiBloc.bloc.getReactions,
      builder:
          (BuildContext context, AsyncSnapshot<List<EmojiReaction>> snapshot) {
        if (snapshot.hasData) {
          return Wrap(
            runSpacing: 0,
            alignment: WrapAlignment.start,
            children: getButtons(emojiBloc.bloc, snapshot.data),
          );
        } else {
          return Container();
        }
      },
    );
  }

  List<Widget> getButtons(
      EmojiReactionBloc bloc, List<EmojiReaction> reactions) {
    List<Widget> buttons = [];
    for (int i = 0; i < reactions.length; i++) {
      EmojiReaction reaction = reactions[i];
      Widget button = Container(
        width: 65,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: reaction.me ? Colors.blue : Colors.black12,
            onPressed: () {
              bloc.addRemoveReaction(reaction.name);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(reaction.name),
                Text(
                  " : ${reaction.count}",
                  style: TextStyle(
                      color: reaction.me ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }
}

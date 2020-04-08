import 'package:fedi/Pages/Statuses/emoji_reaction_bloc.dart';
import 'package:fedi/Pages/Statuses/emoji_readtion_provider.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/Models/emoji_reaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmojiReactionWidget extends StatelessWidget {

  final Status status;
  EmojiReactionWidget(this.status);
  @override
  Widget build(BuildContext context) {
    print("building emojireaction");
    final emojiBloc = Provider.of<EmojiReactionProvider>(context, listen: true);
    emojiBloc.bloc.updateReactions(status.statusPleroma.emojiReactions);
    return StreamBuilder(
      stream: emojiBloc.bloc.getReactions,
      builder:
          (BuildContext context, AsyncSnapshot<List<EmojiReaction>> snapshot) {
            print(snapshot.data);
        if (snapshot.hasData) {
          return Container(
            alignment: Alignment.topLeft,
              child: Wrap(
            runSpacing: 0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: getButtons(emojiBloc.bloc, snapshot.data),
          ));
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
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
            padding: EdgeInsets.all(0),
            color: reaction.me ? Colors.blue : Colors.black12,
            onPressed: () {
              bloc.addRemoveReaction(reaction.name);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(reaction.name, style: TextStyle(fontSize: 22),),
                if (reaction.count > 1)
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

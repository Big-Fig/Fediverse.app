

import 'package:fedi/Pages/Statuses/emoji_reaction_bloc.dart';
import 'package:flutter/material.dart';

class EmojiReactionProvider extends InheritedWidget {
  final  EmojiReactionBloc bloc;

  EmojiReactionProvider(this.bloc, {Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static EmojiReactionBloc of(BuildContext context) {
    return ( context.dependOnInheritedWidgetOfExactType<EmojiReactionProvider>().bloc );
  }
}
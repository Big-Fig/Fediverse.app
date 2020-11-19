import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSettingsBloc implements IDisposable {
  static IPushSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPushSettingsBloc>(context, listen: listen);

  Future subscribeAllEnabled();

  bool get isHaveSubscription;

  Stream<Exception> get failedToUpdateStream;

  bool get favourite;

  Stream<bool> get favouriteStream;

  void changeFavourite(bool value);

  bool get follow;

  Stream<bool> get followStream;

  void changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  void changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  void changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  void changePoll(bool value);

  bool get pleromaChatMention;

  Stream<bool> get pleromaChatMentionStream;

  void changePleromaChatMention(bool value);

  bool get pleromaEmojiReaction;

  Stream<bool> get pleromaEmojiReactionStream;

  void changePleromaEmojiReaction(bool value);
}

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/instance/instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSettingsBloc
    implements IInstanceSettingsBloc<PushSettings> {
  static IPushSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPushSettingsBloc>(context, listen: listen);

  Future reSubscribeIfNeeded();

  Future subscribeAllEnabled();

  bool get isHaveSubscription;

  Stream<Exception> get failedToUpdateStream;

  bool get favourite;

  Stream<bool> get favouriteStream;

  Future changeFavourite(bool value);

  bool get follow;

  Stream<bool> get followStream;

  Future changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  Future changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  Future changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  Future changePoll(bool value);

  bool get chatMention;

  Stream<bool> get chatMentionStream;

  Future changeChatMention(bool value);

  bool get emojiReaction;

  Stream<bool> get emojiReactionStream;

  Future changeEmojiReaction(bool value);
}

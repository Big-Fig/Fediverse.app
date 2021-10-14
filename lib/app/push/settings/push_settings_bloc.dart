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

  // ignore: avoid_positional_boolean_parameters
  Future changeFavourite(bool value);

  bool get follow;

  Stream<bool> get followStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  // ignore: avoid_positional_boolean_parameters
  Future changePoll(bool value);

  bool get chatMention;

  Stream<bool> get chatMentionStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeChatMention(bool value);

  bool get emojiReaction;

  Stream<bool> get emojiReactionStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeEmojiReaction(bool value);
}

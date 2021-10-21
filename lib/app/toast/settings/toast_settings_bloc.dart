import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IToastSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<ToastSettings> {
  static IToastSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IToastSettingsBloc>(context, listen: listen);

  PushSettings get pushSettings;

  Stream<PushSettings> get pushSettingsStream;

  Future<void> changePushSettings(PushSettings pushSettings);

  bool get favourite;

  Stream<bool> get favouriteStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeFavourite(bool value);

  ToastHandlingType get handlingType;

  Stream<ToastHandlingType> get handlingTypeStream;

  Future<void> changeHandlingType(ToastHandlingType value);

  bool get follow;

  Stream<bool> get followStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changePoll(bool value);

  bool get chatMention;

  Stream<bool> get chatMentionStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeChatMention(bool value);

  bool get emojiReaction;

  Stream<bool> get emojiReactionStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeEmojiReaction(bool value);

  bool isNotificationTypeEnabled(
    UnifediApiNotificationType unifediApiNotificationType,
  );
}

import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IToastSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<ToastSettings?> {
  static IToastSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IToastSettingsBloc>(context, listen: listen);

  bool? get favourite;

  Stream<bool?> get favouriteStream;

  void changeFavourite(bool value);

  ToastHandlingType get handlingType;

  Stream<ToastHandlingType> get handlingTypeStream;

  void changeHandlingType(ToastHandlingType value);

  bool? get follow;

  Stream<bool?> get followStream;

  void changeFollow(bool value);

  bool? get mention;

  Stream<bool?> get mentionStream;

  void changeMention(bool value);

  bool? get reblog;

  Stream<bool?> get reblogStream;

  void changeReblog(bool value);

  bool? get poll;

  Stream<bool?> get pollStream;

  void changePoll(bool value);

  bool? get pleromaChatMention;

  Stream<bool?> get pleromaChatMentionStream;

  void changePleromaChatMention(bool value);

  bool? get pleromaEmojiReaction;

  Stream<bool?> get pleromaEmojiReactionStream;

  void changePleromaEmojiReaction(bool value);

  bool? isNotificationTypeEnabled(PleromaNotificationType pleromaNotificationType);
}

import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IToastSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<ToastSettings> {
  static IToastSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IToastSettingsBloc>(context, listen: listen);

  bool get notificationForMention;

  Stream<bool> get notificationForMentionStream;

  void changeNotificationForMention(bool value);

  bool get notificationForChatAndDm;

  Stream<bool> get notificationForChatAndDmStream;

  void changeNotificationForChatAndDm(bool value);
}

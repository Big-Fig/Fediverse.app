import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';

class ToastSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<ToastSettings>
    implements IToastSettingsBloc {
  ToastSettingsBloc({
    @required IToastSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required IToastSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
    @required bool forceUseGlobal,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
    forceUseGlobal: forceUseGlobal,
        );

  @override
  void changeNotificationForChatAndDm(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          notificationForChatAndDm: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          notificationForChatAndDm: value,
        ),
      );
    }
  }

  @override
  void changeNotificationForMention(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          notificationForMention: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          notificationForMention: value,
        ),
      );
    }
  }

  @override
  bool get notificationForChatAndDm => settingsData.notificationForChatAndDm;

  @override
  Stream<bool> get notificationForChatAndDmStream =>
      settingsDataStream.map((settings) => settings.notificationForChatAndDm);

  @override
  bool get notificationForMention => settingsData.notificationForMention;

  @override
  Stream<bool> get notificationForMentionStream =>
      settingsDataStream.map((settings) => settings.notificationForMention);
}

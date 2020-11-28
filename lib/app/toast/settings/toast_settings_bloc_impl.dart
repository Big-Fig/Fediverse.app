import 'dart:async';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger("toast_settings_bloc_impl.dart");

class ToastSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<ToastSettings>
    implements IToastSettingsBloc {
  ToastSettingsBloc({
    @required IToastSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required IToastSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  PushSettings get pushSettingsData => settingsData?.pushSettings;

  Stream<PushSettings> get pushSettingsDataStream =>
      settingsDataStream.map((settingsData) => settingsData?.pushSettings);

  Future updatePushSettings(PushSettings newPushSettings) async {
    if (pushSettingsData == newPushSettings) {
      _logger.finest(() => "Same settings");
      return;
    }

    await updateSettings(
      settingsData.copyWith(
        pushSettings: newPushSettings,
      ),
    );
  }

  @override
  void changeFavourite(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        favourite: value,
      ),
    );
  }

  @override
  bool get favourite => pushSettingsData.favourite;

  @override
  Stream<bool> get favouriteStream =>
      pushSettingsDataStream.map((settings) => settings.favourite);

  @override
  void changeFollow(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        follow: value,
      ),
    );
  }

  @override
  bool get follow => pushSettingsData.follow;

  @override
  Stream<bool> get followStream =>
      pushSettingsDataStream.map((settings) => settings.follow);

  @override
  bool get mention => pushSettingsData.mention;

  @override
  Stream<bool> get mentionStream =>
      pushSettingsDataStream.map((settings) => settings.mention);

  @override
  void changeMention(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        mention: value,
      ),
    );
  }

  @override
  bool get reblog => pushSettingsData.reblog;

  @override
  Stream<bool> get reblogStream =>
      pushSettingsDataStream.map((settings) => settings.reblog);

  @override
  void changeReblog(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        reblog: value,
      ),
    );
  }

  @override
  bool get poll => pushSettingsData.poll;

  @override
  Stream<bool> get pollStream =>
      pushSettingsDataStream.map((settings) => settings.poll);

  @override
  void changePoll(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        poll: value,
      ),
    );
  }

  @override
  bool get pleromaChatMention => pushSettingsData.pleromaChatMention;

  @override
  Stream<bool> get pleromaChatMentionStream =>
      pushSettingsDataStream.map((settings) => settings.pleromaChatMention);

  @override
  void changePleromaChatMention(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        pleromaChatMention: value,
      ),
    );
  }

  @override
  bool get pleromaEmojiReaction => pushSettingsData.pleromaEmojiReaction;

  @override
  Stream<bool> get pleromaEmojiReactionStream =>
      pushSettingsDataStream.map((settings) => settings.pleromaEmojiReaction);

  @override
  void changePleromaEmojiReaction(bool value) {
    updatePushSettings(
      pushSettingsData.copyWith(
        pleromaEmojiReaction: value,
      ),
    );
  }

  @override
  ToastHandlingType get handlingType => settingsData.handlingType;

  @override
  Stream<ToastHandlingType> get handlingTypeStream =>
      settingsDataStream.map((settings) => settings.handlingType);

  @override
  void changeHandlingType(ToastHandlingType value) {
    updateSettings(
      settingsData.copyWith(
        handlingTypeString: value.toJsonValue(),
      ),
    );
  }

  @override
  Future updateSettings(ToastSettings newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => "Same settings");
      return;
    }

    await updateInstanceSettings(newSettings);

    return true;
  }

  @override
  bool isNotificationTypeEnabled(
      PleromaNotificationType pleromaNotificationType) {
    switch (pleromaNotificationType) {
      case PleromaNotificationType.follow:
        return follow;
        break;
      case PleromaNotificationType.favourite:
        return favourite;
        break;
      case PleromaNotificationType.reblog:
        return reblog;
        break;
      case PleromaNotificationType.mention:
        return mention;
        break;
      case PleromaNotificationType.poll:
        return poll;
        break;
      case PleromaNotificationType.move:
        // todo: handle move type?
        return false;
        break;
      case PleromaNotificationType.followRequest:
        // todo: handle followRequest type?
        return false;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        return pleromaEmojiReaction;
        break;
      case PleromaNotificationType.pleromaChatMention:
        return pleromaChatMention;
        break;
      case PleromaNotificationType.unknown:
        // todo: handle unknown type?
        return true;
        break;
    }
    throw "Invalid PleromaNotificationType $pleromaNotificationType";
  }
}

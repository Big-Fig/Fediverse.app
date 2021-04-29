import 'dart:async';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:logging/logging.dart';

final _logger = Logger("toast_settings_bloc_impl.dart");

class ToastSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<ToastSettings>
    implements IToastSettingsBloc {
  ToastSettingsBloc({
    required IToastSettingsLocalPreferenceBloc<ToastSettings>
        globalLocalPreferencesBloc,
    required IToastSettingsLocalPreferenceBloc<ToastSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  PushSettings get pushSettings => settingsData.pushSettings;

  @override
  Stream<PushSettings> get pushSettingsStream =>
      settingsDataStream.map((settingsData) => settingsData.pushSettings);

  @override
  Future changePushSettings(PushSettings newPushSettings) async {
    if (pushSettings == newPushSettings) {
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
  Future changeFavourite(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        favourite: value,
      ),
    );
  }

  @override
  bool get favourite => pushSettings.favourite == true;

  @override
  Stream<bool> get favouriteStream =>
      pushSettingsStream.map((settings) => settings.favourite == true);

  @override
  Future changeFollow(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        follow: value,
      ),
    );
  }

  @override
  bool get follow => pushSettings.follow == true;

  @override
  Stream<bool> get followStream =>
      pushSettingsStream.map((settings) => settings.follow == true);

  @override
  bool get mention => pushSettings.mention == true;

  @override
  Stream<bool> get mentionStream =>
      pushSettingsStream.map((settings) => settings.mention == true);

  @override
  Future changeMention(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        mention: value,
      ),
    );
  }

  @override
  bool get reblog => pushSettings.reblog == true;

  @override
  Stream<bool> get reblogStream =>
      pushSettingsStream.map((settings) => settings.reblog == true);

  @override
  Future changeReblog(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        reblog: value,
      ),
    );
  }

  @override
  bool get poll => pushSettings.poll == true;

  @override
  Stream<bool> get pollStream =>
      pushSettingsStream.map((settings) => settings.poll == true);

  @override
  Future changePoll(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        poll: value,
      ),
    );
  }

  @override
  bool get pleromaChatMention => pushSettings.pleromaChatMention == true;

  @override
  Stream<bool> get pleromaChatMentionStream =>
      pushSettingsStream.map((settings) => settings.pleromaChatMention == true);

  @override
  Future changePleromaChatMention(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
        pleromaChatMention: value,
      ),
    );
  }

  @override
  bool get pleromaEmojiReaction => pushSettings.pleromaEmojiReaction == true;

  @override
  Stream<bool> get pleromaEmojiReactionStream => pushSettingsStream
      .map((settings) => settings.pleromaEmojiReaction == true);

  @override
  Future changePleromaEmojiReaction(bool value) {
    return changePushSettings(
      pushSettings.copyWith(
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
  Future changeHandlingType(ToastHandlingType value) {
    return updateSettings(
      settingsData.copyWith(
        handlingType: value,
      ),
    );
  }

  @override
  Future updateSettings(ToastSettings? newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => "Same settings");
      return;
    }

    await updateInstanceSettings(newSettings);

    return true;
  }

  @override
  bool isNotificationTypeEnabled(
    PleromaApiNotificationType pleromaNotificationType,
  ) {
    switch (pleromaNotificationType) {
      case PleromaApiNotificationType.follow:
        return follow;

      case PleromaApiNotificationType.favourite:
        return favourite;

      case PleromaApiNotificationType.reblog:
        return reblog;

      case PleromaApiNotificationType.mention:
        return mention;

      case PleromaApiNotificationType.poll:
        return poll;

      case PleromaApiNotificationType.move:
        // todo: handle move type?
        return false;

      case PleromaApiNotificationType.pleromaReport:
        // todo: pleromaReport move type?
        return false;

      case PleromaApiNotificationType.followRequest:
        // todo: handle followRequest type?
        return false;

      case PleromaApiNotificationType.pleromaEmojiReaction:
        return pleromaEmojiReaction;

      case PleromaApiNotificationType.pleromaChatMention:
        return pleromaChatMention;

      case PleromaApiNotificationType.unknown:
        // todo: handle unknown type?
        return true;
    }
  }
}

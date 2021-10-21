import 'dart:async';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('toast_settings_bloc_impl.dart');

class ToastSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<ToastSettings>
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
  Future<void> changePushSettings(PushSettings newPushSettings) async {
    if (pushSettings == newPushSettings) {
      _logger.finest(() => 'Same settings');

      return;
    }

    await updateSettings(
      settingsData.copyWith(
        pushSettings: newPushSettings,
      ),
    );
  }

  @override
  Future<void> changeFavourite(bool value) => changePushSettings(
        pushSettings.copyWith(
          favourite: value,
        ),
      );

  @override
  bool get favourite => pushSettings.favourite == true;

  @override
  Stream<bool> get favouriteStream =>
      pushSettingsStream.map((settings) => settings.favourite == true);

  @override
  Future<void> changeFollow(bool value) => changePushSettings(
        pushSettings.copyWith(
          follow: value,
        ),
      );

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
  Future<void> changeMention(bool value) => changePushSettings(
        pushSettings.copyWith(
          mention: value,
        ),
      );

  @override
  bool get reblog => pushSettings.reblog == true;

  @override
  Stream<bool> get reblogStream =>
      pushSettingsStream.map((settings) => settings.reblog == true);

  @override
  Future<void> changeReblog(bool value) => changePushSettings(
        pushSettings.copyWith(
          reblog: value,
        ),
      );

  @override
  bool get poll => pushSettings.poll == true;

  @override
  Stream<bool> get pollStream =>
      pushSettingsStream.map((settings) => settings.poll == true);

  @override
  Future<void> changePoll(bool value) => changePushSettings(
        pushSettings.copyWith(
          poll: value,
        ),
      );

  @override
  bool get chatMention => pushSettings.chatMention == true;

  @override
  Stream<bool> get chatMentionStream =>
      pushSettingsStream.map((settings) => settings.chatMention == true);

  @override
  Future<void> changeChatMention(bool value) => changePushSettings(
        pushSettings.copyWith(
          chatMention: value,
        ),
      );

  @override
  bool get emojiReaction => pushSettings.emojiReaction == true;

  @override
  Stream<bool> get emojiReactionStream =>
      pushSettingsStream.map((settings) => settings.emojiReaction == true);

  @override
  Future<void> changeEmojiReaction(bool value) => changePushSettings(
        pushSettings.copyWith(
          emojiReaction: value,
        ),
      );

  @override
  ToastHandlingType get handlingType => settingsData.handlingType;

  @override
  Stream<ToastHandlingType> get handlingTypeStream =>
      settingsDataStream.map((settings) => settings.handlingType);

  @override
  Future<void> changeHandlingType(ToastHandlingType value) => updateSettings(
        settingsData.copyWith(
          handlingTypeString: value.toJsonValue(),
        ),
      );

  @override
  Future<void> updateSettings(ToastSettings? newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => 'Same settings');

      return;
    }

    await updateInstanceSettings(newSettings);
  }

  @override
  bool isNotificationTypeEnabled(
    UnifediApiNotificationType unifediApiNotificationType,
  ) =>
      unifediApiNotificationType.map(
        follow: (_) => follow,
        favourite: (_) => favourite,
        reblog: (_) => reblog,
        mention: (_) => mention,
        poll: (_) => poll,
        // todo: handle move type?
        move: (_) => false,
        // todo: handle move type?
        // ignore:no-equal-arguments
        followRequest: (_) => false,
        emojiReaction: (_) => emojiReaction,
        chatMention: (_) => chatMention,
        // todo: handle report type?
        // ignore:no-equal-arguments
        report: (_) => false,
        // display unknown by default
        unknown: (_) => true,
      );
}

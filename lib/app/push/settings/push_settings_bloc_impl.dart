import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger("push_settings_bloc_impl.dart");

class PushSettingsBloc extends DisposableOwner implements IPushSettingsBloc {
  final IPushSettingsLocalPreferencesBloc instanceLocalPreferencesBloc;
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final AuthInstance currentInstance;
  final IFcmPushService fcmPushService;
  final StreamController<bool> failedToUpdateStreamController =
      StreamController.broadcast();

  @override
  Stream<bool> get failedToUpdateStream =>
      failedToUpdateStreamController.stream;

  PushSettingsBloc({
    @required this.instanceLocalPreferencesBloc,
    @required this.pleromaPushService,
    @required this.pushRelayService,
    @required this.currentInstance,
    @required this.fcmPushService,
  }) {
    addDisposable(streamController: failedToUpdateStreamController);
  }

  PushSettings get settingsData => instanceLocalPreferencesBloc.value;

  Stream<PushSettings> get settingsDataStream =>
      instanceLocalPreferencesBloc.stream;

  @override
  void changeFavourite(bool value) {
    updateSettings(settingsData.copyWith(
      favourite: value,
    ));
  }

  @override
  bool get favourite => settingsData.favourite;

  @override
  Stream<bool> get favouriteStream =>
      settingsDataStream.map((settings) => settings.favourite);

  @override
  void changeFollow(bool value) {
    updateSettings(settingsData.copyWith(
      follow: value,
    ));
  }

  @override
  bool get follow => settingsData.follow;

  @override
  Stream<bool> get followStream =>
      settingsDataStream.map((settings) => settings.follow);

  @override
  bool get mention => settingsData.mention;

  @override
  Stream<bool> get mentionStream =>
      settingsDataStream.map((settings) => settings.mention);

  @override
  void changeMention(bool value) {
    updateSettings(settingsData.copyWith(
      mention: value,
    ));
  }

  @override
  bool get reblog => settingsData.reblog;

  @override
  Stream<bool> get reblogStream =>
      settingsDataStream.map((settings) => settings.reblog);

  @override
  void changeReblog(bool value) {
    updateSettings(settingsData.copyWith(
      reblog: value,
    ));
  }

  @override
  bool get poll => settingsData.poll;

  @override
  Stream<bool> get pollStream =>
      settingsDataStream.map((settings) => settings.poll);

  @override
  void changePoll(bool value) {
    updateSettings(settingsData.copyWith(
      poll: value,
    ));
  }

  @override
  bool get pleromaChatMention => settingsData.pleromaChatMention;

  @override
  Stream<bool> get pleromaChatMentionStream =>
      settingsDataStream.map((settings) => settings.pleromaChatMention);

  @override
  void changePleromaChatMention(bool value) {
    updateSettings(settingsData.copyWith(
      pleromaChatMention: value,
    ));
  }

  @override
  bool get pleromaEmojiReaction => settingsData.pleromaEmojiReaction;

  @override
  Stream<bool> get pleromaEmojiReactionStream =>
      settingsDataStream.map((settings) => settings.pleromaEmojiReaction);

  @override
  void changePleromaEmojiReaction(bool value) {
    updateSettings(settingsData.copyWith(
      pleromaEmojiReaction: value,
    ));
  }

  @override
  bool get isHaveSubscription =>
      instanceLocalPreferencesBloc.isSavedPreferenceExist;

  @override
  Future subscribeAllEnabled() =>
      updateSettings(PushSettings.defaultAllEnabled());

  Future updateSettings(PushSettings newSettings) async {

    if(settingsData == newSettings) {
      _logger.finest(() => "Same settings");
      return;
    }
    var deviceToken = fcmPushService.deviceToken;
    var permissionGranted = await fcmPushService.askPermissions();

    bool success;

    _logger.finest(() => "updateSubscriptionPreferences "
        "deviceToken $deviceToken permissionGranted $permissionGranted");
    if (deviceToken != null && permissionGranted) {
      PleromaPushSubscription subscription;
      try {
        subscription = await pleromaPushService.subscribe(
          endpointCallbackUrl: pushRelayService.createPushRelayEndPointUrl(
              account: currentInstance.acct,
              baseServerUrl: currentInstance.url,
              fcmDeviceToken: deviceToken),
          data: PleromaPushSubscribeData(
            alerts: PleromaPushSettingsDataAlerts(
              favourite: newSettings.favourite,
              follow: newSettings.follow,
              mention: newSettings.mention,
              reblog: newSettings.reblog,
              poll: newSettings.poll,
              pleromaChatMention: newSettings.pleromaChatMention,
              pleromaEmojiReaction: newSettings.pleromaEmojiReaction,
            ),
          ),
        );

        success = subscription != null;
      } catch (error, stackTrace) {
        success = false;
        _logger.warning(
            () => "failed to update subscription ", error, stackTrace);
      }

      if (success) {
        await instanceLocalPreferencesBloc.setValue(
          PushSettings(
            favourite: subscription.alerts.favourite ?? false,
            follow: subscription.alerts.follow ?? false,
            mention: subscription.alerts.mention ?? false,
            reblog: subscription.alerts.reblog ?? false,
            poll: subscription.alerts.poll ?? false,
            pleromaChatMention: subscription.alerts.pleromaChatMention ?? false,
            pleromaEmojiReaction: subscription.alerts.pleromaEmojiReaction ?? false,
          ),
        );
      }
    } else {
      success = false;
    }

    if (success) {
      _logger.finest(() => "updateSubscriptionPreferences \n"
          "\t newPreferences = $newSettings"
          "\t deviceToken = $deviceToken"
          "\t success = $success");
    } else {
      _logger.severe(() => "updateSubscriptionPreferences \n"
          "\t newPreferences = $newSettings"
          "\t deviceToken = $deviceToken"
          "\t success = $success");
    }

    return success;
  }
}

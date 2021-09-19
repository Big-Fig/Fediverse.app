import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/push/settings/relay/local_preferences/push_relay_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('push_settings_bloc_impl.dart');

class PushSettingsBloc extends DisposableOwner implements IPushSettingsBloc {
  final IPushSettingsLocalPreferenceBloc<PushSettings>
      instancePushSettingsLocalPreferenceBloc;
  final IPushRelaySettingsLocalPreferenceBloc<PushRelaySettings?>
      instancePushRelaySettingsLocalPreferenceBloc;
  final IUnifediApiPushSubscriptionService pleromaPushService;
  final IPushRelayService pushRelayService;
  final AuthInstance currentInstance;
  final IFcmPushService fcmPushService;
  final StreamController<Exception> failedToUpdateStreamController =
      StreamController.broadcast();
  final IConnectionService connectionService;

  final String pushSubscriptionKeysAuth;
  final String pushSubscriptionKeysP256dh;
  PushRelaySettings? get pushRelaySettings =>
      instancePushRelaySettingsLocalPreferenceBloc.value;

  @override
  Stream<Exception> get failedToUpdateStream =>
      failedToUpdateStreamController.stream;

  PushSettingsBloc({
    required this.pushSubscriptionKeysAuth,
    required this.pushSubscriptionKeysP256dh,
    required this.instancePushSettingsLocalPreferenceBloc,
    required this.instancePushRelaySettingsLocalPreferenceBloc,
    required this.pleromaPushService,
    required this.pushRelayService,
    required this.currentInstance,
    required this.connectionService,
    required this.fcmPushService,
  }) {
    failedToUpdateStreamController.disposeWith(this);
    addCustomDisposable(
      () => resubscribeDisposable?.dispose(),
    );
  }

  @override
  Future reSubscribeIfNeeded() => _checkResubscribe(
        listenChangedIsNotReady: true,
      );

  ICompositeDisposable? resubscribeDisposable;

  Future _checkResubscribe({
    required bool listenChangedIsNotReady,
  }) async {
    _logger.finest(
      () => '_checkResubscribe isHaveSubscription $isHaveSubscription',
    );
    if (isHaveSubscription) {
      var pushRelayBaseUrl = pushRelayService.pushRelayBaseUrl;

      var currentUsedPushRelayBaseUrl = pushRelaySettings?.pushRelayBaseUrl;

      // pushRelayBaseUrl may changed after app update
      var pushRelayBaseUrlChanged =
          pushRelayBaseUrl != currentUsedPushRelayBaseUrl;

      _logger.finest(() =>
          '_checkResubscribe pushRelayBaseUrlChanged $pushRelayBaseUrlChanged');
      if (pushRelayBaseUrlChanged) {
        var deviceToken = fcmPushService.deviceToken;
        var isApiReadyToUse = connectionService.isConnected;
        var isReady = deviceToken != null && isApiReadyToUse;

        _logger.finest(() => '_checkResubscribe isReady $isReady');
        if (isReady) {
          final success = await _trySubscribe(
            deviceToken!,
            settingsData,
          );

          if (success) {
            await resubscribeDisposable?.dispose();
            resubscribeDisposable = null;
          }
        } else {
          resubscribeDisposable = CompositeDisposable();
          fcmPushService.deviceTokenStream.listen(
            (_) {
              _checkResubscribe(listenChangedIsNotReady: false);
            },
          ).disposeWith(resubscribeDisposable!);

          connectionService.isConnectedStream.listen(
            (isConnected) {
              if (isConnected) {
                _checkResubscribe(listenChangedIsNotReady: false);
              }
            },
          ).disposeWith(resubscribeDisposable!);
        }
      }
    }
  }

  @override
  PushSettings get settingsData =>
      instancePushSettingsLocalPreferenceBloc.value;

  @override
  Stream<PushSettings> get settingsDataStream =>
      instancePushSettingsLocalPreferenceBloc.stream;

  @override
  Future changeFavourite(bool value) => updateSettings(
        settingsData.copyWith(
          favourite: value,
        ),
      );

  @override
  bool get favourite => settingsData.favourite == true;

  @override
  Stream<bool> get favouriteStream => settingsDataStream.map(
        (settings) => settings.favourite == true,
      );

  @override
  Future changeFollow(bool value) => updateSettings(
        settingsData.copyWith(
          follow: value,
        ),
      );

  @override
  bool get follow => settingsData.follow == true;

  @override
  Stream<bool> get followStream => settingsDataStream.map(
        (settings) => settings.follow == true,
      );

  @override
  bool get mention => settingsData.mention == true;

  @override
  Stream<bool> get mentionStream => settingsDataStream.map(
        (settings) => settings.mention == true,
      );

  @override
  Future changeMention(bool value) => updateSettings(
        settingsData.copyWith(
          mention: value,
        ),
      );

  @override
  bool get reblog => settingsData.reblog == true;

  @override
  Stream<bool> get reblogStream => settingsDataStream.map(
        (settings) => settings.reblog == true,
      );

  @override
  Future changeReblog(bool value) => updateSettings(
        settingsData.copyWith(
          reblog: value,
        ),
      );

  @override
  bool get poll => settingsData.poll == true;

  @override
  Stream<bool> get pollStream => settingsDataStream.map(
        (settings) => settings.poll == true,
      );

  @override
  Future changePoll(bool value) => updateSettings(
        settingsData.copyWith(
          poll: value,
        ),
      );

  @override
  bool get chatMention => settingsData.chatMention == true;

  @override
  Stream<bool> get chatMentionStream => settingsDataStream.map(
        (settings) => settings.chatMention == true,
      );

  @override
  Future changeChatMention(bool value) => updateSettings(
        settingsData.copyWith(
          chatMention: value,
        ),
      );

  @override
  bool get emojiReaction => settingsData.emojiReaction == true;

  @override
  Stream<bool> get emojiReactionStream =>
      settingsDataStream.map((settings) => settings.emojiReaction == true);

  @override
  Future changeEmojiReaction(bool value) => updateSettings(
        settingsData.copyWith(
          emojiReaction: value,
        ),
      );

  @override
  bool get isHaveSubscription =>
      instancePushSettingsLocalPreferenceBloc.isSavedPreferenceExist;

  @override
  Future subscribeAllEnabled() => updateSettings(
        PushSettings.defaultAllEnabled(),
      );

  @override
  Future updateSettings(PushSettings? newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => 'Same settings');

      return;
    }
    var deviceToken = fcmPushService.deviceToken;
    var permissionGranted = await fcmPushService.askPermissions();

    bool success;

    _logger.finest(() => 'updateSubscriptionPreferences '
        'deviceToken $deviceToken permissionGranted $permissionGranted');
    if (deviceToken != null && permissionGranted) {
      success = await _trySubscribe(deviceToken, newSettings);
    } else {
      success = false;
    }

    if (success) {
      _logger.finest(() => 'updateSubscriptionPreferences \n'
          '\t newPreferences = $newSettings'
          '\t deviceToken = $deviceToken'
          '\t success = $success');
    } else {
      _logger.severe(() => 'updateSubscriptionPreferences \n'
          '\t newPreferences = $newSettings'
          '\t deviceToken = $deviceToken'
          '\t success = $success');
    }

    return success;
  }

  Future<bool> _trySubscribe(
    String deviceToken,
    PushSettings? newSettings,
  ) async {
    bool success;
    IUnifediApiPushSubscription? subscription;
    try {
      var pushRelayEndPointUrl = pushRelayService.createPushRelayEndPointUrl(
        account: currentInstance.acct,
        baseServerUrl: currentInstance.uri,
        fcmDeviceToken: deviceToken,
      );
      subscription = await pleromaPushService.subscribe(
        metadata: UnifediApiPushSubscriptionMetadata(
          endpoint: pushRelayEndPointUrl,
          keys: UnifediApiPushSubscriptionKeys(
            auth: pushSubscriptionKeysAuth,
            p256dh: pushSubscriptionKeysP256dh,
          ),
        ),
        alerts: UnifediApiPushSubscriptionAlerts(
          favourite: newSettings!.favourite,
          follow: newSettings.follow,
          mention: newSettings.mention,
          reblog: newSettings.reblog,
          poll: newSettings.poll,
          chatMention: newSettings.chatMention,
          emojiReaction: newSettings.emojiReaction,
        ),
      );
      await instancePushSettingsLocalPreferenceBloc.setValue(
        PushSettings(
          favourite: subscription.alerts.favourite ?? false,
          follow: subscription.alerts.follow ?? false,
          mention: subscription.alerts.mention ?? false,
          reblog: subscription.alerts.reblog ?? false,
          poll: subscription.alerts.poll ?? false,
          chatMention: subscription.alerts.chatMention ?? false,
          emojiReaction: subscription.alerts.emojiReaction ?? false,
        ),
      );

      await instancePushRelaySettingsLocalPreferenceBloc.setValue(
        PushRelaySettings(
          pushRelayBaseUrl: pushRelayService.pushRelayBaseUrl,
        ),
      );

      success = true;
    } catch (error, stackTrace) {
      // todo: we dont need try catch at this level
      success = false;
      _logger.warning(
        () => 'failed to update subscription ',
        error,
        stackTrace,
      );
    }

    return success;
  }
}

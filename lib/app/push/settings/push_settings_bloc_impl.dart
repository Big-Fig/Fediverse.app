import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:logging/logging.dart';

final _logger = Logger("push_settings_bloc_impl.dart");

class PushSettingsBloc extends DisposableOwner implements IPushSettingsBloc {
  final IPushSettingsLocalPreferenceBloc<PushSettings>
      instanceLocalPreferencesBloc;
  final IPleromaApiPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final AuthInstance currentInstance;
  final IFcmPushService fcmPushService;
  final StreamController<Exception> failedToUpdateStreamController =
      StreamController.broadcast();

  @override
  Stream<Exception> get failedToUpdateStream =>
      failedToUpdateStreamController.stream;

  PushSettingsBloc({
    required this.instanceLocalPreferencesBloc,
    required this.pleromaPushService,
    required this.pushRelayService,
    required this.currentInstance,
    required this.fcmPushService,
  }) {
    addDisposable(streamController: failedToUpdateStreamController);
  }

  @override
  PushSettings get settingsData => instanceLocalPreferencesBloc.value;

  @override
  Stream<PushSettings> get settingsDataStream =>
      instanceLocalPreferencesBloc.stream;

  @override
  Future changeFavourite(bool value) => updateSettings(settingsData.copyWith(
        favourite: value,
      ));

  @override
  bool get favourite => settingsData.favourite == true;

  @override
  Stream<bool> get favouriteStream =>
      settingsDataStream.map((settings) => settings.favourite == true);

  @override
  Future changeFollow(bool value) => updateSettings(settingsData.copyWith(
        follow: value,
      ));

  @override
  bool get follow => settingsData.follow == true;

  @override
  Stream<bool> get followStream =>
      settingsDataStream.map((settings) => settings.follow == true);

  @override
  bool get mention => settingsData.mention == true;

  @override
  Stream<bool> get mentionStream =>
      settingsDataStream.map((settings) => settings.mention == true);

  @override
  Future changeMention(bool value) => updateSettings(settingsData.copyWith(
        mention: value,
      ));

  @override
  bool get reblog => settingsData.reblog == true;

  @override
  Stream<bool> get reblogStream =>
      settingsDataStream.map((settings) => settings.reblog == true);

  @override
  Future changeReblog(bool value) => updateSettings(settingsData.copyWith(
        reblog: value,
      ));

  @override
  bool get poll => settingsData.poll == true;

  @override
  Stream<bool> get pollStream =>
      settingsDataStream.map((settings) => settings.poll == true);

  @override
  Future changePoll(bool value) => updateSettings(settingsData.copyWith(
        poll: value,
      ));

  @override
  bool get pleromaChatMention => settingsData.pleromaChatMention == true;

  @override
  Stream<bool> get pleromaChatMentionStream =>
      settingsDataStream.map((settings) => settings.pleromaChatMention == true);

  @override
  Future changePleromaChatMention(bool value) =>
      updateSettings(settingsData.copyWith(
        pleromaChatMention: value,
      ));

  @override
  bool get pleromaEmojiReaction => settingsData.pleromaEmojiReaction == true;

  @override
  Stream<bool> get pleromaEmojiReactionStream => settingsDataStream
      .map((settings) => settings.pleromaEmojiReaction == true);

  @override
  Future changePleromaEmojiReaction(bool value) =>
      updateSettings(settingsData.copyWith(
        pleromaEmojiReaction: value,
      ));

  @override
  bool get isHaveSubscription =>
      instanceLocalPreferencesBloc.isSavedPreferenceExist;

  @override
  Future subscribeAllEnabled() => updateSettings(
        PushSettings.defaultAllEnabled(),
      );

  @override
  Future updateSettings(PushSettings? newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => "Same settings");
      return;
    }
    var deviceToken = fcmPushService.deviceToken;
    var permissionGranted = await fcmPushService.askPermissions();

    bool success;

    _logger.finest(() => "updateSubscriptionPreferences "
        "deviceToken $deviceToken permissionGranted $permissionGranted");
    if (deviceToken != null && permissionGranted) {
      success = await _trySubscribe(deviceToken, newSettings);
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

  Future<bool> _trySubscribe(
    String deviceToken,
    PushSettings? newSettings,
  ) async {
    bool success;
    PleromaApiPushSubscription? subscription;
    try {
      subscription = await pleromaPushService.subscribe(
        endpointCallbackUrl: pushRelayService.createPushRelayEndPointUrl(
          account: currentInstance.acct,
          baseServerUrl: currentInstance.uri,
          fcmDeviceToken: deviceToken,
        ),
        data: PleromaApiPushSubscribeData(
          alerts: PleromaApiPushSubscribeRequestDataAlerts(
            favourite: newSettings!.favourite,
            follow: newSettings.follow,
            mention: newSettings.mention,
            reblog: newSettings.reblog,
            poll: newSettings.poll,
            pleromaChatMention: newSettings.pleromaChatMention,
            pleromaEmojiReaction: newSettings.pleromaEmojiReaction,
          ),
        ),
      );
      await instanceLocalPreferencesBloc.setValue(
        PushSettings(
          favourite: subscription.alerts?.favourite ?? false,
          follow: subscription.alerts?.follow ?? false,
          mention: subscription.alerts?.mention ?? false,
          reblog: subscription.alerts?.reblog ?? false,
          poll: subscription.alerts?.poll ?? false,
          pleromaChatMention: subscription.alerts?.pleromaChatMention ?? false,
          pleromaEmojiReaction:
              subscription.alerts?.pleromaEmojiReaction ?? false,
        ),
      );

      success = true;
    } catch (error, stackTrace) {
      // todo: we don't need try catch at this level
      success = false;
      _logger.warning(
        () => "failed to update subscription ",
        error,
        stackTrace,
      );
    }

    return success;
  }
}

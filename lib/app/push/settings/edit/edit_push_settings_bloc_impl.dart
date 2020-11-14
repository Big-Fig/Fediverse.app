import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("edit_push_settings_bloc_impl.dart");

class PushSubscriptionSettingsBloc extends DisposableOwner
    implements IPushSubscriptionSettingsBloc {
  final IPushSubscriptionSettingsLocalPreferencesBloc
      pushSubscriptionSettingsLocalPreferencesBloc;
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final AuthInstance currentInstance;
  final IFcmPushService fcmPushService;
  final StreamController<bool> failedToUpdateStreamController =
      StreamController.broadcast();

  @override
  Stream<bool> get failedToUpdateStream =>
      failedToUpdateStreamController.stream;

  @override
  final IFormBoolFieldBloc favouriteFieldBloc;
  @override
  final IFormBoolFieldBloc followFieldBloc;
  @override
  final IFormBoolFieldBloc mentionFieldBloc;
  @override
  final IFormBoolFieldBloc reblogFieldBloc;
  @override
  final IFormBoolFieldBloc pollFieldBloc;
  @override
  final IFormBoolFieldBloc chatFieldBloc;

  PushSubscriptionSettingsBloc({
    @required this.pushSubscriptionSettingsLocalPreferencesBloc,
    @required this.pleromaPushService,
    @required this.pushRelayService,
    @required this.currentInstance,
    @required this.fcmPushService,
  })  : favouriteFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.favourite ??
                    true),
        followFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.follow ??
                    true),
        mentionFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.mention ??
                    true),
        reblogFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.reblog ??
                    true),
        pollFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.poll ??
                    true),
        chatFieldBloc = FormBoolFieldBloc(
            originValue:
                pushSubscriptionSettingsLocalPreferencesBloc.value?.chat ??
                    true) {
    addDisposable(disposable: favouriteFieldBloc);
    addDisposable(disposable: followFieldBloc);
    addDisposable(disposable: mentionFieldBloc);
    addDisposable(disposable: reblogFieldBloc);
    addDisposable(disposable: pollFieldBloc);
    addDisposable(disposable: chatFieldBloc);

    addDisposable(streamController: failedToUpdateStreamController);

    addDisposable(
        streamSubscription: favouriteFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: followFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: mentionFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: reblogFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: pollFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: chatFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));

    addDisposable(
      streamSubscription:
          pushSubscriptionSettingsLocalPreferencesBloc.stream.listen(
        (newPreferences) {
          fillNewPreferencesValues(newPreferences);
        },
      ),
    );
  }

  void _onSomethingChanged() async {
    var newPreferences = PushSubscriptionSettingsLocalPreferences(
      favourite: favouriteFieldBloc.currentValue,
      follow: followFieldBloc.currentValue,
      mention: mentionFieldBloc.currentValue,
      reblog: reblogFieldBloc.currentValue,
      poll: pollFieldBloc.currentValue,
      chat: chatFieldBloc.currentValue,
    );

    var oldPreferences = pushSubscriptionSettingsLocalPreferencesBloc.value;
    var changed = newPreferences != oldPreferences;
    if (changed) {
      var success = await updateSubscriptionPreferences(newPreferences);

      if (!success) {
        failedToUpdateStreamController.add(true);

        favouriteFieldBloc.changeCurrentValue(oldPreferences.favourite);
        followFieldBloc.changeCurrentValue(oldPreferences.follow);
        mentionFieldBloc.changeCurrentValue(oldPreferences.mention);
        reblogFieldBloc.changeCurrentValue(oldPreferences.reblog);
        pollFieldBloc.changeCurrentValue(oldPreferences.poll);
        chatFieldBloc.changeCurrentValue(oldPreferences.chat);
      }
    }
  }

  Future<bool> updateSubscriptionPreferences(
      PushSubscriptionSettingsLocalPreferences newPreferences) async {
    var deviceToken = fcmPushService.deviceToken;
    var permissionGranted = await fcmPushService.askPermissions();

    bool success;

    _logger.finest(() => "updateSubscriptionPreferences "
        "deviceToken $deviceToken permissionGranted $permissionGranted");
    if (deviceToken != null && permissionGranted) {
      try {
        var subscription = await pleromaPushService.subscribe(
            endpointCallbackUrl: pushRelayService.createPushRelayEndPointUrl(
                account: currentInstance.acct,
                baseServerUrl: currentInstance.url,
                fcmDeviceToken: deviceToken),
            data: PleromaPushSubscribeData(
                alerts: PleromaPushSettingsDataAlerts(
              favourite: newPreferences.favourite,
              follow: newPreferences.follow,
              mention: newPreferences.mention,
              reblog: newPreferences.reblog,
              poll: newPreferences.poll,
              pleromaChatMention: newPreferences.chat,
            )));

        success = subscription != null;
      } catch (error, stackTrace) {
        success = false;
        _logger.warning(
            () => "failed to update subscription ", error, stackTrace);
      }

      if (success) {
        await pushSubscriptionSettingsLocalPreferencesBloc
            .setValue(newPreferences);
      }
    } else {
      success = false;
    }

    if (success) {
      _logger.finest(() => "updateSubscriptionPreferences \n"
          "\t newPreferences = $newPreferences"
          "\t deviceToken = $deviceToken"
          "\t success = $success");
    } else {
      _logger.severe(() => "updateSubscriptionPreferences \n"
          "\t newPreferences = $newPreferences"
          "\t deviceToken = $deviceToken"
          "\t success = $success");
    }

    return success;
  }

  @override
  bool get isHaveSubscription =>
      pushSubscriptionSettingsLocalPreferencesBloc.isSavedPreferenceExist;

  @override
  Future subscribeAllEnabled() => updateSubscriptionPreferences(
      PushSubscriptionSettingsLocalPreferences.defaultAllEnabled());

  void fillNewPreferencesValues(
      PushSubscriptionSettingsLocalPreferences newPreferences) {
    favouriteFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.favourite);
    followFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.follow);
    mentionFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.mention);
    reblogFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.reblog);
    pollFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.poll);
    chatFieldBloc.changeCurrentValue(
        pushSubscriptionSettingsLocalPreferencesBloc.value?.chat);
  }
}

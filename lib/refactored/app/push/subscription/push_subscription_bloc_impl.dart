import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("push_subscription_bloc_impl.dart");

class PushSubscriptionBloc extends DisposableOwner
    implements IPushSubscriptionBloc {
  final IPushSubscriptionLocalPreferencesBloc subscriptionLocalPreferencesBloc;
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final AuthInstance currentInstance;
  final IFcmPushService fcmPushService;

  PushSubscriptionBloc({
    @required this.subscriptionLocalPreferencesBloc,
    @required this.pleromaPushService,
    @required this.pushRelayService,
    @required this.currentInstance,
    @required this.fcmPushService,
  });

  @override
  bool get favouritePushesEnabled =>
      subscriptionLocalPreferencesBloc.value.favourite;

  @override
  Stream<bool> get favouritePushesEnabledStream =>
      subscriptionLocalPreferencesBloc.stream.map(
          (preferences) => subscriptionLocalPreferencesBloc.value.favourite);

  @override
  Future<bool> changeFavouritePushesEnabled(bool value) {
    return updateSubscriptionPreferences(
        subscriptionLocalPreferencesBloc.value.copyWith(favourite: value));
  }

  @override
  bool get followPushesEnabled => subscriptionLocalPreferencesBloc.value.follow;

  @override
  Stream<bool> get followPushesEnabledStream =>
      subscriptionLocalPreferencesBloc.stream
          .map((preferences) => subscriptionLocalPreferencesBloc.value.follow);

  @override
  Future<bool> changeFollowPushesEnabled(bool value) {
    return updateSubscriptionPreferences(
        subscriptionLocalPreferencesBloc.value.copyWith(follow: value));
  }

  @override
  bool get mentionPushesEnabled =>
      subscriptionLocalPreferencesBloc.value.mention;

  @override
  Stream<bool> get mentionPushesEnabledStream =>
      subscriptionLocalPreferencesBloc.stream
          .map((preferences) => subscriptionLocalPreferencesBloc.value.mention);

  @override
  Future<bool> changeMentionPushesEnabled(bool value) {
    return updateSubscriptionPreferences(
        subscriptionLocalPreferencesBloc.value.copyWith(mention: value));
  }

  @override
  bool get reblogPushesEnabled => subscriptionLocalPreferencesBloc.value.reblog;

  @override
  Stream<bool> get reblogPushesEnabledStream =>
      subscriptionLocalPreferencesBloc.stream
          .map((preferences) => subscriptionLocalPreferencesBloc.value.reblog);

  @override
  Future<bool> changeReblogPushesEnabled(bool value) {
    return updateSubscriptionPreferences(
        subscriptionLocalPreferencesBloc.value.copyWith(reblog: value));
  }

  @override
  bool get pollPushesEnabled => subscriptionLocalPreferencesBloc.value.poll;

  @override
  Stream<bool> get pollPushesEnabledStream =>
      subscriptionLocalPreferencesBloc.stream
          .map((preferences) => subscriptionLocalPreferencesBloc.value.poll);

  @override
  Future<bool> changePollPushesEnabled(bool value) {
    return updateSubscriptionPreferences(
        subscriptionLocalPreferencesBloc.value.copyWith(poll: value));
  }

  Future<bool> updateSubscriptionPreferences(
      PushSubscriptionLocalPreferences newPreferences) async {
    var deviceToken = fcmPushService.deviceToken;

    bool success;
    if (deviceToken != null) {
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
                  poll: newPreferences.poll)));

      success = subscription != null;

      if (success) {
        await subscriptionLocalPreferencesBloc.setValue(newPreferences);
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
      subscriptionLocalPreferencesBloc.isSavedPreferenceExist;

  @override
  Future subscribeWithDefaultPreferences() => updateSubscriptionPreferences(
      PushSubscriptionLocalPreferences.defaultAllEnabled());
}

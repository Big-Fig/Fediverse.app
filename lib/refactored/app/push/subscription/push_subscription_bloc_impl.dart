import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:flutter/widgets.dart';

class PushSubscriptionBloc extends DisposableOwner
    implements IPushSubscriptionBloc {
  final IPushSubscriptionLocalPreferencesBloc
      pushSubscriptionLocalPreferencesBloc;
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final Instance currentInstance;
  final IFcmPushService fcmPushService;

  PushSubscriptionBloc({
    @required this.pushSubscriptionLocalPreferencesBloc,
    @required this.pleromaPushService,
    @required this.pushRelayService,
    @required this.currentInstance,
    @required this.fcmPushService,
  });

  @override
  bool get favouritePushesEnabled => pushSubscriptionLocalPreferencesBloc.value.favourite;

  @override
  Stream<bool> get favouritePushesEnabledStream =>
      pushSubscriptionLocalPreferencesBloc.stream.map((preferences) =>
          pushSubscriptionLocalPreferencesBloc.value.favourite);

  @override
  Future<bool> changeFavouritePushesEnabled(bool value) {
    return updatePreferences(
        pushSubscriptionLocalPreferencesBloc.value.copyWith(favourite: value));
  }

  @override
  bool get followPushesEnabled => pushSubscriptionLocalPreferencesBloc.value.follow;

  @override
  Stream<bool> get followPushesEnabledStream => pushSubscriptionLocalPreferencesBloc.stream
      .map((preferences) => pushSubscriptionLocalPreferencesBloc.value.follow);

  @override
  Future<bool> changeFollowPushesEnabled(bool value) {
    return updatePreferences(
        pushSubscriptionLocalPreferencesBloc.value.copyWith(follow: value));
  }

  @override
  bool get mentionPushesEnabled => pushSubscriptionLocalPreferencesBloc.value.mention;

  @override
  Stream<bool> get mentionPushesEnabledStream => pushSubscriptionLocalPreferencesBloc.stream
      .map((preferences) => pushSubscriptionLocalPreferencesBloc.value.mention);

  @override
  Future<bool> changeMentionPushesEnabled(bool value) {
    return updatePreferences(
        pushSubscriptionLocalPreferencesBloc.value.copyWith(mention: value));
  }

  @override
  bool get reblogPushesEnabled => pushSubscriptionLocalPreferencesBloc.value.reblog;

  @override
  Stream<bool> get reblogPushesEnabledStream => pushSubscriptionLocalPreferencesBloc.stream
      .map((preferences) => pushSubscriptionLocalPreferencesBloc.value.reblog);

  @override
  Future<bool> changeReblogPushesEnabled(bool value) {
    return updatePreferences(
        pushSubscriptionLocalPreferencesBloc.value.copyWith(reblog: value));
  }

  @override
  bool get pollPushesEnabled => pushSubscriptionLocalPreferencesBloc.value.poll;

  @override
  Stream<bool> get pollPushesEnabledStream => pushSubscriptionLocalPreferencesBloc.stream
      .map((preferences) => pushSubscriptionLocalPreferencesBloc.value.poll);

  @override
  Future<bool> changePollPushesEnabled(bool value) {
    return updatePreferences(
        pushSubscriptionLocalPreferencesBloc.value.copyWith(poll: value));
  }

  Future<bool> updatePreferences(
      PushSubscriptionLocalPreferences newPreferences) async {
    var deviceToken = fcmPushService.deviceToken;



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

    var success = subscription != null;

    if (success) {
      await pushSubscriptionLocalPreferencesBloc.setValue(newPreferences);
    }
    return success;
  }
}

import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:flutter/widgets.dart';

class PushSubscriptionBloc extends DisposableOwner implements IPushSubscriptionBloc {
  final IPushSubscriptionLocalPreferencesBloc pushSettingsLocalPreferencesBloc;
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;
  final ICurrentInstanceBloc currentInstanceBloc;
  PushSubscriptionBloc({
    @required this.pushSettingsLocalPreferencesBloc,
    @required this.pleromaPushService,
    @required this.pushRelayService,
    @required this.currentInstanceBloc,
  });

  @override
  bool get favourite => pushSettingsLocalPreferencesBloc.value.favourite;

  @override
  Stream<bool> get favouriteStream => pushSettingsLocalPreferencesBloc.stream
      .map((preferences) => pushSettingsLocalPreferencesBloc.value.favourite);

  @override
  Future<bool> changeFavourite(bool value) {
    return updatePreferences(
        pushSettingsLocalPreferencesBloc.value.copyWith(favourite: value));
  }

  @override
  bool get follow => pushSettingsLocalPreferencesBloc.value.follow;

  @override
  Stream<bool> get followStream => pushSettingsLocalPreferencesBloc.stream
      .map((preferences) => pushSettingsLocalPreferencesBloc.value.follow);

  @override
  Future<bool> changeFollow(bool value) {
    return updatePreferences(
        pushSettingsLocalPreferencesBloc.value.copyWith(follow: value));
  }

  @override
  bool get mention => pushSettingsLocalPreferencesBloc.value.mention;

  @override
  Stream<bool> get mentionStream => pushSettingsLocalPreferencesBloc.stream
      .map((preferences) => pushSettingsLocalPreferencesBloc.value.mention);

  @override
  Future<bool> changeMention(bool value) {
    return updatePreferences(
        pushSettingsLocalPreferencesBloc.value.copyWith(mention: value));
  }

  @override
  bool get reblog => pushSettingsLocalPreferencesBloc.value.reblog;

  @override
  Stream<bool> get reblogStream => pushSettingsLocalPreferencesBloc.stream
      .map((preferences) => pushSettingsLocalPreferencesBloc.value.reblog);

  @override
  Future<bool> changeReblog(bool value) {
    return updatePreferences(
        pushSettingsLocalPreferencesBloc.value.copyWith(reblog: value));
  }

  @override
  bool get poll => pushSettingsLocalPreferencesBloc.value.poll;

  @override
  Stream<bool> get pollStream => pushSettingsLocalPreferencesBloc.stream
      .map((preferences) => pushSettingsLocalPreferencesBloc.value.poll);

  @override
  Future<bool> changePoll(bool value) {
    return updatePreferences(
        pushSettingsLocalPreferencesBloc.value.copyWith(poll: value));
  }

  Future<bool> updatePreferences(
      PushSubscriptionLocalPreferences newPreferences) async {
    var currentInstance = currentInstanceBloc.currentInstance;
    var subscription = await pleromaPushService.subscribe(
        endpointCallbackUrl: pushRelayService.createPushRelayEndPointUrl(
            account: currentInstance.acct,
            baseServerUrl: currentInstance.url, fcmToken: null),
        data: PleromaPushSubscribeData(
            alerts: PleromaPushSettingsDataAlerts(
                favourite: newPreferences.favourite,
                follow: newPreferences.follow,
                mention: newPreferences.mention,
                reblog: newPreferences.reblog,
                poll: newPreferences.poll)));

    var success = subscription != null;

    if (success) {
      await pushSettingsLocalPreferencesBloc.setValue(newPreferences);
    }
    return success;
  }
}

import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/push/local_preferences/push_local_preferences_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class NotificationsHomeTabPageDrawerBloc extends DisposableOwner
    implements INotificationsHomeTabPageDrawerBloc {
  final IPushLocalPreferencesBloc localPreferencesBloc;
  NotificationsHomeTabPageDrawerBloc({@required this.localPreferencesBloc});
//
//  NotificationLocalPreferences get preferences => localPreferencesBloc.value;
//
//  Stream<NotificationLocalPreferences> get preferencesStream =>
//      localPreferencesBloc.stream;
//
//  @override
//  bool get onlyNoNsfwSensitive => preferences?.onlyNoNsfwSensitive;
//
//  @override
//  Stream<bool> get onlyNoNsfwSensitiveStream =>
//      preferencesStream.map((preferences) => preferences?.onlyNoNsfwSensitive);
//
//  @override
//  bool get onlyNoReplies => preferences?.onlyNoReplies;
//
//  @override
//  Stream<bool> get onlyNoRepliesStream =>
//      preferencesStream.map((preferences) => preferences?.onlyNoReplies);
//
//  @override
//  bool get onlyWithMedia => preferences?.onlyWithMedia;
//
//  @override
//  Stream<bool> get onlyWithMediaStream =>
//      preferencesStream.map((preferences) => preferences?.onlyWithMedia);
//
//
//  @override
//  changeOnlyNoNsfwSensitive(bool value) {
//    localPreferencesBloc
//        .setValue(preferences.copyWith(onlyNoNsfwSensitive: value));
//  }
//
//  @override
//  changeOnlyNoReplies(bool value) {
//    localPreferencesBloc.setValue(preferences.copyWith(onlyNoReplies: value));
//  }
//
//  @override
//  changeOnlyWithMedia(bool value) {
//    localPreferencesBloc.setValue(preferences.copyWith(onlyWithMedia: value));
//  }
}

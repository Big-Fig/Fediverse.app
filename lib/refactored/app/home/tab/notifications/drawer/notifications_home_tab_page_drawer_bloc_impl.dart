import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';

import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class NotificationsHomeTabPageDrawerBloc extends DisposableOwner
    implements INotificationsHomeTabPageDrawerBloc {
  final IPushSubscriptionBloc pushSettingsBloc;
  NotificationsHomeTabPageDrawerBloc({@required this.pushSettingsBloc});
  

  @override
  bool get favourite => pushSettingsBloc.favouritePushesEnabled;

  @override
  Stream<bool> get favouriteStream => pushSettingsBloc.favouritePushesEnabledStream;

  @override
  Future<bool> changeFavourite(bool value) => pushSettingsBloc
      .changeFavouritePushesEnabled(value);

  @override
  bool get follow => pushSettingsBloc.followPushesEnabled;

  @override
  Stream<bool> get followStream => pushSettingsBloc.followPushesEnabledStream;

  @override
  Future<bool> changeFollow(bool value) => pushSettingsBloc
      .changeFollowPushesEnabled(value);

  @override
  bool get mention => pushSettingsBloc.mentionPushesEnabled;

  @override
  Stream<bool> get mentionStream => pushSettingsBloc.mentionPushesEnabledStream;

  @override
  Future<bool> changeMention(bool value) => pushSettingsBloc
      .changeMentionPushesEnabled(value);

  @override
  bool get reblog => pushSettingsBloc.reblogPushesEnabled;

  @override
  Stream<bool> get reblogStream => pushSettingsBloc.reblogPushesEnabledStream;

  @override
  Future<bool> changeReblog(bool value) => pushSettingsBloc
      .changeReblogPushesEnabled(value);

  @override
  bool get poll => pushSettingsBloc.pollPushesEnabled;

  @override
  Stream<bool> get pollStream => pushSettingsBloc.pollPushesEnabledStream;

  @override
  Future<bool> changePoll(bool value) => pushSettingsBloc
      .changePollPushesEnabled(value);

}

import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';

import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class NotificationsHomeTabPageDrawerBloc extends DisposableOwner
    implements INotificationsHomeTabPageDrawerBloc {
  final IPushSubscriptionBloc pushSettingsBloc;
  NotificationsHomeTabPageDrawerBloc({@required this.pushSettingsBloc});
  

  @override
  bool get favourite => pushSettingsBloc.favourite;

  @override
  Stream<bool> get favouriteStream => pushSettingsBloc.favouriteStream;

  @override
  Future<bool> changeFavourite(bool value) => pushSettingsBloc
      .changeFavourite(value);

  @override
  bool get follow => pushSettingsBloc.follow;

  @override
  Stream<bool> get followStream => pushSettingsBloc.followStream;

  @override
  Future<bool> changeFollow(bool value) => pushSettingsBloc
      .changeFollow(value);

  @override
  bool get mention => pushSettingsBloc.mention;

  @override
  Stream<bool> get mentionStream => pushSettingsBloc.mentionStream;

  @override
  Future<bool> changeMention(bool value) => pushSettingsBloc
      .changeMention(value);

  @override
  bool get reblog => pushSettingsBloc.reblog;

  @override
  Stream<bool> get reblogStream => pushSettingsBloc.reblogStream;

  @override
  Future<bool> changeReblog(bool value) => pushSettingsBloc
      .changeReblog(value);

  @override
  bool get poll => pushSettingsBloc.poll;

  @override
  Stream<bool> get pollStream => pushSettingsBloc.pollStream;

  @override
  Future<bool> changePoll(bool value) => pushSettingsBloc
      .changePoll(value);

}

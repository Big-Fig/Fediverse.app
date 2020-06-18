import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class NotificationsHomeTabPageDrawerBloc extends DisposableOwner
    implements INotificationsHomeTabPageDrawerBloc {
  final IPushSubscriptionBloc pushSubscriptionBloc;
  NotificationsHomeTabPageDrawerBloc({@required this.pushSubscriptionBloc});

  @override
  bool get favourite => pushSubscriptionBloc.favouritePushesEnabled;

  @override
  Stream<bool> get favouriteStream =>
      pushSubscriptionBloc.favouritePushesEnabledStream;

  @override
  Future<bool> changeFavourite(bool value) =>
      pushSubscriptionBloc.changeFavouritePushesEnabled(value);

  @override
  bool get follow => pushSubscriptionBloc.followPushesEnabled;

  @override
  Stream<bool> get followStream => pushSubscriptionBloc.followPushesEnabledStream;

  @override
  Future<bool> changeFollow(bool value) =>
      pushSubscriptionBloc.changeFollowPushesEnabled(value);

  @override
  bool get mention => pushSubscriptionBloc.mentionPushesEnabled;

  @override
  Stream<bool> get mentionStream => pushSubscriptionBloc.mentionPushesEnabledStream;

  @override
  Future<bool> changeMention(bool value) =>
      pushSubscriptionBloc.changeMentionPushesEnabled(value);

  @override
  bool get reblog => pushSubscriptionBloc.reblogPushesEnabled;

  @override
  Stream<bool> get reblogStream => pushSubscriptionBloc.reblogPushesEnabledStream;

  @override
  Future<bool> changeReblog(bool value) =>
      pushSubscriptionBloc.changeReblogPushesEnabled(value);

  @override
  bool get poll => pushSubscriptionBloc.pollPushesEnabled;

  @override
  Stream<bool> get pollStream => pushSubscriptionBloc.pollPushesEnabledStream;

  @override
  bool get chat => pushSubscriptionBloc.chatPushesEnabled;

  @override
  Stream<bool> get chatStream => pushSubscriptionBloc.chatPushesEnabledStream;

  @override
  Future<bool> changePoll(bool value) =>
      pushSubscriptionBloc.changePollPushesEnabled(value);
  @override
  Future<bool> changeChat(bool value) =>
      pushSubscriptionBloc.changeChatPushesEnabled(value);
}

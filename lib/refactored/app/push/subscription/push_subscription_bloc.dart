import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSubscriptionBloc extends Disposable {
  static IPushSubscriptionBloc of(BuildContext context, {listen: true}) =>
      Provider.of<IPushSubscriptionBloc>(context, listen: listen);

  bool get isHaveSubscription;

  Future subscribeWithDefaultPreferences();

  bool get favouritePushesEnabled;

  Stream<bool> get favouritePushesEnabledStream;

  Future<bool> changeFavouritePushesEnabled(bool value);

  bool get followPushesEnabled;

  Stream<bool> get followPushesEnabledStream;

  Future<bool> changeFollowPushesEnabled(bool value);

  bool get mentionPushesEnabled;

  Stream<bool> get mentionPushesEnabledStream;

  Future<bool> changeMentionPushesEnabled(bool value);

  bool get reblogPushesEnabled;

  Stream<bool> get reblogPushesEnabledStream;

  Future<bool> changeReblogPushesEnabled(bool value);

  bool get pollPushesEnabled;

  Stream<bool> get pollPushesEnabledStream;

  Future<bool> changePollPushesEnabled(bool value);
}

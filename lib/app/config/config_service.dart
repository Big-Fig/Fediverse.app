import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConfigService implements IAsyncInitLoadingBloc, IDisposable {
  static IConfigService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConfigService>(context, listen: listen);

  String get appId;

  String? get appAppleId;

  String get appTitle;

  bool get logEnabled;

  bool get firebaseEnabled;

  bool get pushFcmEnabled;

  String? get pushFcmRelayUrl;

  String? get pushSubscriptionKeysP256dh;

  String? get pushSubscriptionKeysAuth;

  bool get crashlyticsEnabled;

  bool get askReviewEnabled;

  int? get askReviewCountAppOpenedToShow;

  bool get buildDebug;

  bool get buildRelease;

  bool get buildProfile;

  String get appVersionName;

  void printConfigToLog();
}

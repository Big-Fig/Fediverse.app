import 'package:fedi/app/config/config_model.dart';
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

  String get actualAppId;

  bool get logEnabled;

  bool get firebaseEnabled;

  bool get pushFcmEnabled;

  String? get pushFcmRelayUrl;

  String? get pushSubscriptionKeysP256dh;

  String? get pushSubscriptionKeysAuth;

  bool get crashlyticsEnabled;

  bool? get crashlyticsHandlingEnabledByDefault;

  bool get askReviewEnabled;

  int? get askReviewCountAppOpenedToShow;

  ConfigFlavor? get buildConfigFlavor;

  bool get buildDebug;

  bool get buildRelease;

  int get versionCode;

  String get versionName;

  void printConfigToLog();
}

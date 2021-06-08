import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';

abstract class IConfigService implements IAsyncInitLoadingBloc, IDisposable {
  String get appId;

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
}

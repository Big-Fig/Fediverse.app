import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';

class ConfigService extends AsyncInitLoadingBloc implements IConfigService {
  static IConfigService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConfigService>(context, listen: listen);

  @override
  String get appId => FlutterConfig.get('APP_ID');

  @override
  bool get logEnabled => FlutterConfig.get('LOG_ENABLED');

  @override
  bool get firebaseEnabled => FlutterConfig.get('FIREBASE_ENABLED');

  @override
  bool get pushFcmEnabled => FlutterConfig.get('PUSH_FCM_ENABLED');

  @override
  String? get pushFcmRelayUrl => FlutterConfig.get('PUSH_FCM_RELAY_URL');

  @override
  String? get pushSubscriptionKeysP256dh =>
      FlutterConfig.get('PUSH_SUBSCRIPTION_KEYS_P256DH');

  @override
  String? get pushSubscriptionKeysAuth =>
      FlutterConfig.get('PUSH_SUBSCRIPTION_KEYS_AUTH');

  @override
  bool get crashlyticsEnabled => FlutterConfig.get('CRASHLYTICS_ENABLED');

  @override
  bool? get crashlyticsHandlingEnabledByDefault =>
      FlutterConfig.get('CRASHLYTICS_HANDLING_ENABLED_BY_DEFAULT');

  @override
  bool get askReviewEnabled => FlutterConfig.get('ASK_REVIEW_ENABLED');

  @override
  int? get askReviewCountAppOpenedToShow =>
      FlutterConfig.get('ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW');

  @override
  Future internalAsyncInit() async {
    await FlutterConfig.loadEnvVariables();

    // print('config ${FlutterConfig.variables.entries.map(
    //       (entry) => '${entry.key} => ${entry.value}',
    //     ).join(
    //       ', ',
    //     )}');
  }
}

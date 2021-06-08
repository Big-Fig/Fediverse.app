import 'package:fedi/app/config/config_model.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:logging/logging.dart';

final _logger = Logger('config_service_impl.dart');

class ConfigService extends AsyncInitLoadingBloc implements IConfigService {
  @override
  String get appId => _getString('APP_ID')!;

  @override
  bool get logEnabled => _getBool('LOG_ENABLED')!;

  @override
  bool get firebaseEnabled => _getBool('FIREBASE_ENABLED')!;

  @override
  bool get pushFcmEnabled => firebaseEnabled && _getBool('PUSH_FCM_ENABLED')!;

  @override
  String? get pushFcmRelayUrl => _getString('PUSH_FCM_RELAY_URL');

  @override
  String? get pushSubscriptionKeysP256dh =>
      _getString('PUSH_SUBSCRIPTION_KEYS_P256DH');

  @override
  String? get pushSubscriptionKeysAuth =>
      _getString('PUSH_SUBSCRIPTION_KEYS_AUTH');

  @override
  bool get crashlyticsEnabled =>
      firebaseEnabled && _getBool('CRASHLYTICS_ENABLED')!;

  @override
  bool get askReviewEnabled => _getBool('ASK_REVIEW_ENABLED')!;

  @override
  int? get askReviewCountAppOpenedToShow =>
      _getInt('ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW');

  @override
  Future internalAsyncInit() async {
    await FlutterConfig.loadEnvVariables();

    assert(appId == actualAppId);
    assert(buildConfigFlavor != null);
  }

  @override
  void printConfigToLog() {
    _logger.finest('config \n'
        '${FlutterConfig.variables.entries.map(
              (entry) => '${entry.key} => ${entry.value}',
            ).join(
              ' \n',
            )}');
  }

  @override
  String get actualAppId => _getString('APPLICATION_ID')!;

  @override
  bool get buildDebug => _getBool('DEBUG')!;

  @override
  bool get buildRelease => !buildDebug;

  @override
  ConfigFlavor? get buildConfigFlavor => _getConfigFlavor('FLAVOR');

  @override
  int get versionCode => _getInt('VERSION_CODE')!;

  @override
  String get versionName => _getString('VERSION_NAME')!;
}

bool? _getBool(String key) {
  var value = FlutterConfig.get(key) as String?;

  if (value != null) {
    value = value.toLowerCase();

    return value == 'true';
  } else {
    return null;
  }
}

int? _getInt(String key) {
  var value = FlutterConfig.get(key) as String?;

  if (value != null) {
    return int.parse(value);
  } else {
    return null;
  }
}

String? _getString(String key) {
  var value = FlutterConfig.get(key) as String?;

  if (value != null) {
    return value;
  } else {
    return null;
  }
}

ConfigFlavor? _getConfigFlavor(String key) {
  var value = FlutterConfig.get(key) as String?;

  return value?.toConfigFlavor();
}

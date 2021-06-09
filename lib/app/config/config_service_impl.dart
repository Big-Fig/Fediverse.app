import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:logging/logging.dart';
import 'package:platform_info/platform_info.dart';

final _logger = Logger('config_service_impl.dart');

// ignore_for_file: avoid-late-keyword
class ConfigService extends AsyncInitLoadingBloc implements IConfigService {
  @override
  late String appId;

  @override
  late String? appAppleId;

  @override
  late String appTitle;

  @override
  late bool logEnabled;

  @override
  late bool firebaseEnabled;

  @override
  late bool pushFcmEnabled;

  @override
  late String? pushFcmRelayUrl;

  @override
  late String? pushSubscriptionKeysP256dh;

  @override
  late String? pushSubscriptionKeysAuth;

  @override
  late bool crashlyticsEnabled;

  @override
  late bool askReviewEnabled;

  @override
  late int? askReviewCountAppOpenedToShow;

  @override
  late bool buildDebug;
  @override
  late bool buildProfile;
  @override
  late bool buildRelease;

  @override
  late String appVersionName;

  @override
  // ignore: long-method
  Future internalAsyncInit() async {
    await FlutterConfig.loadEnvVariables();

    // print(
    //   FlutterConfig.variables.entries.map((entry) => '$entry').join('\n'),
    // );

    var instance = Platform.instance;
    var buildMode = instance.buildMode;

    buildDebug = buildMode == BuildMode.debug;
    buildRelease = buildMode == BuildMode.release;
    buildProfile = buildMode == BuildMode.profile;

    appVersionName = instance.version;

    appId = _getString(
      'APP_ID',
      isRequired: true,
    )!;
    appTitle = _getString(
      'APP_TITLE',
      isRequired: true,
    )!;
    appAppleId = _getString(
      'APP_APPLE_ID',
      isRequired: false,
    );

    logEnabled = _getBool(
      'LOG_ENABLED',
      isRequired: true,
    )!;

    firebaseEnabled = _getBool(
      'FIREBASE_ENABLED',
      isRequired: true,
    )!;

    pushFcmEnabled = _getBool(
      'PUSH_FCM_ENABLED',
      isRequired: true,
    )!;
    if (pushFcmEnabled) {
      assert(
        firebaseEnabled,
        'FIREBASE_ENABLED should be true '
        'if PUSH_FCM_ENABLED = true',
      );

      pushFcmRelayUrl = _getString(
        'PUSH_FCM_RELAY_URL',
        isRequired: false,
      );
      pushSubscriptionKeysP256dh = _getString(
        'PUSH_SUBSCRIPTION_KEYS_P256DH',
        isRequired: false,
      );
      pushSubscriptionKeysAuth = _getString(
        'PUSH_SUBSCRIPTION_KEYS_AUTH',
        isRequired: false,
      );

      assert(
        pushFcmRelayUrl != null &&
            pushSubscriptionKeysP256dh != null &&
            pushSubscriptionKeysAuth != null,
        'PUSH_FCM_RELAY_URL, '
        'PUSH_SUBSCRIPTION_KEYS_P256DH, '
        'PUSH_SUBSCRIPTION_KEYS_AUTH should exist '
        'if PUSH_FCM_ENABLED is true',
      );
    }

    crashlyticsEnabled = _getBool(
      'CRASHLYTICS_ENABLED',
      isRequired: true,
    )!;

    if (crashlyticsEnabled) {
      assert(
        crashlyticsEnabled,
        'FIREBASE_ENABLED should be true '
        'if CRASHLYTICS_ENABLED = true',
      );
    }

    askReviewEnabled = _getBool(
      'ASK_REVIEW_ENABLED',
      isRequired: true,
    )!;
    askReviewCountAppOpenedToShow = _getInt(
      'ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW',
      isRequired: false,
    );

    if (askReviewEnabled) {
      assert(
        askReviewCountAppOpenedToShow != null && appAppleId != null,
        'ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW, APP_APPLE_ID should exist '
        'if ASK_REVIEW_ENABLED is true',
      );
      assert(askReviewCountAppOpenedToShow! >= 0);
    }
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
}

void _checkRequiredKey({
  required String key,
}) {
  if (!FlutterConfig.variables.isNotEmpty) {
    print('Config not initialized');
  }

  if (!FlutterConfig.variables.containsKey(key)) {
    print('Key $key required but not exist');
  }
}

bool? _getBool(
  String key, {
  required bool isRequired,
}) {
  if (isRequired) {
    _checkRequiredKey(key: key);
  }

  var value = FlutterConfig.get(key);

  if (value is String?) {
    if (value != null) {
      value = value.toLowerCase();

      if (value == 'true') {
        return true;
      } else if (value == 'false') {
        return false;
      } else {
        throw '$key => $value is not bool';
      }
    } else {
      return null;
    }
  } else if (value is bool) {
    return value;
  } else {
    throw '$key => $value is not bool';
  }
}

int? _getInt(
  String key, {
  required bool isRequired,
}) {
  if (isRequired) {
    _checkRequiredKey(key: key);
  }

  var value = FlutterConfig.get(key);

  if (value is String?) {
    if (value != null) {
      return int.parse(value);
    } else {
      return null;
    }
  } else if (value is int) {
    return value;
  } else {
    throw '$key => $value is not int';
  }
}

String? _getString(
  String key, {
  required bool isRequired,
}) {
  if (isRequired) {
    _checkRequiredKey(key: key);
  }

  var value = FlutterConfig.get(key) as String?;

  if (value != null) {
    return value;
  } else {
    return null;
  }
}

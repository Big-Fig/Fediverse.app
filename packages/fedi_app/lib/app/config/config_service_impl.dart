import 'dart:convert';
import 'dart:io';

import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('config_service_impl.dart');

// ignore_for_file: avoid-late-keyword
class ConfigService extends AsyncInitLoadingBloc implements IConfigService {
  @override
  late String appTitleActual;

  @override
  late String appIdActual;

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
  late String? pushDetailsUrl;

  @override
  late String? pushFcmRelayUrl;

  @override
  late String? pushSubscriptionKeysP256dh;

  @override
  late String? pushSubscriptionKeysAuth;

  @override
  late bool crashlyticsEnabled;

  @override
  late bool? crashlyticsDefaultHandlingEnabled;

  @override
  late String? crashlyticsDetailsUrl;

  @override
  late String? helpChooseInstanceUrl;

  @override
  late int? crashlyticsAskHandlingCountAppOpenedToShow;

  @override
  late bool askReviewEnabled;

  @override
  late int? askReviewCountAppOpenedToShow;

  @override
  late String appVersionName;

  @override
  late String appVersionCode;

  @override
  late String appAddNewInstanceCallbackUrl;

  @override
  late String appDefaultInstanceUrl;

  @override
  late String? gitHubUrl;
  @override
  late String? webSiteUrl;
  @override
  late String? fediverseAccountAcct;
  @override
  late String? fediverseAccountUrl;

  @override
  late String? license;
  @override
  late String? helpTranslateUrl;
  @override
  late String? joinBetaUrlIos;
  @override
  late String? joinBetaUrlAndroid;

  late String? predefinedAccessListJsonString;

  late Map<String, dynamic>? predefinedAccessListJson;

  @override
  late String? displayInstanceUrl;

  @override
  late bool? disableSmartRefresher;

  @override
  late bool? clearDatabaseOnLaunch;

  @override
  late bool? clearLocalPreferencesOnLaunch;

  @override
  late String? actualInstanceUrlAndroid;

  @override
  late String? actualInstanceUrlIos;

  @override
  // ignore: long-method
  Future<void> internalAsyncInit() async {
    // ignore: avoid-ignoring-return-values
    await FlutterConfig.loadEnvVariables();

    // print(
    //   FlutterConfig.variables.entries.map((entry) => '$entry').join('\n'),
    // );

    var packageInfo = await PackageInfo.fromPlatform();

    appIdActual = packageInfo.packageName;
    appTitleActual = packageInfo.appName;

    appVersionName = packageInfo.version;
    appVersionCode = packageInfo.buildNumber;

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
    appDefaultInstanceUrl = _getString(
      'APP_DEFAULT_INSTANCE_URL',
      isRequired: true,
    )!;

    // not working with flutter driver on ios, they are different
    // assert(appId == appIdActual);

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
      pushDetailsUrl = _getString(
        'PUSH_DETAILS_URL',
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
            pushDetailsUrl != null &&
            pushSubscriptionKeysAuth != null,
        'PUSH_FCM_RELAY_URL, '
        'PUSH_SUBSCRIPTION_KEYS_P256DH, '
        'PUSH_DETAILS_URL, '
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

    crashlyticsDefaultHandlingEnabled = _getBool(
      'CRASHLYTICS_DEFAULT_HANDLING_ENABLED',
      isRequired: false,
    );

    crashlyticsAskHandlingCountAppOpenedToShow = _getInt(
      'CRASHLYTICS_ASK_HANDLING_COUNT_APP_OPENED_TO_SHOW',
      isRequired: false,
    );

    crashlyticsDetailsUrl = _getString(
      'CRASHLYTICS_DETAILS_URL',
      isRequired: false,
    );

    if (crashlyticsEnabled) {
      assert(
        crashlyticsDefaultHandlingEnabled != null &&
            crashlyticsDetailsUrl != null,
        'CRASHLYTICS_DEFAULT_HANDLING_ENABLED & CRASHLYTICS_DETAILS_URL should exist '
        'if CRASHLYTICS_ENABLED is true',
      );
    }

    helpChooseInstanceUrl = _getString(
      'HELP_CHOOSE_INSTANCE_URL',
      isRequired: false,
    );

    askReviewCountAppOpenedToShow = _getInt(
      'ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW',
      isRequired: false,
    );

    askReviewEnabled = _getBool(
      'ASK_REVIEW_ENABLED',
      isRequired: true,
    )!;

    if (askReviewEnabled) {
      assert(
        askReviewCountAppOpenedToShow != null && appAppleId != null,
        'ASK_REVIEW_COUNT_APP_OPENED_TO_SHOW, APP_APPLE_ID should exist '
        'if ASK_REVIEW_ENABLED is true',
      );
      assert(
        askReviewCountAppOpenedToShow! >= 0,
        'askReviewCountAppOpenedToShow should be non=negative',
      );
    }

    appAddNewInstanceCallbackUrl = '$appId://addNewInstance';

    gitHubUrl = _getString(
      'GITHUB_URL',
      isRequired: false,
    );
    webSiteUrl = _getString(
      'WEBSITE_URL',
      isRequired: false,
    );
    fediverseAccountAcct = _getString(
      'FEDIVERSE_ACCOUNT_ACCT',
      isRequired: false,
    );
    fediverseAccountUrl = _getString(
      'FEDIVERSE_ACCOUNT_URL',
      isRequired: false,
    );
    license = _getString(
      'LICENSE',
      isRequired: false,
    );

    helpTranslateUrl = _getString(
      'HELP_TRANSLATE_URL',
      isRequired: false,
    );

    joinBetaUrlIos = _getString(
      'JOIN_BETA_IOS_URL',
      isRequired: false,
    );
    joinBetaUrlAndroid = _getString(
      'JOIN_BETA_ANDROID_URL',
      isRequired: false,
    );

    predefinedAccessListJsonString = _getString(
      'PREDEFINED_ACCESS_LIST_JSON',
      isRequired: false,
    );

    if (predefinedAccessListJsonString != null) {
      predefinedAccessListJson =
          jsonDecode(predefinedAccessListJsonString!) as Map<String, dynamic>;
    }

    displayInstanceUrl = _getString(
      'DISPLAY_INSTANCE_URL',
      isRequired: false,
    );
    actualInstanceUrlIos = _getString(
      'ACTUAL_INSTANCE_URL_IOS',
      isRequired: false,
    );
    actualInstanceUrlAndroid = _getString(
      'ACTUAL_INSTANCE_URL_ANDROID',
      isRequired: false,
    );

    clearDatabaseOnLaunch = _getBool(
      'CLEAR_DATABASE_ON_LAUNCH',
      isRequired: false,
    );

    clearLocalPreferencesOnLaunch = _getBool(
      'CLEAR_LOCAL_PREFERENCES_ON_LAUNCH',
      isRequired: false,
    );
    disableSmartRefresher = _getBool(
      'DISABLE_SMART_REFRESHER',
      isRequired: false,
    );
  }

  @override
  void printConfigToLog() {
    _logger.finest(
      'config \n'
      '${FlutterConfig.variables.entries.map(
            (entry) => '${entry.key} => ${entry.value}',
          ).join(
            ' \n',
          )}',
    );
  }

  @override
  String processUrlOnInstanceForDisplay({
    required String urlOnInstance,
  }) {
    String resultUrl;

    if (displayInstanceUrl != null) {
      // ignore: parameter_assignments
      urlOnInstance = urlOnInstance.replaceAll('http://', '');
      // ignore: parameter_assignments
      urlOnInstance = urlOnInstance.replaceAll('https://', '');
      var indexOf = urlOnInstance.indexOf('/');

      String part;
      if (indexOf >= 0) {
        part = urlOnInstance.substring(indexOf);
      } else {
        part = '';
      }
      resultUrl = '$displayInstanceUrl$part';
    } else {
      resultUrl = urlOnInstance;
    }

    return resultUrl;
  }

  @override
  String processUrlOnInstanceForRequest({
    required String urlOnInstance,
  }) {
    String resultUrl;

    if (isActualInstanceUrlExist) {
      var isAndroid = Platform.isAndroid;
      urlOnInstance = urlOnInstance.replaceAll('http://', '');
      // ignore: parameter_assignments
      urlOnInstance = urlOnInstance.replaceAll('https://', '');
      var indexOf = urlOnInstance.indexOf('/');
      var actualInstanceUrl =
          isAndroid ? actualInstanceUrlAndroid : actualInstanceUrlIos;

      String part;
      if (indexOf >= 0) {
        part = urlOnInstance.substring(indexOf);
      } else {
        part = '';
      }
      resultUrl = '$actualInstanceUrl$part';
    } else {
      resultUrl = urlOnInstance;
    }

    return resultUrl;
  }

  @override
  UnifediApiAccess? tryFindPreDefinedApiAccessForHost({
    required Uri hostUri,
  }) {
    UnifediApiAccess? result;
    if (predefinedAccessListJson?.isNotEmpty == true) {
      var host = hostUri.host;

      var accessJson = predefinedAccessListJson?[host] as Map<String, dynamic>?;

      if (accessJson != null) {
        result = UnifediApiAccess.fromJson(accessJson);
      } else {
        result = null;
      }
    } else {
      result = null;
    }

    return result;
  }

  @override
  bool get isActualInstanceUrlExist =>
      (actualInstanceUrlIos != null && Platform.isIOS) ||
      (actualInstanceUrlAndroid != null && Platform.isAndroid);
}

void _checkRequiredKey({
  required String key,
}) {
  if (!FlutterConfig.variables.isNotEmpty) {
    // ignore: avoid_print
    print('Config not initialized');
  }

  if (!FlutterConfig.variables.containsKey(key)) {
    // ignore: avoid_print
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

  dynamic value = FlutterConfig.get(key);

  if (value is String?) {
    if (value != null) {
      value = value.toLowerCase();

      if (value == 'true') {
        return true;
      } else if (value == 'false') {
        return false;
      } else {
        throw ArgumentError('$key => $value is not bool');
      }
    } else {
      return null;
    }
  } else if (value is bool) {
    return value;
  } else {
    throw ArgumentError('$key => $value is not bool');
  }
}

int? _getInt(
  String key, {
  required bool isRequired,
}) {
  if (isRequired) {
    _checkRequiredKey(key: key);
  }

  dynamic value = FlutterConfig.get(key);

  if (value is String?) {
    if (value != null) {
      return int.parse(value);
    } else {
      return null;
    }
  } else if (value is int) {
    return value;
  } else {
    throw ArgumentError('$key => $value is not int');
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

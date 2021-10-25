import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/app_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConfigService implements IAsyncInitLoadingBloc, IDisposable {
  static IConfigService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConfigService>(context, listen: listen);

  String get appTitleActual;

  String get appIdActual;

  String get appId;

  String? get appAppleId;

  String get appTitle;

  bool get logEnabled;

  bool get firebaseEnabled;

  bool get pushFcmEnabled;

  String? get pushFcmRelayUrl;

  String? get pushDetailsUrl;

  String? get pushSubscriptionKeysP256dh;

  String? get pushSubscriptionKeysAuth;

  bool get crashlyticsEnabled;

  bool? get crashlyticsDefaultHandlingEnabled;

  String? get crashlyticsDetailsUrl;

  String? get helpChooseInstanceUrl;

  int? get crashlyticsAskHandlingCountAppOpenedToShow;

  bool get askReviewEnabled;

  int? get askReviewCountAppOpenedToShow;

  String get appVersionName;

  String get appVersionCode;

  String get appAddNewInstanceCallbackUrl;

  String get appDefaultInstanceUrl;

  String? get gitHubUrl;

  String? get webSiteUrl;

  String? get fediverseAccountAcct;

  String? get fediverseAccountUrl;

  String? get license;

  String? get helpTranslateUrl;

  String? get joinBetaIosUrl;

  String? get joinBetaAndroidUrl;

  String? get iosTestUnifediApiAccessJson;

  String? get androidTestUnifediApiAccessJson;

  AppLaunchType get appLaunchType;

  void printConfigToLog();
}

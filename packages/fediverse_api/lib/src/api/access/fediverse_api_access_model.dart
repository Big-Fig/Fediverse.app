import '../fediverse_api_model.dart';

import '../instance/fediverse_api_instance_model.dart';
import 'level/fediverse_api_access_level_model.dart';
import 'token/application/fediverse_api_access_application_token_model.dart';
import 'token/user/fediverse_api_access_user_token_model.dart';

abstract class IFediverseApiAccess implements IFediverseApiObject {
  String get url;

  IFediverseApiInstance? get instance;

  IFediverseApiAccessLevel get level;

  IFediverseApiAccessApplicationToken? get applicationAccessToken;

  IFediverseApiAccessUserToken? get userAccessToken;
}

extension IFediverseApiAccessExtension on IFediverseApiAccess {
  // TODO(xal): remove during refactoring, was required during migration from old API, https://github.com/xal/dart_fediverse_api/issues/1
  // ignore: avoid-non-null-assertion
  String get acct => userAccessToken!.user;

  // ignore: avoid-non-null-assertion
  String get userAtHost => '${userAccessToken!.user}@$urlHost';

  String get urlHost => Uri.parse(url).host;

  String get urlDomain => Uri.parse(url).host;

  String get urlScheme => Uri.parse(url).scheme;

  String get urlSchema => Uri.parse(url).scheme;

  bool get isHttps => urlScheme == 'https';

  String? get maxAccessToken =>
      userAccessToken?.accessToken ?? applicationAccessToken?.accessToken;

  Uri get uri => Uri.parse(url);

  bool isInstanceWithHostAndAcct({
    required String host,
    required String acct,
  }) =>
      this.acct == acct && host == urlHost;
}

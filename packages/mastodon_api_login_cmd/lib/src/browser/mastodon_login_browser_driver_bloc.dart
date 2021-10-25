import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../mastodon_login_model.dart';

abstract class IMastodonLoginBrowserDriverBloc implements IDisposable {
  MastodonLoginCredentials get credentials;

  IMastodonApiClientApplication get mastodonApiClientApplication;

  Future init();

  Future<String> performLoginAndExtractAuthCode();
}

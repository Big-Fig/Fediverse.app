import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../mastodon_login_model.dart';
import 'mastodon_login_browser_driver_bloc.dart';

final _logger = Logger('mastodon_login_browser_driver_bloc_impl.dart');

class MastodonLoginBrowserDriverBloc extends DisposableOwner
    implements IMastodonLoginBrowserDriverBloc {
  @override
  final MastodonLoginCredentials credentials;

  @override
  final IMastodonApiClientApplication mastodonApiClientApplication;

  final IFediverseBrowserBloc browserBloc = FediverseBrowserBloc();

  MastodonLoginBrowserDriverBloc({
    required this.credentials,
    required this.mastodonApiClientApplication,
  });

  @override
  Future<void> init() async {
    await browserBloc.init();
    browserBloc.disposeWith(this);
  }

  @override
  Future<String> performLoginAndExtractAuthCode() async {
    _logger.finest(() => 'performLoginAndExtractAuthCode $credentials');

    await openLoginUrl();

    await enterCredentials();

    await clickOnLoginButton();

    await waitForAuthorizeRequestPageLoadingFinishes();

    await clickOnAuthorizeButton();

    var token = await extractToken();

    _logger.finest(() => 'performLoginAndExtractAuthCode token $token');

    return token;
  }

  Future<String> extractToken() async {
    _logger.finest(() => 'extractToken');

    var oauthSelector = '.oauth-code';
    await browserBloc.waitForSelector(oauthSelector);
    // Extract the results from the page.
    var resultsSelector = oauthSelector;
    var token = await browserBloc.evaluate<String>(
      // ignore: unnecessary_raw_strings
      r'''
      resultsSelector => {
            var input = document.querySelector(resultsSelector)
  
            return input.value;
          }
      ''',
      args: <String>[resultsSelector],
    );

    return token;
  }

  Future<void> waitForAuthorizeRequestPageLoadingFinishes() async {
    _logger.finest(() => 'waitForAuthorizeRequestPageLoadingFinishes');
    await browserBloc.waitForSelector('#response_type');
  }

  Future<void> waitForAuthCodePageLoadingFinishes() async {
    _logger.finest(() => 'waitForAuthCodePageLoadingFinishes');
    await browserBloc.waitForSelector('response_type');
  }

  Future<void> clickOnLoginButton() async {
    _logger.finest(() => 'clickOnLoginButton');
    await browserBloc.clickOnSelector('.btn');
  }

  Future<void> clickOnAuthorizeButton() async {
    _logger.finest(() => 'clickOnAuthorizeButton');
    await browserBloc.clickOnSelector('button');
  }

  Future<void> enterCredentials() async {
    _logger.finest(() => 'enterCredentials');
    await browserBloc.enterTextToSelector(
      '#user_email',
      credentials.user,
    );
    await browserBloc.enterTextToSelector(
      '#user_password',
      credentials.password,
    );
  }

  Future<void> openLoginUrl() async {
    _logger.finest(() => 'openLoginUrl');
    final loginUrl =
        MastodonApiInstancePublicAccessService.calculateInstanceAuthLoginUrl(
      instanceUrl: credentials.instance,
      clientId: mastodonApiClientApplication.clientId,
      redirectUri: null,
      useDisplayCodeRedirectUri: true,
      forceLogin: false,
      scopes: MastodonApiAccessScopes.fromScopesString(credentials.scopes),
    );

    await browserBloc.openUrl(loginUrl);
  }
}

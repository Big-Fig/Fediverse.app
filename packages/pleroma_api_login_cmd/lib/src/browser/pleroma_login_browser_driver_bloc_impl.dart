import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';
import 'package:logging/logging.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../pleroma_login_helper.dart';
import '../pleroma_login_model.dart';
import 'pleroma_login_browser_driver_bloc.dart';

final _logger = Logger('pleroma_login_browser_driver_bloc_impl.dart');

class PleromaLoginBrowserDriverBloc extends DisposableOwner
    implements IPleromaLoginBrowserDriverBloc {
  @override
  final PleromaLoginCredentials credentials;

  @override
  final IPleromaApiClientApplication pleromaApiClientApplication;

  final IFediverseBrowserBloc browserBloc = FediverseBrowserBloc();

  PleromaLoginBrowserDriverBloc({
    required this.credentials,
    required this.pleromaApiClientApplication,
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

    await waitForAuthCodePageLoadingFinishes();

    var token = await extractToken();

    _logger.finest(() => 'performLoginAndExtractAuthCode token $token');

    return token;
  }

  Future<String> extractToken() async {
    _logger.finest(() => 'extractToken');
    var content = await browserBloc.extractPageHtmlContent();

    var token = PleromaLoginHelper.extractTokenFromTokenResultHtml(
      // ignore: avoid-non-null-assertion
      content!,
    );

    return token;
  }

  Future<void> waitForAuthCodePageLoadingFinishes() async {
    _logger.finest(() => 'waitForAuthCodePageLoadingFinishes');
    await browserBloc.waitForSelector('h2');
  }

  Future<void> clickOnLoginButton() async {
    _logger.finest(() => 'clickOnLoginButton');
    await browserBloc.clickOnSelector('button');
  }

  Future<void> enterCredentials() async {
    _logger.finest(() => 'enterCredentials');
    await browserBloc.enterTextToSelector(
      '#authorization_name',
      credentials.user,
    );
    await browserBloc.enterTextToSelector(
      '#authorization_password',
      credentials.password,
    );
  }

  Future<void> openLoginUrl() async {
    _logger.finest(() => 'openLoginUrl');
    final loginUrl =
        PleromaApiInstancePublicAccessService.calculateInstanceAuthLoginUrl(
      instanceUrl: credentials.instance,
      clientId: pleromaApiClientApplication.clientId,
      redirectUri: null,
      useDisplayCodeRedirectUri: true,
      forceLogin: false,
      scopes: PleromaApiAccessScopes.fromScopesString(credentials.scopes),
    );

    await browserBloc.openUrl(loginUrl);
  }
}

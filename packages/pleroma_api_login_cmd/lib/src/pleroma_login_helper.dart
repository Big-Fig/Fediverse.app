import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api_login_cmd/mastodon_api_login_cmd.dart';
import 'package:pleroma_api/pleroma_api.dart';

import 'browser/pleroma_login_browser_driver_bloc_impl.dart';
import 'pleroma_login_model.dart';

final _logger = Logger('pleroma_login_helper.dart');

class PleromaLoginHelper {
  static const allScopes = MastodonLoginHelper.allScopes;
  static const defaultScopes = allScopes;
  static const String? defaultWebsite = MastodonLoginHelper.defaultWebsite;
  static const defaultClientName = MastodonLoginHelper.defaultClientName;

  static Future<IPleromaApiClientApplication> registerApp({
    required String host,
    String clientName = defaultClientName,
    String scopes = defaultScopes,
    String? website = defaultWebsite,
  }) async {
    var accessBloc = PleromaApiAccessBloc(
      access: PleromaApiAccess(
        url: host,
        instance: null,
        applicationAccessToken: null,
        userAccessToken: null,
      ),
    );

    var restService = HttpRestService(
      baseUri: Uri.parse(host),
      computeImpl: null,
      encoding: IRestService.defaultEncoding,
      customRestResponseErrorExceptionCreator: (restError) =>
          PleromaApiRestErrorException(
        pleromaError:
            PleromaApiRestService.convertRestErrorToPleromaError(restError),
      ),
    );
    var pleromaApiRestService = PleromaApiRestService(
      restService: restService,
      accessBloc: accessBloc,
    );
    var pleromaApiInstanceService = PleromaApiInstancePublicAccessService(
      restService: pleromaApiRestService,
    );

    try {
      return pleromaApiInstanceService.registerApp(
        clientName: clientName,
        redirectUri: null,
        useDisplayCodeRedirectUri: true,
        scopes: PleromaApiAccessScopes.fromScopesString(scopes),
        website: website,
      );
    } finally {
      await pleromaApiInstanceService.dispose();
      await pleromaApiRestService.dispose();
      await restService.dispose();
      await accessBloc.dispose();
    }
  }

  static String extractTokenFromTokenResultHtml(String pageHtml) {
    var startPhrase = 'Token code is <br>';
    var start = pageHtml.indexOf(startPhrase);
    var end = pageHtml.indexOf('</h2>', start);
    var token = pageHtml.substring(start + startPhrase.length, end);

    _logger.finest(() => 'extractTokenFromTokenResultHtml $token');

    return token;
  }

  static Future<String> performLoginAndExtractToken({
    required PleromaLoginCredentials credentials,
  }) async {
    String token;
    PleromaLoginBrowserDriverBloc? pleromaLoginBrowserDriverBloc;

    try {
      var pleromaApiClientApplication = await PleromaLoginHelper.registerApp(
        host: credentials.instance,
        scopes: credentials.scopes,
      );

      pleromaLoginBrowserDriverBloc = PleromaLoginBrowserDriverBloc(
        credentials: credentials,
        pleromaApiClientApplication: pleromaApiClientApplication,
      );

      await pleromaLoginBrowserDriverBloc.init();
      token =
          await pleromaLoginBrowserDriverBloc.performLoginAndExtractAuthCode();
    } finally {
      await pleromaLoginBrowserDriverBloc?.dispose();
    }

    return token;
  }
}

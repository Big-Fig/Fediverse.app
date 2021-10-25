import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import './mastodon_login_model.dart';
import 'browser/mastodon_login_browser_driver_bloc_impl.dart';

class MastodonLoginHelper {
  static const allScopes = 'read write follow push';
  static const defaultScopes = allScopes;
  static const String? defaultWebsite = null;
  static const defaultClientName = 'Test';

  static Future<IMastodonApiClientApplication> registerApp({
    required String host,
    String clientName = defaultClientName,
    String scopes = defaultScopes,
    String? website = defaultWebsite,
  }) async {
    var accessBloc = MastodonApiAccessBloc(
      access: MastodonApiAccess(
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
      customRestResponseErrorExceptionCreator: (restError) {
        var mastodonApiRestError =
            MastodonApiRestService.convertRestErrorToMastodonError(restError);

        return MastodonApiRestErrorException(
          mastodonError: mastodonApiRestError,
        );
      },
    );
    var mastodonApiRestService = MastodonApiRestService(
      restService: restService,
      accessBloc: accessBloc,
    );
    var mastodonApiInstancePublicAccessService =
        MastodonApiInstancePublicAccessService(
      restService: mastodonApiRestService,
    );

    try {
      return mastodonApiInstancePublicAccessService.registerApp(
        clientName: clientName,
        redirectUri: null,
        useDisplayCodeRedirectUri: true,
        scopes: MastodonApiAccessScopes.fromScopesString(scopes),
        website: website,
      );
    } finally {
      await mastodonApiInstancePublicAccessService.dispose();
      await mastodonApiRestService.dispose();
      await restService.dispose();
    }
  }

  static Future<String> performLoginAndExtractToken({
    required MastodonLoginCredentials credentials,
  }) async {
    String token;
    MastodonLoginBrowserDriverBloc? mastodonLoginBrowserDriverBloc;

    try {
      var mastodonApiClientApplication = await MastodonLoginHelper.registerApp(
        host: credentials.instance,
        scopes: credentials.scopes,
      );

      mastodonLoginBrowserDriverBloc = MastodonLoginBrowserDriverBloc(
        credentials: credentials,
        mastodonApiClientApplication: mastodonApiClientApplication,
      );

      await mastodonLoginBrowserDriverBloc.init();
      token =
          await mastodonLoginBrowserDriverBloc.performLoginAndExtractAuthCode();
    } finally {
      await mastodonLoginBrowserDriverBloc?.dispose();
    }

    return token;
  }
}

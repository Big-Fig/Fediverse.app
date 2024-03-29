import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/host/access_token/access_host_access_token_local_preference_bloc.dart';
import 'package:fedi_app/app/access/host/access_token/access_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/access/host/application/access_host_application_local_preference_bloc.dart';
import 'package:fedi_app/app/access/host/application/access_host_application_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/access/memory_access_bloc_impl.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:fedi_app/app/auth/host/access_host_bloc.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_pleroma_adapter.dart';
import 'package:url_launcher/url_launcher.dart';

var _logger = Logger('access_host_bloc_impl.dart');

class AccessHostBloc extends AsyncInitLoadingBloc implements IAccessHostBloc {
  final Uri instanceBaseUri;

  String get instanceBaseUriString => instanceBaseUri.toString();

  String get instanceBaseUriHost => instanceBaseUri.host;

  String get instanceBaseUriScheme => instanceBaseUri.scheme;

  // ignore: avoid-late-keyword
  late UnifediApiAccessScopes scopes;

  // ignore: avoid-late-keyword
  late IUnifediApiInstanceService unifediApiInstanceService;

  // ignore: avoid-late-keyword
  late IUnifediApiManager unifediApiManager;

  // ignore: avoid-late-keyword
  late IUnifediApiAccountService unifediApiAccountService;

  // ignore: avoid-late-keyword
  late IAccessHostApplicationLocalPreferenceBloc
      hostApplicationLocalPreferenceBloc;

  // ignore: avoid-late-keyword
  late IAccessHostAccessTokenLocalPreferenceBloc
      hostAccessTokenLocalPreferenceBloc;

  // ignore: avoid-late-keyword
  late ICurrentAccessBloc currentInstanceBloc;
  final IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      oAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final IConnectionService connectionService;
  final IConfigService configService;

  // ignore: avoid-late-keyword
  late MemoryAccessBloc memoryUnifediApiAccessBloc;

  AccessHostBloc({
    required this.instanceBaseUri,
    required this.oAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required ILocalPreferencesService preferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.configService,
  }) {
    hostApplicationLocalPreferenceBloc =
        AccessHostApplicationLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    hostAccessTokenLocalPreferenceBloc =
        AccessHostAccessTokenLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    memoryUnifediApiAccessBloc = MemoryAccessBloc(
      configService: configService,
      access: UnifediApiAccess(
        url: instanceBaseUri.toString(),
        instance: null,
        applicationAccessToken: null,
        userAccessToken: null,
      ),
    )..disposeWith(this);
  }

  @override
  UnifediApiClientApplication? get hostApplication =>
      hostApplicationLocalPreferenceBloc.value;

  @override
  Stream<UnifediApiClientApplication?> get hostApplicationStream =>
      hostApplicationLocalPreferenceBloc.stream;

  @override
  UnifediApiOAuthToken? get hostAccessToken =>
      hostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream =>
      hostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostAccessTokenExist =>
      memoryUnifediApiAccessBloc.access.applicationAccessToken != null;

  @override
  bool get isHostApplicationRegistered =>
      memoryUnifediApiAccessBloc.access.applicationAccessToken != null;

  @override
  Future<void> registerApplication() async {
    _logger.finest(() => 'registerApplication');
    var alreadyRegistered = memoryUnifediApiAccessBloc
            .access.applicationAccessToken?.clientApplication !=
        null;
    if (alreadyRegistered) {
      return;
    }
    var redirectUri = await _calculateRedirectUri();

    var application = await unifediApiInstanceService.registerApp(
      clientName: 'Fedi',
      redirectUri: redirectUri,
      useDisplayCodeRedirectUri: false,
      scopes: scopes,
      website: 'https://www.fediapp.com/',
    );

    var appToken = await unifediApiInstanceService.retrieveAppAccessToken(
      scopes: scopes,
      redirectUri: redirectUri,
      displayCodeRedirectUriWasUsed: false,
      clientId: application.clientId!,
      clientSecret: application.clientSecret!,
    );

    _logger.finest(() => 'registerApplication application = $application');
    await hostApplicationLocalPreferenceBloc.setValue(
      application.toUnifediApiClientApplication(),
    );

    memoryUnifediApiAccessBloc.changeAccess(
      memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
            applicationAccessToken: UnifediApiAccessApplicationToken(
              scopes: scopes,
              oauthToken: appToken.toUnifediApiOAuthToken(),
              clientApplication: application.toUnifediApiClientApplication(),
            ),
          ),
    );
  }

  Future<String> _calculateRedirectUri() async {
    var redirectUri = configService.appAddNewInstanceCallbackUrl;

    return redirectUri;
  }

  @override
  Future<UnifediApiAccess?> launchLoginToAccount() async {
    _logger.finest(() => 'launchLoginToAccount');
    await registerApplication();

    var baseUrl =
        Uri.parse(unifediApiInstanceService.restService.accessBloc.access.url);

    await oAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .setValue(baseUrl.toString());

    var authCode = await launchAuthorizeFormAndExtractAuthorizationCode(
      unifediApiInstanceService: unifediApiInstanceService,
      redirectUri: await _calculateRedirectUri(),
      scopes: scopes,
      clientId: hostApplication!.clientId!,
    );
    if (authCode != null) {
      // clear lastLaunch on success login
      await oAuthLastLaunchedHostToLoginLocalPreferenceBloc
          .setValue(baseUrl.toString());

      var instance = await loginWithAuthCode(authCode);

      return instance;
    } else {
      return null;
    }
  }

  @override
  Future<UnifediApiAccess> loginWithAuthCode(String authCode) async {
    var token =
        await unifediApiInstanceService.retrieveAccountAccessTokenFromAuthCode(
      redirectUri: await _calculateRedirectUri(),
      displayCodeRedirectUriWasUsed: false,
      scopes: scopes,
      authCode: authCode,
      clientSecret: hostApplication!.clientSecret!,
      clientId: hostApplication!.clientId!,
    );

    memoryUnifediApiAccessBloc.changeAccess(
      memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
            userAccessToken: UnifediApiAccessUserToken(
              user: '',
              oauthToken: token.toUnifediApiOAuthToken(),
              scopes: scopes,
              myAccount: null,
            ),
          ),
    );

    return _createInstanceFromToken(
      token: token,
      authCode: authCode,
    );
  }

  Future<UnifediApiAccess> _createInstanceFromToken({
    required IUnifediApiOAuthToken token,
    required String authCode,
  }) async {
    await loadInstanceDetails();

    var instance = await _createUnifediApiAccess(
      authCode: authCode,
      token: token,
    );

    memoryUnifediApiAccessBloc.changeAccess(instance);

    return instance;
  }

  Future<UnifediApiAccess> _createUnifediApiAccess({
    required String? authCode,
    required IUnifediApiOAuthToken token,
  }) async {
    var unifediApiMyAccountService = unifediApiManager.createMyAccountService();
    var myAccount = await unifediApiMyAccountService.verifyMyCredentials();

    var instance = UnifediApiAccess(
      url: instanceBaseUri.toString(),
      instance:
          memoryUnifediApiAccessBloc.access.instance?.toUnifediApiInstance(),
      applicationAccessToken: memoryUnifediApiAccessBloc
          .access.applicationAccessToken!
          .toUnifediApiAccessApplicationToken(),
      userAccessToken: UnifediApiAccessUserToken(
        oauthToken: token.toUnifediApiOAuthToken(),
        scopes: scopes,
        user: myAccount.acct,
        myAccount: myAccount.toUnifediApiMyAccount(),
      ),
    );
    //
    // var instance = UnifediApiAccess(
    //   urlHost: instanceBaseUriHost.toLowerCase(),
    //   urlSchema: instanceBaseUriScheme,
    //   authCode: authCode,
    //   token: token.toUnifediApiOAuthToken(),
    //   acct: myAccount.acct,
    //   application: hostApplication,
    //   info: hostInstance.toUnifediApiInstance(),
    //   // todo: replace with isPleroma getter with same logic
    //   isPleroma: hostInstance.typeAsUnifediApi.isPleroma,
    // );
    await unifediApiMyAccountService.dispose();

    return instance;
  }

  @override
  // todo: fix long-method
  // ignore: long-method
  Future<RegisterAccessResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  }) async {
    await registerApplication();

    var registerAccountResponse =
        await unifediApiAccountService.registerAccount(
      registerAccount: registerAccount,
    );

    IUnifediApiMyAccount? myAccount;

    var token = registerAccountResponse.authToken;

    RegisterAccessResponse registerResponse;

    if (token != null) {
      var unifediApiMyAccountService =
          unifediApiManager.createMyAccountService();

      UnifediApiAccessUserToken unifediApiAccessUserToken;
      unifediApiAccessUserToken = UnifediApiAccessUserToken(
        myAccount: null,
        user: registerAccount.username,
        scopes: scopes,
        oauthToken: token.toUnifediApiOAuthToken(),
      );
      memoryUnifediApiAccessBloc.changeAccess(
        memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
              userAccessToken: unifediApiAccessUserToken,
            ),
      );

      registerResponse = RegisterAccessResponse(
        access: memoryUnifediApiAccessBloc.access,
        response: registerAccountResponse,
        myAccount: myAccount?.toUnifediApiMyAccount(),
      );

      try {
        myAccount = await unifediApiMyAccountService.verifyMyCredentials();

        unifediApiAccessUserToken = UnifediApiAccessUserToken(
          myAccount: myAccount.toUnifediApiMyAccount(),
          user: registerAccount.username,
          scopes: scopes,
          oauthToken: token.toUnifediApiOAuthToken(),
        );

        registerResponse = RegisterAccessResponse(
          access: memoryUnifediApiAccessBloc.access,
          response: registerAccountResponse,
          myAccount: myAccount.toUnifediApiMyAccount(),
        );
      } on IUnifediApiRestErrorException catch (e, stackTrace) {
        _logger.finest(
          () => 'error during loading myAccount',
          e,
          stackTrace,
        );
        var identifierAsUnifediApi =
            e.unifediError.details?.identifierAsUnifediApi;

        identifierAsUnifediApi?.maybeWhen(
          missingConfirmedEmail: (_) {
            registerResponse = RegisterAccessResponse(
              access: registerResponse.access,
              response: registerResponse.response
                  .toUnifediApiRegisterAccountResponse()
                  .copyWith(
                    emailConformationRequired: true,
                  ),
              myAccount: registerResponse.myAccount,
            );
          },
          awaitingApproval: (_) {
            registerResponse = RegisterAccessResponse(
              access: registerResponse.access,
              response: registerResponse.response
                  .toUnifediApiRegisterAccountResponse()
                  .copyWith(
                    approvalRequired: true,
                  ),
              myAccount: registerResponse.myAccount,
            );
          },
          // ignore: no-empty-block
          orElse: () {
            // nothing
          },
        );
      } finally {
        await unifediApiMyAccountService.dispose();
      }

      memoryUnifediApiAccessBloc.changeAccess(
        memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
              userAccessToken: unifediApiAccessUserToken,
            ),
      );
    } else {
      registerResponse = RegisterAccessResponse(
        access: null,
        myAccount: null,
        response: registerAccountResponse,
      );
    }

    return registerResponse;
  }

  static AccessHostBloc createFromContext(
    BuildContext context, {
    required Uri instanceBaseUri,
  }) =>
      AccessHostBloc(
        instanceBaseUri: instanceBaseUri,
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        connectionService:
            Provider.of<IConnectionService>(context, listen: false),
        currentInstanceBloc: ICurrentAccessBloc.of(context, listen: false),
        oAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        configService: IConfigService.of(
          context,
          listen: false,
        ),
      );

  @override
  Future<void> logout() async {
    var currentInstance = currentInstanceBloc.currentInstance!;

    var instance = currentInstance;
    try {
      await unifediApiInstanceService.revokeAccessToken(
        clientId: instance.applicationAccessToken!.clientApplication.clientId!,
        clientSecret:
            instance.applicationAccessToken!.clientApplication.clientSecret!,
        token: instance.userAccessToken!.accessToken,
      );
    } finally {
      await currentInstanceBloc.logoutCurrentInstance();
    }
  }

  @override
  Future<void> internalAsyncInit() async {
    await hostApplicationLocalPreferenceBloc.performAsyncInit();
    await hostAccessTokenLocalPreferenceBloc.performAsyncInit();

    var unifediApiClientApplication = hostApplicationLocalPreferenceBloc.value;
    var unifediApiOAuthToken = hostAccessTokenLocalPreferenceBloc.value;
    if (unifediApiClientApplication != null && unifediApiOAuthToken != null) {
      var scopes = IPleromaApiAccessScopes.calculateAvailableScopes(
        const PleromaApiVersion(
          major: 2,
          minor: 4,
          patch: 51,
          buildNumber: 116,
          commit: 'gd86b10a5',
          mastodonCompatibilityVersion: MastodonApiVersion(
            major: 2,
            minor: 7,
            patch: 2,
            buildNumber: null,
            commit: null,
          ),
        ),
      ).toUnifediApiAccessScopesPleromaAdapter().toUnifediApiAccessScopes();

      memoryUnifediApiAccessBloc.changeAccess(
        memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
              applicationAccessToken: UnifediApiAccessApplicationToken(
                scopes: scopes,
                clientApplication: unifediApiClientApplication,
                oauthToken: unifediApiOAuthToken,
              ),
            ),
      );
    }

    await oAuthLastLaunchedHostToLoginLocalPreferenceBloc.performAsyncInit();

    var detectorBloc = UnifediApiInstanceTypeDetectorBloc();
    var instanceType = await detectorBloc.detectInstanceType(
      url: instanceBaseUri.toString(),
    );
    var webSocketsModeSettingsBloc = WebSocketsModeSettingsBloc(
      mode: WebSocketsMode.disabledValue,
    );
    // ignore: cascade_invocations
    webSocketsModeSettingsBloc.disposeWith(this);
    if (instanceType.isPleroma) {
      unifediApiManager = createPleromaApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
        webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
      );
    } else {
      unifediApiManager = createMastodonApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
        webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
      );
    }

    unifediApiInstanceService = unifediApiManager.createInstanceService();

    await loadInstanceDetails();

    unifediApiAccountService = unifediApiManager.createAccountService();

    // todo: remove hack
    scopes = unifediApiInstanceService
        .calculateAvailableScopes()
        .toUnifediApiAccessScopes()
        .copyWith(
      targetPermissions: [],
    );

    await detectorBloc.dispose();
  }

  Future<void> loadInstanceDetails({
    bool forceRefresh = false,
  }) async {
    if (forceRefresh || memoryUnifediApiAccessBloc.access.instance == null) {
      var instance = await unifediApiInstanceService.getInstance();
      memoryUnifediApiAccessBloc.changeAccess(
        memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
              instance: instance.toUnifediApiInstance(),
            ),
      );
    }
  }
}

@override
Future<String?> launchAuthorizeFormAndExtractAuthorizationCode({
  required IUnifediApiInstanceService unifediApiInstanceService,
  required String redirectUri,
  required IUnifediApiAccessScopes scopes,
  required String clientId,
}) async {
  _logger.finest(() => 'launchAuthorizeFormAndExtractAuthorizationCode');

  var url = unifediApiInstanceService.calculateAuthLoginUrl(
    forceLogin: null,
    clientId: clientId,
    redirectUri: redirectUri,
    useDisplayCodeRedirectUri: false,
    scopes: scopes,
  );
  var isCanLaunch = await canLaunch(url);

  _logger.finest(
    () => 'launchAuthorizeFormAndExtractAuthorizationCode \n'
        '\t url = $url\n'
        '\t canLaunch=$isCanLaunch',
  );

  var completer = Completer<String>();

  // ignore: avoid-late-keyword
  late StreamSubscription<Uri?> subscription;
  subscription = uriLinkStream.listen(
    (Uri? uri) {
      subscription.cancel();
      closeWebView();
      var code = unifediApiInstanceService.extractAuthCodeFromCallbackUrl(
        uri.toString(),
      );
      completer.complete(code);
    },
    onError: (Object e) {
      subscription.cancel();
      closeWebView();
      completer.completeError(e);
    },
  );
  _logger.finest(() => 'launch url=$url');
  var launchSuccess = await launch(url);
  _logger.finest(() => 'launchSuccess $launchSuccess');

  return completer.future;
}

import 'dart:async';

import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/mastodon/application/mastodon_application_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_service.dart';
import 'package:fedi/pleroma/application/pleroma_application_service_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_service.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_service_impl.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final redirectUri = "com.fediverse.app2://addNewInstance";
final scopes = "read write follow push";

var _logger = Logger("auth_host_bloc_impl.dart");

class AuthHostBloc extends AsyncInitLoadingBloc implements IAuthHostBloc {
  final Uri instanceBaseUrl;

  String get instanceBaseUrlString => instanceBaseUrl.toString();

  String get instanceBaseUrlHost => instanceBaseUrl.host;

  String get instanceBaseUrlSchema => instanceBaseUrl.scheme;
  IPleromaApplicationService pleromaApplicationService;
  IRestService restService;
  IPleromaRestService pleromaRestService;
  IPleromaOAuthService pleromaOAuthService;
  IPleromaAccountPublicService pleromaAccountPublicService;
  IAuthHostApplicationLocalPreferenceBloc hostApplicationLocalPreferenceBloc;
  IAuthHostAccessTokenLocalPreferenceBloc hostAccessTokenLocalPreferenceBloc;
  ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
  pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final IConnectionService connectionService;

  AuthHostBloc({
    @required this.instanceBaseUrl,
    @required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    @required ILocalPreferencesService preferencesService,
    @required this.connectionService,
    @required this.currentInstanceBloc,
  }) {
    assert(instanceBaseUrlSchema?.isNotEmpty == true);
    assert(instanceBaseUrlHost?.isNotEmpty == true);
    hostApplicationLocalPreferenceBloc = AuthHostApplicationLocalPreferenceBloc(
        preferencesService, instanceBaseUrlHost);
    addDisposable(disposable: hostApplicationLocalPreferenceBloc);
    hostAccessTokenLocalPreferenceBloc = AuthHostAccessTokenLocalPreferenceBloc(
        preferencesService, instanceBaseUrlHost);
    addDisposable(disposable: hostAccessTokenLocalPreferenceBloc);
    restService = RestService(baseUrl: instanceBaseUrl);
    addDisposable(disposable: restService);
    pleromaRestService = PleromaRestService(
        restService: restService, connectionService: connectionService);
    addDisposable(disposable: pleromaRestService);

    pleromaApplicationService =
        PleromaApplicationService(restService: pleromaRestService);
    addDisposable(disposable: pleromaApplicationService);
    pleromaOAuthService = PleromaOAuthService(restService: pleromaRestService);
    addDisposable(disposable: pleromaOAuthService);
    pleromaAccountPublicService =
        PleromaAccountPublicService(restService: pleromaRestService);
    addDisposable(disposable: pleromaAccountPublicService);
  }

  @override
  PleromaClientApplication get hostApplication =>
      hostApplicationLocalPreferenceBloc.value;

  @override
  Stream<PleromaClientApplication> get hostApplicationStream =>
      hostApplicationLocalPreferenceBloc.stream;

  @override
  bool get isHostAccessTokenExist => hostAccessToken != null;

  @override
  PleromaOAuthToken get hostAccessToken =>
      hostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<PleromaOAuthToken> get hostAccessTokenStream =>
      hostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostApplicationRegistered => hostApplication != null;

  @override
  Future<bool> registerApplication() async {
    _logger.finest(() => "registerApplication");
    var application = await pleromaApplicationService.registerApp(
        registrationRequest: MastodonApplicationRegistrationRequest(
            clientName: "Fediverse",
            redirectUris: redirectUri,
            scopes: scopes,
            website: "https://fediverse.app"));

    _logger.finest(() => "registerApplication application =$application");
    if (application != null) {
      await hostApplicationLocalPreferenceBloc.setValue(application);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> retrieveAppAccessToken() async {
    var accessToken = await pleromaOAuthService.retrieveAppAccessToken(
        tokenRequest: PleromaOAuthAppTokenRequest(
      redirectUri: redirectUri,
      scope: scopes,
      clientSecret: hostApplication.clientSecret,
      clientId: hostApplication.clientId,
    ));

    if (accessToken != null) {
      await hostAccessTokenLocalPreferenceBloc.setValue(accessToken);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<AuthInstance> launchLoginToAccount() async {
    _logger.finest(() => "launchLoginToAccount");
    await checkApplicationRegistration();

    var baseUrl = pleromaOAuthService.restService.baseUrl;

    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .setValue(baseUrl.toString());

    var authCode = await pleromaOAuthService
        .launchAuthorizeFormAndExtractAuthorizationCode(
      authorizeRequest: PleromaOAuthAuthorizeRequest(
          redirectUri: redirectUri,
          scope: scopes,
          forceLogin: true,
          clientId: hostApplication.clientId),
    );
    if (authCode != null) {
      // clear lastLaunch on success login
      await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
          .setValue(baseUrl.toString());

      AuthInstance instance = await loginWithAuthCode(authCode);

      return instance;
    } else {
      return null;
    }
  }

  @override
  Future<AuthInstance> loginWithAuthCode(String authCode) async {
    var token = await pleromaOAuthService.retrieveAccountAccessToken(
        tokenRequest: PleromaOAuthAccountTokenRequest(
      redirectUri: redirectUri,
      scope: scopes,
      code: authCode,
      clientSecret: hostApplication.clientSecret,
      clientId: hostApplication.clientId,
    ));

    var restService = RestService(baseUrl: instanceBaseUrl);
    var pleromaAuthRestService = PleromaAuthRestService(
        accessToken: token.accessToken,
        connectionService: connectionService,
        restService: restService);
    var pleromaMyAccountService =
        PleromaMyAccountService(restService: pleromaAuthRestService);

    var pleromaInstanceService =
        PleromaInstanceService(restService: pleromaAuthRestService);

    var hostInstance = await pleromaInstanceService.getInstance();

    var myAccount = await pleromaMyAccountService.verifyCredentials();

    var instance = AuthInstance(
        urlHost: instanceBaseUrlHost.toLowerCase(),
        urlSchema: instanceBaseUrlSchema,
        authCode: authCode,
        token: token,
        acct: myAccount.acct,
        application: hostApplication,
        info: hostInstance,
        isPleromaInstance: myAccount.pleroma != null);
    currentInstanceBloc.changeCurrentInstance(instance);

    pleromaMyAccountService.dispose();
    pleromaInstanceService.dispose();
    pleromaAuthRestService.dispose();
    return instance;
  }

  @override
  Future<bool> registerAccount(
      {@required IPleromaAccountRegisterRequest request}) async {
    await checkApplicationRegistration();
    await checkHostAccessTokenRegistration();

    return pleromaAccountPublicService.registerAccount(
        request: request, appAccessToken: hostAccessToken.accessToken);
  }

  @override
  Future checkApplicationRegistration() async {
    _logger.finest(
        () => "checkApplicationRegistration $isHostApplicationRegistered");
    if (!isHostApplicationRegistered) {
      var success = await registerApplication();
      _logger.finest(() => "checkApplicationRegistration "
          "success=$success");
      if (!success) {
        throw "Can't register app";
      }
    }
  }

  Future checkHostAccessTokenRegistration() async {
    if (!isHostAccessTokenExist) {
      var success = await retrieveAppAccessToken();

      if (!success) {
        throw "Can't retrieve app access token";
      }
    }
  }

  static AuthHostBloc createFromContext(BuildContext context,
          {@required Uri instanceBaseUrl}) =>
      AuthHostBloc(
          instanceBaseUrl: instanceBaseUrl,
          preferencesService:
              ILocalPreferencesService.of(context, listen: false),
          connectionService: IConnectionService.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false),
          pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
              IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
                  context,
                  listen: false));

  @override
  Future logout() async {
    var currentInstance = currentInstanceBloc.currentInstance;
    assert(currentInstance != null);

    var instance = currentInstance;
    await pleromaOAuthService.revokeToken(
        revokeRequest: PleromaOAuthAppTokenRevokeRequest(
            clientId: instance.application.clientId,
            clientSecret: instance.application.clientSecret,
            token: instance.token.accessToken));
    await currentInstanceBloc.logoutCurrentInstance();
  }

  @override
  Future internalAsyncInit() async {
    await hostApplicationLocalPreferenceBloc.performAsyncInit();
    await hostAccessTokenLocalPreferenceBloc.performAsyncInit();
    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .performAsyncInit();
  }
}

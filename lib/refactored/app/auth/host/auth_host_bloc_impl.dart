import 'package:fedi/refactored/app/auth/host/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/connection/connection_service.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';
import 'package:fedi/refactored/mastodon/application/mastodon_application_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_service.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_service_impl.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_service.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_service_impl.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/refactored/rest/rest_service.dart';
import 'package:fedi/refactored/rest/rest_service_impl.dart';
import 'package:flutter/cupertino.dart';

final redirectUri = "com.fediverse.app://addNewInstance";
final scopes = "read write follow push";

class AuthHostBloc extends DisposableOwner implements IAuthHostBloc {
  final Uri instanceBaseUrl;

  String get instanceBaseUrlString => instanceBaseUrl.toString();

  String get instanceBaseUrlHost => instanceBaseUrl.host;

  String get instanceBaseUrlSchema => instanceBaseUrl.scheme;
  IPleromaApplicationService pleromaApplicationService;
  IRestService restService;
  IPleromaRestService pleromaRestService;
  IPleromaOAuthService pleromaOAuthService;
  IPleromaAccountPublicService pleromaAccountPublicService;
  IAuthHostApplicationLocalPreferenceBloc
      authHostApplicationLocalPreferenceBloc;
  IAuthHostAccessTokenLocalPreferenceBloc
      authHostAccessTokenLocalPreferenceBloc;
  ICurrentInstanceBloc currentInstanceBloc;
  final IConnectionService connectionService;

  AuthHostBloc({
    @required this.instanceBaseUrl,
    @required ILocalPreferencesService preferencesService,
    @required this.connectionService,
    @required this.currentInstanceBloc,
  }) {
    assert(instanceBaseUrlSchema?.isNotEmpty == true);
    assert(instanceBaseUrlHost?.isNotEmpty == true);
    authHostApplicationLocalPreferenceBloc =
        AuthHostApplicationLocalPreferenceBloc(
            preferencesService, instanceBaseUrlHost);
    addDisposable(disposable: authHostApplicationLocalPreferenceBloc);
    authHostAccessTokenLocalPreferenceBloc =
        AuthHostAccessTokenLocalPreferenceBloc(
            preferencesService, instanceBaseUrlHost);
    addDisposable(disposable: authHostAccessTokenLocalPreferenceBloc);
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
      authHostApplicationLocalPreferenceBloc.value;

  @override
  Stream<PleromaClientApplication> get hostApplicationStream =>
      authHostApplicationLocalPreferenceBloc.stream;

  bool get isHostAccessTokenExist => hostAccessToken != null;

  @override
  PleromaOAuthToken get hostAccessToken =>
      authHostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<PleromaOAuthToken> get hostAccessTokenStream =>
      authHostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostApplicationRegistered => hostApplication != null;

  @override
  Future<bool> registerApplication() async {
    var application = await pleromaApplicationService.registerApp(
        registrationRequest: MastodonApplicationRegistrationRequest(
            clientName: "Fediverse",
            redirectUris: redirectUri,
            scopes: scopes,
            website: "https://fediverse.app"));

    if (application != null) {
      authHostApplicationLocalPreferenceBloc.setValue(application);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> retrieveAppAccessToken() async {
    var accessToken = await pleromaOAuthService.retrieveAppAccessToken(
        tokenRequest: PleromaOAuthAppTokenRequest(
      redirectUri: redirectUri,
      scope: scopes,
      clientSecret: hostApplication.clientSecret,
      clientId: hostApplication.clientId,
    ));

    if (accessToken != null) {
      authHostAccessTokenLocalPreferenceBloc.setValue(accessToken);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> launchLoginToAccount(
      {@required InstanceCallback successCallback,
      @required Function(dynamic error) errorCallback}) async {
    await checkApplicationRegistration();
    return pleromaOAuthService.launchAuthorizeFormAndExtractAuthorizationCode(
        authorizeRequest: PleromaOAuthAuthorizeRequest(
            redirectUri: redirectUri,
            scope: scopes,
            forceLogin: true,
            clientId: hostApplication.clientId),
        successCallback: (authCode) async {
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

          var myAccount = await pleromaMyAccountService.verifyCredentials();

          var instance = Instance(
              urlHost: instanceBaseUrlHost.toLowerCase(),
              urlSchema: instanceBaseUrlSchema,
              authCode: authCode,
              token: token,
              acct: myAccount.acct,
              application: hostApplication,
              isPleromaInstance: myAccount.pleroma != null);
          currentInstanceBloc.changeCurrentInstance(instance);
        },
        errorCallback: errorCallback);
  }

  @override
  Future<bool> registerAccount(
      {@required IPleromaAccountRegisterRequest request}) async {
    await checkApplicationRegistration();
    await checkHostAccessTokenRegistration();

    return pleromaAccountPublicService.registerAccount(
        request: request, appAccessToken: hostAccessToken.accessToken);
  }

  Future checkApplicationRegistration() async {
    if (!isHostApplicationRegistered) {
      var success = await registerApplication();

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
          currentInstanceBloc: ICurrentInstanceBloc.of(context, listen: false));

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
}

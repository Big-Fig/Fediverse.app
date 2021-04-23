import 'dart:async';

import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_model.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_service.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_service_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_service_impl.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final scopes = "read write follow push";

var _logger = Logger("auth_host_bloc_impl.dart");

// todo: report to mastodon/pleroma.
//  It's should be error code instead of string handling
const emailConfirmationRequiredDescription =
    "Your login is missing a confirmed e-mail address";

class AuthHostBloc extends AsyncInitLoadingBloc implements IAuthHostBloc {
  final Uri instanceBaseUri;
  final bool isPleroma;

  String get instanceBaseUriString => instanceBaseUri.toString();

  String get instanceBaseUriHost => instanceBaseUri.host;

  String get instanceBaseUriScheme => instanceBaseUri.scheme;
  late IPleromaApplicationService pleromaApplicationService;
  late IRestService restService;
  late IPleromaRestService pleromaRestService;
  late IPleromaOAuthService pleromaOAuthService;
  late IPleromaAccountPublicService pleromaAccountPublicService;
  late IAuthHostApplicationLocalPreferenceBloc
      hostApplicationLocalPreferenceBloc;
  late IAuthHostAccessTokenLocalPreferenceBloc
      hostAccessTokenLocalPreferenceBloc;
  late ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final IConnectionService connectionService;

  AuthHostBloc({
    required this.instanceBaseUri,
    required this.isPleroma,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required ILocalPreferencesService preferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
  }) {
    assert(instanceBaseUriScheme.isNotEmpty == true);
    assert(instanceBaseUriHost.isNotEmpty == true);
    hostApplicationLocalPreferenceBloc = AuthHostApplicationLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    );
    addDisposable(disposable: hostApplicationLocalPreferenceBloc);
    hostAccessTokenLocalPreferenceBloc = AuthHostAccessTokenLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    );
    addDisposable(disposable: hostAccessTokenLocalPreferenceBloc);
    restService = RestService(baseUri: instanceBaseUri);
    addDisposable(disposable: restService);
    pleromaRestService = PleromaRestService(
      restService: restService,
      connectionService: connectionService,
    );
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
  PleromaClientApplication? get hostApplication =>
      hostApplicationLocalPreferenceBloc.value;

  @override
  Stream<PleromaClientApplication?> get hostApplicationStream =>
      hostApplicationLocalPreferenceBloc.stream;

  @override
  bool get isHostAccessTokenExist => hostAccessToken != null;

  @override
  PleromaOAuthToken? get hostAccessToken =>
      hostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<PleromaOAuthToken?> get hostAccessTokenStream =>
      hostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostApplicationRegistered => hostApplication != null;

  @override
  Future<bool> registerApplication() async {
    _logger.finest(() => "registerApplication");
    String redirectUri = await _calculateRedirectUri();

    var application = await pleromaApplicationService.registerApp(
      registrationRequest: MastodonApiApplicationRegistrationRequest(
        clientName: "Fedi",
        redirectUris: redirectUri,
        scopes: scopes,
        website: "https://www.fediapp.com/",
      ),
    );

    _logger.finest(() => "registerApplication application = $application");
    if (application != null) {
      await hostApplicationLocalPreferenceBloc.setValue(
        application.toPleromaClientApplication(),
      );
      return true;
    } else {
      return false;
    }
  }

  Future<String> _calculateRedirectUri() async {
    var packageId = await FediPackageInfoHelper.getPackageId();
    var redirectUri = "$packageId://addNewInstance";
    return redirectUri;
  }

  @override
  Future<bool> retrieveAppAccessToken() async {
    var accessToken = await pleromaOAuthService.retrieveAppAccessToken(
      tokenRequest: PleromaOAuthAppTokenRequest(
        redirectUri: await _calculateRedirectUri(),
        scope: scopes,
        clientSecret: hostApplication!.clientSecret,
        clientId: hostApplication!.clientId,
      ),
    );

    if (accessToken != null) {
      await hostAccessTokenLocalPreferenceBloc.setValue(accessToken);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<AuthInstance?> launchLoginToAccount() async {
    _logger.finest(() => "launchLoginToAccount");
    await checkApplicationRegistration();

    var baseUrl = pleromaOAuthService.restService.baseUri;

    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .setValue(baseUrl.toString());

    var authCode = await pleromaOAuthService
        .launchAuthorizeFormAndExtractAuthorizationCode(
      authorizeRequest: PleromaOAuthAuthorizeRequest(
        redirectUri: await _calculateRedirectUri(),
        scope: scopes,
        forceLogin: true,
        clientId: hostApplication!.clientId,
      ),
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
        redirectUri: await _calculateRedirectUri(),
        scope: scopes,
        code: authCode,
        clientSecret: hostApplication!.clientSecret,
        clientId: hostApplication!.clientId,
      ),
    );

    return await _createInstanceFromToken(
      token: token,
      authCode: authCode,
    );
  }

  Future<AuthInstance> _createInstanceFromToken({
    required PleromaOAuthToken token,
    required String authCode,
  }) async {
    var restService = RestService(baseUri: instanceBaseUri);
    var pleromaAuthRestService = PleromaAuthRestService(
      accessToken: token.accessToken,
      connectionService: connectionService,
      restService: restService,
      isPleroma: isPleroma,
    );

    var pleromaInstanceService =
        PleromaInstanceService(restService: pleromaAuthRestService);

    var hostInstance = await pleromaInstanceService.getInstance();

    AuthInstance instance = await _createAuthInstance(
      pleromaAuthRestService: pleromaAuthRestService,
      authCode: authCode,
      token: token,
      hostInstance: hostInstance,
    );

    await pleromaInstanceService.dispose();
    await pleromaAuthRestService.dispose();
    return instance;
  }

  Future<AuthInstance> _createAuthInstance({
    required PleromaAuthRestService pleromaAuthRestService,
    required String? authCode,
    required PleromaOAuthToken token,
    required IPleromaInstance hostInstance,
  }) async {
    var pleromaMyAccountService =
        PleromaMyAccountService(restService: pleromaAuthRestService);
    var myAccount = await pleromaMyAccountService.verifyCredentials();

    var instance = AuthInstance(
      urlHost: instanceBaseUriHost.toLowerCase(),
      urlSchema: instanceBaseUriScheme,
      authCode: authCode,
      token: token,
      acct: myAccount.acct,
      application: hostApplication,
      info: hostInstance.toPleromaInstance(),
      isPleroma: myAccount.pleroma != null,
    );
    await pleromaMyAccountService.dispose();

    return instance;
  }

  @override
  Future<AuthHostRegistrationResult> registerAccount({
    required IPleromaAccountRegisterRequest request,
  }) async {
    await checkApplicationRegistration();
    await checkHostAccessTokenRegistration();
    await checkIsRegistrationsEnabled();

    var token = await pleromaAccountPublicService.registerAccount(
      request: request,
      appAccessToken: hostAccessToken!.accessToken,
    );

    var restService = RestService(baseUri: instanceBaseUri);
    var pleromaAuthRestService = PleromaAuthRestService(
      accessToken: token.accessToken,
      connectionService: connectionService,
      restService: restService,
      isPleroma: isPleroma,
    );

    var pleromaInstanceService =
        PleromaInstanceService(restService: pleromaAuthRestService);

    var hostInstance = await pleromaInstanceService.getInstance();

    AuthHostRegistrationResult result;
    if (hostInstance.approvalRequired!) {
      result = AuthHostRegistrationResult(
        authInstance: null,
        token: token,
        pleromaInstance: hostInstance,
        authInstanceFetchError: null,
      );
    } else {
      AuthInstance? instance;
      var authInstanceFetchError;
      try {
        instance = await _createAuthInstance(
          pleromaAuthRestService: pleromaAuthRestService,
          authCode: null,
          token: token,
          hostInstance: hostInstance,
        );
      } catch (e, stackTrace) {
        _logger.warning(() => "error during registerAccount", e, stackTrace);
        if (e is PleromaRestException) {
          if (e.decodedErrorDescriptionOrBody ==
              emailConfirmationRequiredDescription) {
            authInstanceFetchError =
                const EmailConfirmationRequiredAuthHostException();
          } else {
            authInstanceFetchError = e;
          }
        } else {
          authInstanceFetchError = e;
        }
      }

      result = AuthHostRegistrationResult(
        authInstanceFetchError: authInstanceFetchError,
        authInstance: instance,
        token: token,
        pleromaInstance: hostInstance,
      );
    }

    await pleromaInstanceService.dispose();
    await pleromaAuthRestService.dispose();

    return result;
  }

  @override
  Future checkApplicationRegistration() async {
    _logger.finest(
      () => "checkApplicationRegistration $isHostApplicationRegistered",
    );
    if (!isHostApplicationRegistered) {
      var success = await registerApplication();
      _logger.finest(() => "checkApplicationRegistration "
          "success=$success");
      if (!success) {
        throw const CantRegisterAppAuthHostException();
      }
    }
  }

  @override
  Future checkIsRegistrationsEnabled() async {
    _logger.finest(() => "checkIsRegistrationsEnabled");

    var result = false;

    PleromaInstanceService? pleromaInstanceService;
    try {
      pleromaInstanceService =
          PleromaInstanceService(restService: pleromaRestService);
      var pleromaInstance = await pleromaInstanceService.getInstance();

      var isRegistrationEnabled = pleromaInstance.registrations;

      if (isRegistrationEnabled != false) {
        var invitesEnabled = pleromaInstance.invitesEnabled;
        if (invitesEnabled != false) {
          result = true;
        } else {
          throw const InvitesOnlyRegistrationAuthHostException();
        }
      } else {
        throw const DisabledRegistrationAuthHostException();
      }
    } finally {
      await pleromaInstanceService?.dispose();
    }

    return result;
  }

  Future checkHostAccessTokenRegistration() async {
    if (!isHostAccessTokenExist) {
      var success = await retrieveAppAccessToken();

      if (!success) {
        throw const CantRetrieveAppTokenAuthHostException();
      }
    }
  }

  static AuthHostBloc createFromContext(
    BuildContext context, {
    required Uri instanceBaseUri,
  }) =>
      AuthHostBloc(
        instanceBaseUri: instanceBaseUri,
        isPleroma: false,
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        connectionService: IConnectionService.of(context, listen: false),
        currentInstanceBloc:
            ICurrentAuthInstanceBloc.of(context, listen: false),
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      );

  @override
  Future logout() async {
    var currentInstance = currentInstanceBloc.currentInstance!;

    var instance = currentInstance;
    try {
      await pleromaOAuthService.revokeToken(
        revokeRequest: PleromaOAuthAppTokenRevokeRequest(
          clientId: instance.application!.clientId,
          clientSecret: instance.application!.clientSecret,
          token: instance.token!.accessToken,
        ),
      );
    } finally {
      await currentInstanceBloc.logoutCurrentInstance();
    }
  }

  @override
  Future internalAsyncInit() async {
    await hostApplicationLocalPreferenceBloc.performAsyncInit();
    await hostAccessTokenLocalPreferenceBloc.performAsyncInit();
    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .performAsyncInit();
  }
}

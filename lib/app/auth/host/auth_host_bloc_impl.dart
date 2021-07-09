import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service_impl.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service_impl.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_service_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service_impl.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_service_impl.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

const scopes = 'read write follow push';

var _logger = Logger('auth_host_bloc_impl.dart');

// todo: report to mastodon/pleroma.
//  It's should be error code instead of string handling
const emailConfirmationRequiredDescription =
    'Your login is missing a confirmed e-mail address';

class AuthHostBloc extends AsyncInitLoadingBloc implements IAuthHostBloc {
  final Uri instanceBaseUri;
  final bool isPleroma;

  String get instanceBaseUriString => instanceBaseUri.toString();

  String get instanceBaseUriHost => instanceBaseUri.host;

  String get instanceBaseUriScheme => instanceBaseUri.scheme;

  // ignore: avoid-late-keyword
  late IPleromaApiApplicationService pleromaApplicationService;

  // ignore: avoid-late-keyword
  late IRestService restService;

  // ignore: avoid-late-keyword
  late IPleromaApiRestService pleromaRestService;

  // ignore: avoid-late-keyword
  late IPleromaApiOAuthService pleromaOAuthService;

  // ignore: avoid-late-keyword
  late IPleromaApiAccountPublicService pleromaAccountPublicService;

  // ignore: avoid-late-keyword
  late IAuthHostApplicationLocalPreferenceBloc
      hostApplicationLocalPreferenceBloc;

  // ignore: avoid-late-keyword
  late IAuthHostAccessTokenLocalPreferenceBloc
      hostAccessTokenLocalPreferenceBloc;

  // ignore: avoid-late-keyword
  late ICurrentAuthInstanceBloc currentInstanceBloc;
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final IConnectionService connectionService;
  final IConfigService configService;

  AuthHostBloc({
    required this.instanceBaseUri,
    required this.isPleroma,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required ILocalPreferencesService preferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.configService,
  }) {
    assert(instanceBaseUriScheme.isNotEmpty);
    assert(instanceBaseUriHost.isNotEmpty);
    hostApplicationLocalPreferenceBloc = AuthHostApplicationLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    hostAccessTokenLocalPreferenceBloc = AuthHostAccessTokenLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    restService = RestService(baseUri: instanceBaseUri)..disposeWith(this);
    pleromaRestService = PleromaApiRestService(
      restService: restService,
      connectionService: connectionService,
    )..disposeWith(this);

    pleromaApplicationService =
        PleromaApiApplicationService(restService: pleromaRestService)
          ..disposeWith(this);

    pleromaOAuthService =
        PleromaApiOAuthService(restService: pleromaRestService)
          ..disposeWith(this);

    pleromaAccountPublicService =
        PleromaApiAccountPublicService(restService: pleromaRestService)
          ..disposeWith(this);
  }

  @override
  PleromaApiClientApplication? get hostApplication =>
      hostApplicationLocalPreferenceBloc.value;

  @override
  Stream<PleromaApiClientApplication?> get hostApplicationStream =>
      hostApplicationLocalPreferenceBloc.stream;

  @override
  bool get isHostAccessTokenExist => hostAccessToken != null;

  @override
  PleromaApiOAuthToken? get hostAccessToken =>
      hostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<PleromaApiOAuthToken?> get hostAccessTokenStream =>
      hostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostApplicationRegistered => hostApplication != null;

  @override
  Future registerApplication() async {
    _logger.finest(() => 'registerApplication');
    var redirectUri = await _calculateRedirectUri();

    var application = await pleromaApplicationService.registerApp(
      registrationRequest: MastodonApiApplicationRegistrationRequest(
        clientName: 'Fedi',
        redirectUris: redirectUri,
        scopes: scopes,
        website: 'https://www.fediapp.com/',
      ),
    );

    _logger.finest(() => 'registerApplication application = $application');
    await hostApplicationLocalPreferenceBloc.setValue(
      application.toPleromaApiClientApplication(),
    );
  }

  Future<String> _calculateRedirectUri() async {
    var redirectUri = configService.appAddNewInstanceCallbackUrl;

    return redirectUri;
  }

  @override
  Future<bool> retrieveAppAccessToken() async {
    try {
      var accessToken = await pleromaOAuthService.retrieveAppAccessToken(
        tokenRequest: PleromaApiOAuthAppTokenRequest(
          redirectUri: await _calculateRedirectUri(),
          scope: scopes,
          clientSecret: hostApplication!.clientSecret,
          clientId: hostApplication!.clientId,
        ),
      );
      await hostAccessTokenLocalPreferenceBloc.setValue(accessToken);

      return true;
    } catch (e, stackTrace) {
      _logger.severe(
        () => 'retrieveAppAccessToken error',
        e,
        stackTrace,
      );

      return false;
    }
  }

  @override
  Future<AuthInstance?> launchLoginToAccount() async {
    _logger.finest(() => 'launchLoginToAccount');
    await checkApplicationRegistration();

    var baseUrl = pleromaOAuthService.restService.baseUri;

    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .setValue(baseUrl.toString());

    var authCode = await pleromaOAuthService
        .launchAuthorizeFormAndExtractAuthorizationCode(
      authorizeRequest: PleromaApiOAuthAuthorizeRequest(
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

      var instance = await loginWithAuthCode(authCode);

      return instance;
    } else {
      return null;
    }
  }

  @override
  Future<AuthInstance> loginWithAuthCode(String authCode) async {
    var token = await pleromaOAuthService.retrieveAccountAccessToken(
      tokenRequest: PleromaApiOAuthAccountTokenRequest(
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
    required PleromaApiOAuthToken token,
    required String authCode,
  }) async {
    var restService = RestService(baseUri: instanceBaseUri);
    var pleromaAuthRestService = PleromaApiAuthRestService(
      accessToken: token.accessToken,
      connectionService: connectionService,
      restService: restService,
      isPleroma: isPleroma,
    );

    var pleromaInstanceService =
        PleromaApiInstanceService(restService: pleromaAuthRestService);

    var hostInstance = await pleromaInstanceService.getInstance();

    var instance = await _createAuthInstance(
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
    required PleromaApiAuthRestService pleromaAuthRestService,
    required String? authCode,
    required PleromaApiOAuthToken token,
    required IPleromaApiInstance hostInstance,
  }) async {
    var pleromaMyAccountService =
        PleromaApiMyAccountService(restApiAuthService: pleromaAuthRestService);
    var myAccount = await pleromaMyAccountService.verifyCredentials();

    var instance = AuthInstance(
      urlHost: instanceBaseUriHost.toLowerCase(),
      urlSchema: instanceBaseUriScheme,
      authCode: authCode,
      token: token,
      acct: myAccount.acct,
      application: hostApplication,
      info: hostInstance.toPleromaApiInstance(),
      isPleroma: myAccount.pleroma != null,
    );
    await pleromaMyAccountService.dispose();

    return instance;
  }

  @override
  // todo: fix long-method
  // ignore: long-method
  Future<AuthHostRegistrationResult> registerAccount({
    required IPleromaApiAccountPublicRegisterRequest request,
  }) async {
    await checkApplicationRegistration();
    await checkHostAccessTokenRegistration();
    await checkIsRegistrationsEnabled();

    var token = await pleromaAccountPublicService.registerAccount(
      request: request,
      appAccessToken: hostAccessToken!.accessToken,
    );

    var restService = RestService(baseUri: instanceBaseUri);

    var pleromaRestService = PleromaApiRestService(
      connectionService: connectionService,
      restService: restService,
    );

    var pleromaInstanceService =
        PleromaApiInstanceService(restService: pleromaRestService);

    var hostInstance = await pleromaInstanceService.getInstance();

    AuthHostRegistrationResult result;
    if (hostInstance.approvalRequired == true) {
      result = AuthHostRegistrationResult.noErrors(
        authInstance: null,
        token: token,
        pleromaInstance: hostInstance,
      );
    } else {
      if (token == null) {
        result = AuthHostRegistrationResult(
          authInstance: null,
          token: token,
          pleromaInstance: hostInstance,
          emailConfirmationRequiredAuthHostException:
              const EmailConfirmationRequiredAuthHostException(),
          unknownHostException: null,
          cantRegisterAppAuthHostException: null,
          cantRetrieveAppTokenAuthHostException: null,
          invitesOnlyRegistrationAuthHostException: null,
          disabledRegistrationAuthHostException: null,
        );
      } else {
        var pleromaAuthRestService = PleromaApiAuthRestService(
          accessToken: token.accessToken,
          connectionService: connectionService,
          restService: restService,
          isPleroma: isPleroma,
        );

        EmailConfirmationRequiredAuthHostException?
            emailConfirmationRequiredAuthHostException;
        dynamic unknownHostException;

        AuthInstance? instance;
        try {
          instance = await _createAuthInstance(
            pleromaAuthRestService: pleromaAuthRestService,
            authCode: null,
            token: token,
            hostInstance: hostInstance,
          );
        } catch (e, stackTrace) {
          _logger.warning(() => 'error during registerAccount', e, stackTrace);
          if (e is PleromaApiRestException) {
            if (e.decodedErrorDescriptionOrBody ==
                emailConfirmationRequiredDescription) {
              emailConfirmationRequiredAuthHostException =
                  const EmailConfirmationRequiredAuthHostException();
            } else {
              unknownHostException = e;
            }
          } else {
            unknownHostException = e;
          }
        } finally {
          await pleromaAuthRestService.dispose();
        }

        result = AuthHostRegistrationResult(
          authInstance: instance,
          token: token,
          pleromaInstance: hostInstance,
          emailConfirmationRequiredAuthHostException:
              emailConfirmationRequiredAuthHostException,
          unknownHostException: unknownHostException,
          cantRegisterAppAuthHostException: null,
          cantRetrieveAppTokenAuthHostException: null,
          invitesOnlyRegistrationAuthHostException: null,
          disabledRegistrationAuthHostException: null,
        );
      }
    }

    await pleromaInstanceService.dispose();
    await pleromaRestService.dispose();

    return result;
  }

  @override
  Future checkApplicationRegistration() async {
    _logger.finest(
      () => 'checkApplicationRegistration $isHostApplicationRegistered',
    );
    if (!isHostApplicationRegistered) {
      await registerApplication();
      _logger.finest(() => 'checkApplicationRegistration');
    }
  }

  @override
  Future checkIsRegistrationsEnabled() async {
    _logger.finest(() => 'checkIsRegistrationsEnabled');

    var result = false;

    PleromaApiInstanceService? pleromaInstanceService;
    try {
      pleromaInstanceService =
          PleromaApiInstanceService(restService: pleromaRestService);
      var pleromaInstance = await pleromaInstanceService.getInstance();

      var isRegistrationEnabled = pleromaInstance.registrations;

      if (isRegistrationEnabled != false) {
        var invitesEnabled = pleromaInstance.invitesEnabled;
        if (invitesEnabled == true) {
          throw const InvitesOnlyRegistrationAuthHostException();
        } else {
          result = true;
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
            IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        configService: IConfigService.of(
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
        revokeRequest: PleromaApiOAuthAppTokenRevokeRequest(
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

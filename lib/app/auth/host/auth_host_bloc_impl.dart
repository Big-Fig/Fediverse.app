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
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late IUnifediApiAccessScopes scopes;

  // ignore: avoid-late-keyword
  late IUnifediApiInstanceService unifediApiInstanceService;

  // ignore: avoid-late-keyword
  late IUnifediApiManager unifediApiManager;

  // ignore: avoid-late-keyword
  late IUnifediApiAccountService unifediApiAccountService;

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
    hostApplicationLocalPreferenceBloc = AuthHostApplicationLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    hostAccessTokenLocalPreferenceBloc = AuthHostAccessTokenLocalPreferenceBloc(
      preferencesService,
      host: instanceBaseUriHost,
    )..disposeWith(this);

    if (isPleroma) {
      unifediApiManager = createPleromaApiManager(
        uri: instanceBaseUri.toString(),
      );
    } else {
      unifediApiManager = createMastodonApiManager(
        uri: instanceBaseUri.toString(),
      );
    }
    // todo: remove hack
    // unifediApiManager = currentInstanceBloc
    //     .currentInstance!.info!.typeAsUnifediApi
    //     .createApiManager(
    //   uri: instanceBaseUri.toString(),
    // );

    unifediApiInstanceService = unifediApiManager.createInstanceService();

    unifediApiAccountService = unifediApiManager.createAccountService();

    // todo: remove hack
    scopes = unifediApiInstanceService
        .calculateAvailableScopes()
        .toUnifediApiAccessScopes()
        .copyWith(
      targetPermissions: [],
    );
  }

  @override
  UnifediApiClientApplication? get hostApplication =>
      hostApplicationLocalPreferenceBloc.value;

  @override
  Stream<UnifediApiClientApplication?> get hostApplicationStream =>
      hostApplicationLocalPreferenceBloc.stream;

  @override
  bool get isHostAccessTokenExist => hostAccessToken != null;

  @override
  UnifediApiOAuthToken? get hostAccessToken =>
      hostAccessTokenLocalPreferenceBloc.value;

  @override
  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream =>
      hostAccessTokenLocalPreferenceBloc.stream;

  @override
  bool get isHostApplicationRegistered => hostApplication != null;

  @override
  Future registerApplication() async {
    _logger.finest(() => 'registerApplication');
    var redirectUri = await _calculateRedirectUri();

    var application = await unifediApiInstanceService.registerApp(
      clientName: 'Fedi',
      redirectUri: redirectUri,
      useDisplayCodeRedirectUri: false,
      scopes: scopes,
      website: 'https://www.fediapp.com/',
    );

    _logger.finest(() => 'registerApplication application = $application');
    await hostApplicationLocalPreferenceBloc.setValue(
      application.toUnifediApiClientApplication(),
    );
  }

  Future<String> _calculateRedirectUri() async {
    var redirectUri = configService.appAddNewInstanceCallbackUrl;

    return redirectUri;
  }

  @override
  Future<bool> retrieveAppAccessToken() async {
    try {
      var accessToken = await unifediApiInstanceService.retrieveAppAccessToken(
        displayCodeRedirectUriWasUsed: false,
        redirectUri: await _calculateRedirectUri(),
        scopes: scopes,
        clientSecret: hostApplication!.clientSecret!,
        clientId: hostApplication!.clientId!,
      );
      await hostAccessTokenLocalPreferenceBloc
          .setValue(accessToken.toUnifediApiOAuthToken());

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

    var baseUrl = unifediApiAccountService.baseUri;

    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .setValue(baseUrl.toString());

    var authCode = await launchAuthorizeFormAndExtractAuthorizationCode(
      unifediApiInstanceService: unifediApiInstanceService,
      redirectUri: await _calculateRedirectUri(),
      scopes: scopes,
      clientId: hostApplication!.clientId!,
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
    var token =
        await unifediApiInstanceService.retrieveAccountAccessTokenFromAuthCode(
      redirectUri: await _calculateRedirectUri(),
      displayCodeRedirectUriWasUsed: false,
      scopes: scopes,
      authCode: authCode,
      clientSecret: hostApplication!.clientSecret!,
      clientId: hostApplication!.clientId!,
    );

    return await _createInstanceFromToken(
      token: token,
      authCode: authCode,
    );
  }

  Future<AuthInstance> _createInstanceFromToken({
    required IUnifediApiOAuthToken token,
    required String authCode,
  }) async {
    var unifediApiInstanceService = unifediApiManager.createInstanceService();

    var hostInstance = await unifediApiInstanceService.getInstance();

    var instance = await _createAuthInstance(
      authCode: authCode,
      token: token,
      hostInstance: hostInstance,
    );

    await unifediApiInstanceService.dispose();

    return instance;
  }

  Future<AuthInstance> _createAuthInstance({
    required String? authCode,
    required IUnifediApiOAuthToken token,
    required IUnifediApiInstance hostInstance,
  }) async {
    var unifediApiMyAccountService = unifediApiManager.createMyAccountService();
    var myAccount = await unifediApiMyAccountService.verifyMyCredentials();

    var instance = AuthInstance(
      urlHost: instanceBaseUriHost.toLowerCase(),
      urlSchema: instanceBaseUriScheme,
      authCode: authCode,
      token: token.toUnifediApiOAuthToken(),
      acct: myAccount.acct,
      application: hostApplication,
      info: hostInstance.toUnifediApiInstance(),
      // todo: replace with isPleroma getter with same logic
      isPleroma: hostInstance.typeAsUnifediApi.isPleroma,
    );
    await unifediApiMyAccountService.dispose();

    return instance;
  }

  @override
  // todo: fix long-method
  // ignore: long-method
  Future<AuthHostRegistrationResult> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  }) async {
    await checkApplicationRegistration();
    await checkHostAccessTokenRegistration();
    await checkIsRegistrationsEnabled();

    var token = await unifediApiAccountService.registerAccount(
      registerAccount: registerAccount,
    );

    var hostInstance = await unifediApiInstanceService.getInstance();

    AuthHostRegistrationResult result;
    if (hostInstance.approvalRequired == true) {
      result = AuthHostRegistrationResult.noErrors(
        authInstance: null,
        token: token.toUnifediApiOAuthToken(),
        unifediApiInstance: hostInstance,
      );
    } else {
      if (token == null) {
        result = AuthHostRegistrationResult(
          authInstance: null,
          token: token.toUnifediApiOAuthToken(),
          unifediApiInstance: hostInstance,
          emailConfirmationRequiredAuthHostException:
              const EmailConfirmationRequiredAuthHostException(),
          unknownHostException: null,
          cantRegisterAppAuthHostException: null,
          cantRetrieveAppTokenAuthHostException: null,
          invitesOnlyRegistrationAuthHostException: null,
          disabledRegistrationAuthHostException: null,
        );
      } else {
        EmailConfirmationRequiredAuthHostException?
            emailConfirmationRequiredAuthHostException;
        dynamic unknownHostException;

        AuthInstance? instance;
        try {
          instance = await _createAuthInstance(
            authCode: null,
            token: token,
            hostInstance: hostInstance,
          );
        } catch (e, stackTrace) {
          _logger.warning(() => 'error during registerAccount', e, stackTrace);
          if (e is IUnifediApiRestErrorException) {
            if (e.unifediError.descriptionOrContent ==
                emailConfirmationRequiredDescription) {
              emailConfirmationRequiredAuthHostException =
                  const EmailConfirmationRequiredAuthHostException();
            } else {
              unknownHostException = e;
            }
          } else {
            unknownHostException = e;
          }
        }

        result = AuthHostRegistrationResult(
          authInstance: instance,
          token: token.toUnifediApiOAuthToken(),
          unifediApiInstance: hostInstance,
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

    var unifediApiInstance = await unifediApiInstanceService.getInstance();

    var isRegistrationEnabled = unifediApiInstance.registrations;

    if (isRegistrationEnabled != false) {
      result = true;
    } else {
      var invitesEnabled = unifediApiInstance.invitesEnabled;
      if (invitesEnabled == true) {
        throw const InvitesOnlyRegistrationAuthHostException();
      } else {
        throw const DisabledRegistrationAuthHostException();
      }
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
        connectionService:
            Provider.of<IConnectionService>(context, listen: false),
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
      await unifediApiInstanceService.revokeAccessToken(
        clientId: instance.application!.clientId!,
        clientSecret: instance.application!.clientSecret!,
        token: instance.token!.accessToken,
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

  _logger.finest(() => 'launchAuthorizeFormAndExtractAuthorizationCode \n'
      '\t url = $url\n'
      '\t canLaunch=$isCanLaunch');

  var completer = Completer<String>();

  // ignore: avoid-late-keyword
  late StreamSubscription<Uri?> subscription;
  subscription = uriLinkStream.listen(
    (Uri? uri) {
      subscription.cancel();
      closeWebView();
      var code = unifediApiInstanceService.extractAuthCodeFromCallbackUrl(url);
      completer.complete(code);
    },
    onError: (e) {
      subscription.cancel();
      closeWebView();
      completer.completeError(e);
    },
  );
  _logger.finest(() => 'launch url=$url');
  await launch(url);

  return completer.future;
}

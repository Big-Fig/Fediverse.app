import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/host/access_token/access_host_access_token_local_preference_bloc.dart';
import 'package:fedi/app/access/host/access_token/access_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/host/application/access_host_application_local_preference_bloc.dart';
import 'package:fedi/app/access/host/application/access_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/memory_access_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_pleroma_adapter.dart';
import 'package:url_launcher/url_launcher.dart';

var _logger = Logger('auth_host_bloc_impl.dart');

// todo: report to mastodon/pleroma.
//  It's should be error code instead of string handling
const emailConfirmationRequiredDescription =
    'Your login is missing a confirmed e-mail address';

class AuthHostBloc extends AsyncInitLoadingBloc implements IAuthHostBloc {
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
  late ICurrentUnifediApiAccessBloc currentInstanceBloc;
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final IConnectionService connectionService;
  final IConfigService configService;

  // ignore: avoid-late-keyword
  late MemoryUnifediApiAccessBloc memoryUnifediApiAccessBloc;

  AuthHostBloc({
    required this.instanceBaseUri,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
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

    memoryUnifediApiAccessBloc = MemoryUnifediApiAccessBloc(
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

    var appToken = await unifediApiInstanceService.retrieveAppAccessToken(
      scopes: scopes,
      redirectUri: redirectUri,
      displayCodeRedirectUriWasUsed: false,
      clientId: application.clientId!,
      clientSecret: application.clientSecret!,
    );

    _logger.finest(() => 'registerApplication application = $application');
    _logger.finest(() => 'registerApplication appToken = $appToken');
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

    return await _createInstanceFromToken(
      token: token,
      authCode: authCode,
    );
  }

  Future<UnifediApiAccess> _createInstanceFromToken({
    required IUnifediApiOAuthToken token,
    required String authCode,
  }) async {
    var unifediApiInstanceService = unifediApiManager.createInstanceService();

    var hostInstance = await unifediApiInstanceService.getInstance();

    var instance = await _createUnifediApiAccess(
      authCode: authCode,
      token: token,
      hostInstance: hostInstance,
    );

    await unifediApiInstanceService.dispose();

    memoryUnifediApiAccessBloc.changeAccess(instance);

    return instance;
  }

  Future<UnifediApiAccess> _createUnifediApiAccess({
    required String? authCode,
    required IUnifediApiOAuthToken token,
    required IUnifediApiInstance hostInstance,
  }) async {
    var unifediApiMyAccountService = unifediApiManager.createMyAccountService();
    var myAccount = await unifediApiMyAccountService.verifyMyCredentials();

    var instance = UnifediApiAccess(
      url: instanceBaseUri.toString(),
      instance: hostInstance.toUnifediApiInstance(),
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
  Future<AuthHostRegistrationResult> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  }) async {
    await checkApplicationRegistration();
    await checkIsRegistrationsEnabled();

    var hostInstance = await unifediApiInstanceService.getInstance();
    AuthHostRegistrationResult result;
    try {
      var token = await unifediApiAccountService.registerAccount(
        registerAccount: registerAccount,
      );

      memoryUnifediApiAccessBloc.changeAccess(
        memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
              userAccessToken: UnifediApiAccessUserToken(
                myAccount: null,
                user: registerAccount.username,
                scopes: scopes,
                oauthToken: token.toUnifediApiOAuthToken(),
              ),
            ),
      );

      if (hostInstance.approvalRequired == true) {
        result = AuthHostRegistrationResult.noErrors(
          authInstance: null,
          token: token.toUnifediApiOAuthToken(),
          unifediApiInstance: hostInstance,
        );
      } else {
        EmailConfirmationRequiredAuthHostException?
            emailConfirmationRequiredAuthHostException;
        dynamic unknownHostException;

        UnifediApiAccess? instance;
        try {
          instance = await _createUnifediApiAccess(
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
          invitesOnlyRegistrationAuthHostException: null,
          disabledRegistrationAuthHostException: null,
        );
      }
    } on IUnifediApiRestErrorException catch (e, stackTrace) {
      _logger.warning(
        () => 'error during registerAccount',
        e,
        stackTrace,
      );

      var identifierAsUnifediApi =
          e.unifediError.details?.identifierAsUnifediApi;

      if (identifierAsUnifediApi != null) {
        var mapResult = identifierAsUnifediApi.maybeWhen(
          missingConfirmedEmail: (_) => AuthHostRegistrationResult(
            authInstance: null,
            token: null,
            unifediApiInstance: hostInstance,
            emailConfirmationRequiredAuthHostException:
                const EmailConfirmationRequiredAuthHostException(),
            unknownHostException: null,
            cantRegisterAppAuthHostException: null,
            invitesOnlyRegistrationAuthHostException: null,
            disabledRegistrationAuthHostException: null,
          ),
          awaitingApproval: (_) => throw UnimplementedError(),
          orElse: () => null,
        );
        if (mapResult != null) {
          result = mapResult;
        } else {
          rethrow;
        }
      } else {
        rethrow;
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

  static AuthHostBloc createFromContext(
    BuildContext context, {
    required Uri instanceBaseUri,
  }) =>
      AuthHostBloc(
        instanceBaseUri: instanceBaseUri,
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        connectionService:
            Provider.of<IConnectionService>(context, listen: false),
        currentInstanceBloc:
            ICurrentUnifediApiAccessBloc.of(context, listen: false),
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
        token: instance.userAccessToken!.accessToken,
      );
    } finally {
      await currentInstanceBloc.logoutCurrentInstance();
    }
  }

  @override
  Future internalAsyncInit() async {
    await hostApplicationLocalPreferenceBloc.performAsyncInit();
    await hostAccessTokenLocalPreferenceBloc.performAsyncInit();

    var unifediApiClientApplication = hostApplicationLocalPreferenceBloc.value;
    var unifediApiOAuthToken = hostAccessTokenLocalPreferenceBloc.value;
    if (unifediApiClientApplication != null && unifediApiOAuthToken != null) {
      var scopes = IPleromaApiAccessScopes.calculateAvailableScopes(
        PleromaApiVersion(
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

    await pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
        .performAsyncInit();

    var detectorBloc = UnifediApiInstanceTypeDetectorBloc();
    var instanceType = await detectorBloc.detectInstanceType(
      url: instanceBaseUri.toString(),
    );

    if (instanceType.isPleroma) {
      unifediApiManager = createPleromaApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
      );
    } else {
      unifediApiManager = createMastodonApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
      );
    }

    unifediApiInstanceService = unifediApiManager.createInstanceService();

    var instance = await unifediApiInstanceService.getInstance();

    memoryUnifediApiAccessBloc.changeAccess(
      memoryUnifediApiAccessBloc.access.toUnifediApiAccess().copyWith(
            instance: instance.toUnifediApiInstance(),
          ),
    );

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
      var code = unifediApiInstanceService.extractAuthCodeFromCallbackUrl(
        uri.toString(),
      );
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

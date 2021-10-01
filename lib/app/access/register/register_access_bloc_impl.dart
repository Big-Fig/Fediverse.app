import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/memory_access_bloc_impl.dart';
import 'package:fedi/app/access/register/form/register_access_form_bloc_impl.dart';
import 'package:fedi/app/access/register/register_access_bloc.dart';
import 'package:fedi/app/access/register/response/register_response_model.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('register_access_bloc_impl.dart');

class RegisterUnifediApiAccessBloc extends AsyncInitLoadingBloc
    implements IRegisterUnifediApiAccessBloc {
  @override
  final Uri instanceBaseUri;

  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentUnifediApiAccessBloc currentInstanceBloc;
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalizationSettingsBloc localizationSettingsBloc;
  final IConfigService configService;

  // ignore: avoid-late-keyword
  late MemoryUnifediApiAccessBloc memoryUnifediApiAccessBloc;

  // ignore: avoid-late-keyword
  late IUnifediApiInstance unifediApiInstance;

  // ignore: avoid-late-keyword
  late IUnifediApiManager apiManager;

  // ignore: avoid-late-keyword
  late IUnifediApiInstanceService unifediApiInstanceService;

  final String localeName;

  @override
  // ignore: avoid-late-keyword
  late RegisterUnifediApiAccessFormBloc registerUnifediApiAccessFormBloc;

  RegisterUnifediApiAccessBloc({
    required this.localeName,
    required this.instanceBaseUri,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localizationSettingsBloc,
    required this.configService,
  }) {
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
  Future<RegisterResponse> register() async {
    var unifediApiAccountRegisterRequest =
        registerUnifediApiAccessFormBloc.calculateRegisterFormData();

    AuthHostBloc? authApplicationBloc;
    try {
      authApplicationBloc = AuthHostBloc(
        instanceBaseUri: instanceBaseUri,
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentInstanceBloc,
        configService: configService,
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await authApplicationBloc.performAsyncInit();

      return await authApplicationBloc.registerAccount(
        registerAccount: unifediApiAccountRegisterRequest,
      );
    } catch (e, stackTrace) {
      // todo: refactor
      _logger.warning(() => 'submit', e, stackTrace);
      registerUnifediApiAccessFormBloc.onRegisterFailed();
      rethrow;
    } finally {
      await authApplicationBloc?.dispose();
    }
  }

  @override
  bool get isReadyToSubmit =>
      registerUnifediApiAccessFormBloc.isHaveChangesAndNoErrors;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      registerUnifediApiAccessFormBloc.isHaveChangesAndNoErrorsStream;

  @override
  Future internalAsyncInit() async {
    var detectorBloc = UnifediApiInstanceTypeDetectorBloc();
    var instanceType = await detectorBloc.detectInstanceType(
      url: instanceBaseUri.toString(),
    );
    var webSocketsModeSettingsBloc = WebSocketsModeSettingsBloc(
      mode: WebSocketsMode.disabledValue,
    );
    webSocketsModeSettingsBloc.disposeWith(this);
    if (instanceType.isPleroma) {
      apiManager = createPleromaApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
        webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
      );
    } else {
      apiManager = createMastodonApiManager(
        apiAccessBloc: memoryUnifediApiAccessBloc,
        computeImpl: null,
        webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
      );
    }

    unifediApiInstanceService = apiManager.createInstanceService();

    apiManager.disposeWith(this);
    unifediApiInstanceService.disposeWith(this);

    unifediApiInstance = await unifediApiInstanceService.getInstance();

    var manualApprovalRequired = unifediApiInstance.approvalRequired == true;

    // todo: remove hack
    manualApprovalRequired = unifediApiInstance.typeAsUnifediApi.maybeMap(
      mastodon: (_) => true,
      // not changed
      orElse: () => manualApprovalRequired,
    );

    registerUnifediApiAccessFormBloc = RegisterUnifediApiAccessFormBloc(
      localeName: localeName,
      unifediApiInstance: unifediApiInstance,
      unifediApiInstanceService: unifediApiInstanceService,
      instanceBaseUri: instanceBaseUri,
      manualApprovalRequired: manualApprovalRequired,
    )..disposeWith(this);
  }
}

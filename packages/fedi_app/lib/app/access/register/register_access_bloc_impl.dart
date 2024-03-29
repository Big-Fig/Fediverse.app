import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/memory_access_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/register_access_form_bloc_impl.dart';
import 'package:fedi_app/app/access/register/register_access_bloc.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:fedi_app/app/auth/host/access_host_bloc_impl.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('register_access_bloc_impl.dart');

class RegisterAccessBloc extends AsyncInitLoadingBloc
    implements IRegisterAccessBloc {
  @override
  final Uri instanceBaseUri;

  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAccessBloc currentInstanceBloc;
  final IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      unifediOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalizationSettingsBloc localizationSettingsBloc;
  final IConfigService configService;

  // ignore: avoid-late-keyword
  late MemoryAccessBloc memoryUnifediApiAccessBloc;

  // ignore: avoid-late-keyword
  late IUnifediApiInstance unifediApiInstance;

  // ignore: avoid-late-keyword
  late IUnifediApiManager apiManager;

  // ignore: avoid-late-keyword
  late IUnifediApiInstanceService unifediApiInstanceService;

  final String localeName;

  @override
  // ignore: avoid-late-keyword
  late RegisterAccessFormBloc registerUnifediApiAccessFormBloc;

  RegisterAccessBloc({
    required this.localeName,
    required this.instanceBaseUri,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.unifediOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localizationSettingsBloc,
    required this.configService,
  }) {
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
  Future<RegisterAccessResponse> register() async {
    var unifediApiAccountRegisterRequest =
        registerUnifediApiAccessFormBloc.calculateRegisterFormData();

    AccessHostBloc? accessHostBloc;
    try {
      accessHostBloc = AccessHostBloc(
        instanceBaseUri: instanceBaseUri,
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentInstanceBloc,
        configService: configService,
        oAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            unifediOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await accessHostBloc.performAsyncInit();

      return await accessHostBloc.registerAccount(
        registerAccount: unifediApiAccountRegisterRequest,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stackTrace) {
      // todo: refactor
      _logger.warning(() => 'submit', e, stackTrace);
      registerUnifediApiAccessFormBloc.onRegisterFailed();
      rethrow;
    } finally {
      await accessHostBloc?.dispose();
    }
  }

  @override
  bool get isReadyToSubmit =>
      registerUnifediApiAccessFormBloc.isHaveChangesAndNoErrors;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      registerUnifediApiAccessFormBloc.isHaveChangesAndNoErrorsStream;

  @override
  Future<void> internalAsyncInit() async {
    var detectorBloc = UnifediApiInstanceTypeDetectorBloc();
    var instanceType = await detectorBloc.detectInstanceType(
      url: instanceBaseUri.toString(),
    );
    var webSocketsModeSettingsBloc = WebSocketsModeSettingsBloc(
      mode: WebSocketsMode.disabledValue,
    )..disposeWith(this);

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

    registerUnifediApiAccessFormBloc = RegisterAccessFormBloc(
      localeName: localeName,
      unifediApiInstance: unifediApiInstance,
      unifediApiInstanceService: unifediApiInstanceService,
      instanceBaseUri: instanceBaseUri,
      manualApprovalRequired: manualApprovalRequired,
    )..disposeWith(this);
  }
}

import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:logging/logging.dart';

final _logger = Logger('register_auth_instance_bloc_impl.dart');

class RegisterAuthInstanceBloc extends AsyncInitLoadingBloc
    implements IRegisterAuthInstanceBloc {
  @override
  final Uri instanceBaseUri;

  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalizationSettingsBloc localizationSettingsBloc;
  final IConfigService configService;

  // ignore: avoid-late-keyword
  late IUnifediApiInstance unifediApiInstance;

  // ignore: avoid-late-keyword
  late IUnifediApiManager apiManager;

  // ignore: avoid-late-keyword
  late IUnifediApiInstanceService unifediApiInstanceService;

  final String localeName;

  @override
  // ignore: avoid-late-keyword
  late RegisterAuthInstanceFormBloc registerAuthInstanceFormBloc;

  RegisterAuthInstanceBloc({
    required this.localeName,
    required this.instanceBaseUri,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localizationSettingsBloc,
    required this.configService,
  }) : super() {
    apiManager = currentInstanceBloc.currentInstance!.info!.typeAsUnifediApi
        .createApiManager(
      uri: instanceBaseUri.toString(),
    );

    unifediApiInstanceService = apiManager.createInstanceService();

    registrationResultStreamController.disposeWith(this);

    apiManager.disposeWith(this);
    unifediApiInstanceService.disposeWith(this);
  }

  @override
  Future<AuthHostRegistrationResult> submit() async {
    var unifediApiAccountRegisterRequest =
        registerAuthInstanceFormBloc.calculateRegisterFormData();

    AuthHostRegistrationResult registrationResult;
    AuthHostBloc? authApplicationBloc;
    try {
      authApplicationBloc = AuthHostBloc(
        instanceBaseUri: instanceBaseUri,
        isPleroma: false,
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentInstanceBloc,
        configService: configService,
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await authApplicationBloc.performAsyncInit();

      registrationResult = await authApplicationBloc.registerAccount(
        registerAccount: unifediApiAccountRegisterRequest,
      );
    } catch (e, stackTrace) {
      // todo: refactor
      _logger.warning(() => 'submit', e, stackTrace);
      registerAuthInstanceFormBloc.onRegisterFailed();
      rethrow;
    } finally {
      await authApplicationBloc?.dispose();
    }

    if (!registrationResult.isHaveNoErrors) {
      registerAuthInstanceFormBloc.onRegisterFailed();
    }

    // todo: rework when fail
    registrationResultStreamController.add(registrationResult);

    return registrationResult;
  }

  StreamController<AuthHostRegistrationResult>
      registrationResultStreamController = StreamController.broadcast();

  @override
  Stream<AuthHostRegistrationResult> get registrationResultStream =>
      registrationResultStreamController.stream;

  @override
  bool get isReadyToSubmit =>
      registerAuthInstanceFormBloc.isHaveChangesAndNoErrors;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      registerAuthInstanceFormBloc.isHaveChangesAndNoErrorsStream;

  @override
  Future internalAsyncInit() async {
    unifediApiInstance = await unifediApiInstanceService.getInstance();

    registerAuthInstanceFormBloc = RegisterAuthInstanceFormBloc(
      localeName: localeName,
      unifediApiInstance: unifediApiInstance,
      unifediApiInstanceService: unifediApiInstanceService,
      instanceBaseUri: instanceBaseUri,
      // localizationSettingsBloc: localizationSettingsBloc,
      manualApprovalRequired: unifediApiInstance.approvalRequired == true,
    )..disposeWith(this);
  }
}

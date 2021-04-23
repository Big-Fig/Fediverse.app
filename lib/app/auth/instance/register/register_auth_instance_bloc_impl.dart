import 'dart:async';

import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_captcha_service.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_captcha_service_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';

class RegisterAuthInstanceBloc extends AsyncInitLoadingBloc
    implements IRegisterAuthInstanceBloc {
  final Uri instanceBaseUri;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalizationSettingsBloc localizationSettingsBloc;

  late IPleromaInstance pleromaInstance;
  late IRestService restService;
  late IPleromaRestService pleromaRestService;
  late IPleromaCaptchaService pleromaCaptchaService;

  late IPleromaInstanceService pleromaInstanceService;

  @override
  late RegisterAuthInstanceFormBloc registerAuthInstanceFormBloc;

  RegisterAuthInstanceBloc({
    required this.instanceBaseUri,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentInstanceBloc,
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localizationSettingsBloc,
  }) : super() {
    restService = RestService(baseUri: instanceBaseUri);
    pleromaRestService = PleromaRestService(
      connectionService: connectionService,
      restService: restService,
    );

    pleromaCaptchaService = PleromaCaptchaService(
      restService: pleromaRestService,
    );

    pleromaInstanceService =
        PleromaInstanceService(restService: pleromaRestService);

    addDisposable(streamController: successRegistrationStreamController);
    addDisposable(disposable: restService);
    addDisposable(disposable: pleromaRestService);
    addDisposable(disposable: pleromaCaptchaService);

    addDisposable(disposable: pleromaInstanceService);
  }

  @override
  Future<AuthHostRegistrationResult> submit() async {
    var pleromaAccountRegisterRequest =
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
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await authApplicationBloc.performAsyncInit();

      registrationResult = await authApplicationBloc.registerAccount(
        request: pleromaAccountRegisterRequest,
      );
    } finally {
      await authApplicationBloc?.dispose();
    }

    if (registrationResult.isPossibleToLogin) {
      successRegistrationStreamController.add(registrationResult);
    }
    return registrationResult;
  }

  StreamController<AuthHostRegistrationResult>
      successRegistrationStreamController = StreamController.broadcast();

  @override
  Stream<AuthHostRegistrationResult> get successRegistrationStream =>
      successRegistrationStreamController.stream;

  @override
  bool get isReadyToSubmit =>
      registerAuthInstanceFormBloc.isHaveChangesAndNoErrors;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      registerAuthInstanceFormBloc.isHaveChangesAndNoErrorsStream;

  @override
  Future internalAsyncInit() async {
    pleromaInstance = await pleromaInstanceService.getInstance();

    registerAuthInstanceFormBloc = RegisterAuthInstanceFormBloc(
      pleromaCaptchaService: pleromaCaptchaService,
      instanceBaseUri: instanceBaseUri,
      localizationSettingsBloc: localizationSettingsBloc,
      approvalRequired: pleromaInstance.approvalRequired,
    );
    addDisposable(disposable: registerAuthInstanceFormBloc);
  }
}

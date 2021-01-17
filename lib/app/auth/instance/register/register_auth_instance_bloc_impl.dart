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
import 'package:fedi/pleroma/captcha/pleroma_captcha_service.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/widgets.dart';

class RegisterAuthInstanceBloc extends AsyncInitLoadingBloc
    implements IRegisterAuthInstanceBloc {
  final Uri instanceBaseUrl;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalizationSettingsBloc localizationSettingsBloc;

  IPleromaInstance pleromaInstance;
  IRestService restService;
  IPleromaRestService pleromaRestService;
  IPleromaCaptchaService pleromaCaptchaService;

  IPleromaInstanceService pleromaInstanceService;

  @override
  RegisterAuthInstanceFormBloc registerAuthInstanceFormBloc;

  RegisterAuthInstanceBloc({
    @required this.instanceBaseUrl,
    @required this.localPreferencesService,
    @required this.connectionService,
    @required this.currentInstanceBloc,
    @required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    @required this.localizationSettingsBloc,
  }) : super() {
    restService = RestService(baseUrl: instanceBaseUrl);
    pleromaRestService = PleromaRestService(
      isPleromaInstance: false,
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
    addDisposable(disposable: registerAuthInstanceFormBloc);
    addDisposable(disposable: pleromaInstanceService);
  }

  @override
  Future<AuthHostRegistrationResult> submit() async {
    var pleromaAccountRegisterRequest =
        registerAuthInstanceFormBloc.calculateRegisterFormData();

    AuthHostRegistrationResult registrationResult;
    AuthHostBloc authApplicationBloc;
    try {
      authApplicationBloc = AuthHostBloc(
        instanceBaseUrl: instanceBaseUrl,
        isPleromaInstance: false,
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

    if (registrationResult != null) {
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
      instanceBaseUrl: instanceBaseUrl,
      localizationSettingsBloc: localizationSettingsBloc,
      approvalRequired: pleromaInstance.approvalRequired,
    );
  }
}

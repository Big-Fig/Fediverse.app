import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAuthHostBloc extends IDisposable {
  bool get isHostApplicationRegistered;

  UnifediApiClientApplication? get hostApplication;

  Stream<UnifediApiClientApplication?> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  UnifediApiOAuthToken? get hostAccessToken;

  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream;

  Future<AuthInstance> loginWithAuthCode(String authCode);

  Future registerApplication();

  Future<bool> retrieveAppAccessToken();

  Future<AuthInstance?> launchLoginToAccount();

  Future<AuthHostRegistrationResult> registerAccount({
    required IUnifediApiAccountPublicRegisterRequest request,
  });

  Future checkApplicationRegistration();

  Future checkIsRegistrationsEnabled();

  Future logout();
}

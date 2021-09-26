import 'package:fedi/app/auth/host/auth_host_model.dart';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAuthHostBloc extends IDisposable {
  bool get isHostApplicationRegistered;

  UnifediApiClientApplication? get hostApplication;

  Stream<UnifediApiClientApplication?> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  UnifediApiOAuthToken? get hostAccessToken;

  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream;

  Future<UnifediApiAccess> loginWithAuthCode(String authCode);

  Future registerApplication();

  Future<UnifediApiAccess?> launchLoginToAccount();

  Future<AuthHostRegistrationResult> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  });

  Future checkApplicationRegistration();

  Future checkIsRegistrationsEnabled();

  Future logout();
}

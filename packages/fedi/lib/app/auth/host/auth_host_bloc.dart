import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/register/response/register_response_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAuthHostBloc extends IDisposable {
  bool get isHostApplicationRegistered;

  UnifediApiClientApplication? get hostApplication;

  Stream<UnifediApiClientApplication?> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  UnifediApiOAuthToken? get hostAccessToken;

  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream;

  Future<UnifediApiAccess> loginWithAuthCode(String authCode);

  Future<void> registerApplication();

  Future<UnifediApiAccess?> launchLoginToAccount();

  Future<RegisterResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  });

  Future<void> logout();
}
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccessHostBloc extends IDisposable {
  bool get isHostApplicationRegistered;

  UnifediApiClientApplication? get hostApplication;

  Stream<UnifediApiClientApplication?> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  UnifediApiOAuthToken? get hostAccessToken;

  Stream<UnifediApiOAuthToken?> get hostAccessTokenStream;

  Future<UnifediApiAccess> loginWithAuthCode(String authCode);

  Future<void> registerApplication();

  Future<UnifediApiAccess?> launchLoginToAccount();

  Future<RegisterAccessResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  });

  Future<void> logout();
}

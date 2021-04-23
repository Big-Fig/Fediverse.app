import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_model.dart';

abstract class IAuthHostBloc extends IDisposable {
  bool get isHostApplicationRegistered;

  PleromaClientApplication? get hostApplication;

  Stream<PleromaClientApplication?> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  PleromaOAuthToken? get hostAccessToken;

  Stream<PleromaOAuthToken?> get hostAccessTokenStream;

  Future<AuthInstance> loginWithAuthCode(String authCode);

  Future<bool> registerApplication();

  Future<bool> retrieveAppAccessToken();

  Future<AuthInstance?> launchLoginToAccount();

  Future<AuthHostRegistrationResult> registerAccount({
    required IPleromaAccountRegisterRequest request,
  });

  Future checkApplicationRegistration();

  Future checkIsRegistrationsEnabled();

  Future logout();
}

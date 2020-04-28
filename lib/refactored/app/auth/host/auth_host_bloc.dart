import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';

abstract class IAuthHostBloc extends Disposable {
  bool get isHostApplicationRegistered;

  PleromaClientApplication get hostApplication;

  Stream<PleromaClientApplication> get hostApplicationStream;

  bool get isHostAccessTokenExist;

  PleromaOAuthToken get hostAccessToken;

  Stream<PleromaOAuthToken> get hostAccessTokenStream;

  Future<bool> registerApplication();

  Future<bool> retrieveAppAccessToken();

  Future<AuthInstance> launchLoginToAccount();

  Future<bool> registerAccount(
      {@required IPleromaAccountRegisterRequest request});

  Future logout();
}

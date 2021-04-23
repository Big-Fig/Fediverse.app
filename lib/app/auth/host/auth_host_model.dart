import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';

class DisabledRegistrationAuthHostException implements Exception {
  const DisabledRegistrationAuthHostException();
}

class InvitesOnlyRegistrationAuthHostException implements Exception {
  const InvitesOnlyRegistrationAuthHostException();
}

class EmailConfirmationRequiredAuthHostException implements Exception {
  const EmailConfirmationRequiredAuthHostException();
}

class CantRetrieveAppTokenAuthHostException implements Exception {
  const CantRetrieveAppTokenAuthHostException();
}

class CantRegisterAppAuthHostException implements Exception {
  const CantRegisterAppAuthHostException();
}

class AuthHostRegistrationResult {
  bool? get approvalRequired => pleromaInstance.approvalRequired;

  final dynamic authInstanceFetchError;
  final PleromaOAuthToken token;
  final IPleromaInstance pleromaInstance;
  final AuthInstance? authInstance;

  AuthHostRegistrationResult({
    required this.authInstanceFetchError,
    required this.token,
    required this.pleromaInstance,
    required this.authInstance,
  });

  bool get isPossibleToLogin =>
      authInstance != null &&
      !approvalRequired! &&
      !emailConfirmationRequired &&
      authInstanceFetchError == null;

  bool get emailConfirmationRequired =>
      authInstanceFetchError is EmailConfirmationRequiredAuthHostException;

  @override
  String toString() {
    return 'AuthHostRegistrationResult{'
        'authInstanceFetchError: $authInstanceFetchError, '
        'token: $token, '
        'pleromaInstance: $pleromaInstance, '
        'authInstance: $authInstance'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHostRegistrationResult &&
          runtimeType == other.runtimeType &&
          authInstanceFetchError == other.authInstanceFetchError &&
          token == other.token &&
          pleromaInstance == other.pleromaInstance &&
          authInstance == other.authInstance;

  @override
  int get hashCode =>
      authInstanceFetchError.hashCode ^
      token.hashCode ^
      pleromaInstance.hashCode ^
      authInstance.hashCode;
}

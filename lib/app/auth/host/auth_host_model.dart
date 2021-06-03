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
  final DisabledRegistrationAuthHostException?
      disabledRegistrationAuthHostException;
  final InvitesOnlyRegistrationAuthHostException?
      invitesOnlyRegistrationAuthHostException;
  final EmailConfirmationRequiredAuthHostException?
      emailConfirmationRequiredAuthHostException;
  final CantRetrieveAppTokenAuthHostException?
      cantRetrieveAppTokenAuthHostException;
  final CantRegisterAppAuthHostException? cantRegisterAppAuthHostException;
  final dynamic unknownHostException;
  final PleromaApiOAuthToken token;
  final IPleromaApiInstance pleromaInstance;
  final AuthInstance? authInstance;

  AuthHostRegistrationResult({
    required this.disabledRegistrationAuthHostException,
    required this.invitesOnlyRegistrationAuthHostException,
    required this.emailConfirmationRequiredAuthHostException,
    required this.cantRetrieveAppTokenAuthHostException,
    required this.cantRegisterAppAuthHostException,
    required this.unknownHostException,
    required this.token,
    required this.pleromaInstance,
    required this.authInstance,
  });

  AuthHostRegistrationResult.noErrors({
    required PleromaApiOAuthToken token,
    required IPleromaApiInstance pleromaInstance,
    required AuthInstance? authInstance,
  }) : this(
          token: token,
          pleromaInstance: pleromaInstance,
          authInstance: authInstance,
          disabledRegistrationAuthHostException: null,
          invitesOnlyRegistrationAuthHostException: null,
          emailConfirmationRequiredAuthHostException: null,
          cantRetrieveAppTokenAuthHostException: null,
          cantRegisterAppAuthHostException: null,
          unknownHostException: null,
        );

  dynamic get anyError =>
      disabledRegistrationAuthHostException ??
      invitesOnlyRegistrationAuthHostException ??
      emailConfirmationRequiredAuthHostException ??
      cantRetrieveAppTokenAuthHostException ??
      cantRegisterAppAuthHostException ??
      unknownHostException;

  bool get approvalRequired => pleromaInstance.approvalRequired == true;

  bool get isHaveNoErrors =>
      disabledRegistrationAuthHostException == null &&
      invitesOnlyRegistrationAuthHostException == null &&
      emailConfirmationRequiredAuthHostException == null &&
      cantRetrieveAppTokenAuthHostException == null &&
      cantRegisterAppAuthHostException == null &&
      unknownHostException == null;

  bool get isAuthInstanceExist => authInstance != null;

  bool get isPossibleToLogin =>
      isAuthInstanceExist &&
      !approvalRequired &&
      !emailConfirmationRequired &&
      isHaveNoErrors;

  bool get emailConfirmationRequired =>
      emailConfirmationRequiredAuthHostException != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHostRegistrationResult &&
          runtimeType == other.runtimeType &&
          disabledRegistrationAuthHostException ==
              other.disabledRegistrationAuthHostException &&
          invitesOnlyRegistrationAuthHostException ==
              other.invitesOnlyRegistrationAuthHostException &&
          emailConfirmationRequiredAuthHostException ==
              other.emailConfirmationRequiredAuthHostException &&
          cantRetrieveAppTokenAuthHostException ==
              other.cantRetrieveAppTokenAuthHostException &&
          cantRegisterAppAuthHostException ==
              other.cantRegisterAppAuthHostException &&
          unknownHostException == other.unknownHostException &&
          token == other.token &&
          pleromaInstance == other.pleromaInstance &&
          authInstance == other.authInstance;

  @override
  int get hashCode =>
      disabledRegistrationAuthHostException.hashCode ^
      invitesOnlyRegistrationAuthHostException.hashCode ^
      emailConfirmationRequiredAuthHostException.hashCode ^
      cantRetrieveAppTokenAuthHostException.hashCode ^
      cantRegisterAppAuthHostException.hashCode ^
      unknownHostException.hashCode ^
      token.hashCode ^
      pleromaInstance.hashCode ^
      authInstance.hashCode;

  @override
  String toString() => 'AuthHostRegistrationResult{'
        'disabledRegistrationAuthHostException: '
        '$disabledRegistrationAuthHostException, '
        'invitesOnlyRegistrationAuthHostException: '
        '$invitesOnlyRegistrationAuthHostException, '
        'emailConfirmationRequiredAuthHostException: '
        '$emailConfirmationRequiredAuthHostException, '
        'cantRetrieveAppTokenAuthHostException: '
        '$cantRetrieveAppTokenAuthHostException, '
        'cantRegisterAppAuthHostException: '
        '$cantRegisterAppAuthHostException, '
        'unknownHostException: $unknownHostException, '
        'token: $token, '
        'pleromaInstance: $pleromaInstance, '
        'authInstance: $authInstance'
        '}';
}
